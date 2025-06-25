# Address Management with Firebase Firestore

This implementation provides a complete address management system using Firebase Firestore with offline support through Hive.

## Architecture

The implementation follows Clean Architecture principles with the following layers:

### Domain Layer
- `AddressEntity`: Abstract domain entity
- `AddressRepository`: Abstract repository interface

### Data Layer
- `AddressModel`: Data model implementing the domain entity
- `AddressRepositoryImpl`: Pure Firestore implementation
- `AddressRepositoryHybrid`: Hybrid implementation (Hive + Firestore)
- `AddressRepositoryHive`: Pure Hive implementation

## Features

### 1. Firebase Firestore Integration
- Real-time synchronization with Firestore
- User-specific address storage
- Automatic user authentication integration
- Error handling and fallback mechanisms

### 2. Offline Support
- Hive local storage for offline functionality
- Automatic sync when online
- Graceful degradation when Firestore is unavailable

### 3. CRUD Operations
- Create new addresses
- Read user addresses
- Update existing addresses
- Delete addresses by ID or index

## Usage

### Basic Usage

```dart
// Get the repository from dependency injection
final addressRepo = getIt<AddressRepository>();

// Add a new address
final address = AddressModel(
  fullName: 'John Doe',
  email: 'john@example.com',
  address: '123 Main St',
  city: 'New York',
  details: 'Apartment 4B',
);

await addressRepo.addAddress(address);

// Get all addresses for current user
final addresses = await addressRepo.getAddresses();

// Delete an address
await addressRepo.deleteAddress(addressId);
```

### Using with BLoC/Cubit

```dart
class AddressCubit extends Cubit<List<AddressModel>> {
  final AddressRepository repository;

  AddressCubit(this.repository) : super([]) {
    loadAddresses();
  }

  Future<void> loadAddresses() async {
    final addresses = await repository.getAddresses();
    emit(addresses.cast<AddressModel>());
  }

  Future<void> addAddress(AddressModel address) async {
    await repository.addAddress(address);
    await loadAddresses();
  }
}
```

## Repository Implementations

### 1. AddressRepositoryHybrid (Recommended)
- Uses both Hive and Firestore
- Provides offline-first experience
- Automatically syncs when online
- Best for production applications

### 2. AddressRepositoryImpl (Firestore Only)
- Pure Firestore implementation
- Requires internet connection
- Best for online-only applications

### 3. AddressRepositoryHive (Local Only)
- Pure Hive implementation
- Works offline
- Best for offline-only applications

## Firestore Collection Structure

```
addresses/
  ├── documentId1/
  │   ├── fullName: "John Doe"
  │   ├── email: "john@example.com"
  │   ├── address: "123 Main St"
  │   ├── city: "New York"
  │   ├── details: "Apartment 4B"
  │   ├── userId: "user123"
  │   └── createdAt: 1640995200000
  └── documentId2/
      └── ...
```

## Security Rules

Make sure your Firestore security rules allow authenticated users to access their addresses:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /addresses/{document} {
      allow read, write: if request.auth != null && 
        request.auth.uid == resource.data.userId;
    }
  }
}
```

## Error Handling

The implementation includes comprehensive error handling:

- Network connectivity issues
- Authentication failures
- Firestore permission errors
- Data validation errors

## Dependencies

Make sure you have the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  cloud_firestore: ^4.x.x
  firebase_auth: ^4.x.x
  hive: ^2.x.x
  hive_flutter: ^1.x.x
  get_it: ^7.x.x
  flutter_bloc: ^8.x.x
```

## Setup

1. Initialize Firebase in your app
2. Set up dependency injection in `get_it_services.dart`
3. Register the repository implementation
4. Use the repository in your BLoC/Cubit

The implementation is ready to use and provides a robust, scalable solution for address management in your Flutter application. 