import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/manager/cubit/sign_out_cubit.dart';
import 'package:frutes_app/Features/Home/Profile/presentation/view/orders_view.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/core/widgets/custom_app_bar.dart';
import 'package:frutes_app/main.dart';

import '../../../../../core/routes/page_routes_name.dart';
import '../../../../../core/theme/colors_theme.dart';
import '../../../../../core/widgets/custom_header.dart';
import '../../../../../core/functions/get_user.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = getUser();

    return Scaffold(
      appBar: headerAppBar(context,
          title: 'حسابي',
          arrowOnTap: () {},
          arrowVisible: false,
          notificationVisible: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Section - الصورة والاسم
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // صورة المستخدم
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.green1_500.withOpacity(0.1),
                    child: const Icon(
                      Icons.person,
                      size: 35,
                      color: AppColors.green1_500,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // معلومات المستخدم
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name.isNotEmpty ? user.name : 'المستخدم',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.email,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Menu Items - قائمة الخيارات
            Expanded(
              child: Column(
                children: [
                  // زر الطلبات
                  _buildMenuItem(
                    context,
                    icon: Icons.shopping_bag_outlined,
                    title: 'طلباتي',
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutesName.ordersView);
                    },
                  ),

                  const SizedBox(height: 12),

                  // زر الملف الشخصي
                  _buildMenuItem(
                    context,
                    icon: Icons.person_outline,
                    title: 'الملف الشخصي',
                    onTap: () {
                      // TODO: الانتقال لصفحة الملف الشخصي
                    },
                  ),

                  const SizedBox(height: 12),

                  // زر المفضلة
                  _buildMenuItem(
                    context,
                    icon: Icons.favorite_outline,
                    title: 'المفضلة',
                    onTap: () {
                      // TODO: الانتقال لصفحة المفضلة
                    },
                  ),

                  const SizedBox(height: 12),

                  // زر الإشعارات
                  _buildMenuItem(
                    context,
                    icon: Icons.notifications_outlined,
                    title: 'الإشعارات',
                    onTap: () {
                      // TODO: الانتقال لصفحة الإشعارات
                    },
                  ),

                  const SizedBox(height: 12),

                  // زر اللغة
                  _buildMenuItem(
                    context,
                    icon: Icons.language_outlined,
                    title: 'اللغة',
                    onTap: () {
                      // TODO: الانتقال لصفحة اللغة
                    },
                  ),

                  const SizedBox(height: 12),

                  // زر الثيم
                  _buildMenuItem(
                    context,
                    icon: Icons.dark_mode_outlined,
                    title: 'الثيم',
                    onTap: () {
                      // TODO: الانتقال لصفحة الثيم
                    },
                  ),
                ],
              ),
            ),

            // زر تسجيل الخروج
            Butn(
              text: "تسجيل خروج",
              color: AppColors.green1_500,
              onPressed: () {
                context.read<SignOutCubit>().signOut();
                navigatorKey.currentState
                    ?.pushReplacementNamed(PageRoutesName.signin);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.green1_500,
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
