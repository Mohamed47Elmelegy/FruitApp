# 🍎 Fruit App Integration Guide

## 📋 Overview

This guide outlines the integration between the **Customer Mobile App** and **Admin Dashboard** for the Fruit App project.

## 🏗️ Architecture

### **Two Separate Applications**
1. **Customer App** (`Fruit App/`) - Customer-facing mobile application
2. **Admin Dashboard** (`fruit_app_dashbord/`) - Admin management interface

### **Shared Backend**
- **Firebase Project**: `furute-fefa1`
- **Services**: Firestore, Auth, Storage, Realtime Database
- **Security**: Role-based access control

## 🔐 Security & Authentication

### **User Roles**
- **Customer**: Can browse products, place orders, manage profile
- **Admin**: Can manage products, orders, users, and system settings

### **Firestore Security Rules**
```javascript
// Enhanced security rules with role-based access
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    // Helper functions
    function isAdmin() {
      return request.auth != null && 
             exists(/databases/$(database)/documents/admins/$(request.auth.uid));
    }
    
    function isCustomer() {
      return request.auth != null && 
             exists(/databases/$(database)/documents/users/$(request.auth.uid));
    }

    // Products - public read, admin write
    match /products/{productId} {
      allow read: if true;
      allow write: if isAdmin();
    }

    // Orders - customers create, admins manage
    match /orders/{orderId} {
      allow read: if request.auth != null && 
        (isAdmin() || resource.data.userId == request.auth.uid);
      allow create: if isCustomer() && 
        request.resource.data.userId == request.auth.uid;
      allow update, delete: if isAdmin();
    }

    // Users - self-access + admin access
    match /users/{userId} {
      allow read, write: if request.auth != null && 
        (isAdmin() || request.auth.uid == userId);
    }

    // Admins - admin only
    match /admins/{adminId} {
      allow read, write: if isAdmin();
    }
  }
}
```

## 📦 Product Integration

### **Product Flow**
1. **Admin Dashboard** → Add/Edit Products → **Firestore**
2. **Customer App** → Read Products → **Display to Customers**

### **Product Model Structure**
```dart
class ProductModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeatured;
  String? imageUrl;
  final int expiryDateMonths;
  final int calorieDensity;
  final int unitAmount;
  final num productRating;
  final num ratingCount;
  final bool isOrganic;
  final List<ReviewsModel> reviews;
  final num sellingCount;
  final bool isActive; // New field for soft delete
  final DateTime? createdAt;
  final DateTime? updatedAt;
}
```

### **Product Operations**

#### **Admin Dashboard (fruit_app_dashbord)**
```dart
// Add new product
final productService = ProductIntegrationService();
await productService.addProduct(productData, imageFile);

// Update product
await productService.updateProduct(productId, productData, imageFile);

// Delete product (soft delete)
await productService.deleteProduct(productId);

// Get all products for management
final products = await productService.getAllProducts();
```

#### **Customer App (Fruit App)**
```dart
// Get active products
final products = await productService.getActiveProducts();

// Get featured products
final featured = await productService.getFeaturedProducts();

// Get best selling products
final bestSelling = await productService.getBestSellingProducts();

// Search products
final searchResults = await productService.searchProducts(query);
```

## 📋 Order Integration

### **Order Flow**
1. **Customer App** → Place Order → **Firestore**
2. **Admin Dashboard** → View/Manage Orders → **Update Status**

### **Enhanced Order Model**
```dart
class OrderModel {
  final String uid;
  final List<Map<String, dynamic>> products;
  final double subtotal;
  final double delivery;
  final double total;
  final String createdAt;
  final Map<String, dynamic>? address;
  final String status;
  final String? trackingNumber;
  final String? orderId;
  
  // Admin management fields
  final String? adminNotes;
  final String? assignedAdminId;
  final DateTime? lastUpdated;
  final List<OrderStatusHistory> statusHistory;
}
```

### **Order Operations**

#### **Customer App**
```dart
// Place new order
final orderService = OrderService();
await orderService.placeOrder(orderData);

// Get user orders
final userOrders = await orderService.getUserOrders();

// Track order
final tracking = await orderService.getOrderTracking(orderId);
```

#### **Admin Dashboard**
```dart
// Get all orders
final orderService = OrderManagementService();
final allOrders = await orderService.getAllOrders();

// Update order status
await orderService.updateOrderStatus(orderId, 'confirmed', notes: 'Order confirmed');

// Add admin notes
await orderService.addOrderNotes(orderId, 'Customer requested early delivery');

// Get order statistics
final stats = await orderService.getOrderStatistics();
```

## 👥 User Management

### **User Role Service**
```dart
class UserRoleService {
  // Check user role
  Future<UserRole> getCurrentUserRole();
  
  // Create user profile
  Future<void> createUserProfile({
    required String uid,
    required String email,
    required String name,
    UserRole role = UserRole.customer,
  });
  
  // Update user profile
  Future<void> updateUserProfile(String uid, Map<String, dynamic> data);
}
```

### **User Operations**
```dart
// Create customer account
await userRoleService.createUserProfile(
  uid: user.uid,
  email: user.email!,
  name: user.displayName ?? '',
  role: UserRole.customer,
);

// Create admin account
await userRoleService.createUserProfile(
  uid: user.uid,
  email: user.email!,
  name: user.displayName ?? '',
  role: UserRole.admin,
);

// Check if user is admin
final isAdmin = await userRoleService.isAdmin();
```

## 🗂️ Collection Structure

### **Firebase Collections**
```dart
class FirebaseCollections {
  // Products
  static const String products = 'products';
  static const String productCategories = 'productCategories';
  
  // Orders
  static const String orders = 'orders';
  static const String orderStatus = 'orderStatus';
  
  // Users
  static const String users = 'users';
  static const String admins = 'admins';
  
  // Addresses
  static const String addresses = 'addresses';
  
  // Discounts
  static const String discountCodes = 'discountCodes';
  
  // Analytics
  static const String salesStats = 'salesStats';
  static const String productStats = 'productStats';
}
```

## 🖼️ Image Management

### **Storage Structure**
```
Firebase Storage:
├── products/images/
│   ├── product_code_timestamp.jpg
│   └── ...
├── users/avatars/
│   └── ...
└── app/assets/
    └── ...
```

### **Image Operations**
```dart
// Upload product image (Admin Dashboard)
final imageUrl = await uploadProductImage(imageFile, productCode);

// Display product image (Customer App)
Image.network(product.imageUrl)
```

## 📊 Analytics & Statistics

### **Sales Analytics**
```dart
// Get order statistics
final stats = await orderService.getOrderStatistics();
// Returns: totalOrders, pendingOrders, confirmedOrders, 
//          processingOrders, shippedOrders, deliveredOrders, 
//          cancelledOrders, totalRevenue

// Get product statistics
final productStats = await productService.getProductStatistics();
// Returns: totalProducts, activeProducts, featuredProducts,
//          bestSellingProducts, lowStockProducts
```

## 🔄 Real-time Updates

### **Firestore Listeners**
```dart
// Listen to order status changes (Customer App)
FirebaseFirestore.instance
  .collection('orders')
  .doc(orderId)
  .snapshots()
  .listen((snapshot) {
    // Update UI when order status changes
  });

// Listen to new orders (Admin Dashboard)
FirebaseFirestore.instance
  .collection('orders')
  .where('status', isEqualTo: 'pending')
  .snapshots()
  .listen((snapshot) {
    // Show notification for new pending orders
  });
```

## 🚀 Deployment & Configuration

### **Environment Configuration**
```dart
// Development
const firebaseProjectId = 'furute-fefa1-dev';

// Production
const firebaseProjectId = 'furute-fefa1';
```

### **Build Configuration**
```bash
# Customer App
cd "Fruit App"
flutter build apk --release

# Admin Dashboard
cd fruit_app_dashbord
flutter build apk --release
```

## 🔧 Troubleshooting

### **Common Issues**

1. **Permission Denied**
   - Check user role in Firestore
   - Verify security rules
   - Ensure user is authenticated

2. **Products Not Syncing**
   - Check `isActive` field in products
   - Verify collection name consistency
   - Check network connectivity

3. **Orders Not Updating**
   - Verify order status values match constants
   - Check admin permissions
   - Ensure order ID exists

### **Debug Tools**
```dart
// Enable Firestore debug logging
FirebaseFirestore.instance.settings = Settings(
  persistenceEnabled: true,
  cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
);
```

## 📝 Best Practices

1. **Always use constants** for collection names and status values
2. **Implement proper error handling** for all Firebase operations
3. **Use soft deletes** instead of hard deletes for data integrity
4. **Cache frequently accessed data** to improve performance
5. **Implement proper loading states** for better UX
6. **Use real-time listeners** for critical data updates
7. **Validate data** before saving to Firestore
8. **Implement proper logging** for debugging

## 🔮 Future Enhancements

1. **Push Notifications** for order updates
2. **Offline Support** with local caching
3. **Advanced Search** with Algolia integration
4. **Analytics Dashboard** with charts and graphs
5. **Multi-language Support** for international users
6. **Payment Integration** with multiple gateways
7. **Inventory Management** with low stock alerts
8. **Customer Support** chat integration

---

**Last Updated**: December 2024
**Version**: 1.0
**Maintainer**: Development Team 