import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/check_out/presentation/view/shipping_page_view.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/colors_theme.dart';
import '../../../../core/theme/text_theme.dart';

class CheckoutStepsPageView extends StatefulWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.currentStep,
    required this.onPageChanged,
  });

  final int currentStep;
  final Function(int) onPageChanged;

  @override
  State<CheckoutStepsPageView> createState() => _CheckoutStepsPageViewState();
}

class _CheckoutStepsPageViewState extends State<CheckoutStepsPageView> {
  late PageController _pageController;
  int selectedPaymentMethod = 0; // 0 for cash, 1 for card

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentStep);
  }

  @override
  void didUpdateWidget(CheckoutStepsPageView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentStep != widget.currentStep) {
      _pageController.animateToPage(
        widget.currentStep,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.h,
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: widget.onPageChanged,
        children: [
        const ShippingPageView(),
          _buildAddressPage(),
          _buildPaymentPage(),
          _buildDeliveryPage(),
        ],
      ),
    );
  }



  Widget _buildAddressPage() {
    return const Center(
      child: Text('صفحة العنوان'),
    );
  }

  Widget _buildPaymentPage() {
    return const Center(
      child: Text('صفحة المدفوع'),
    );
  }

  Widget _buildDeliveryPage() {
    return const Center(
      child: Text('صفحة التوصيل'),
    );
  }
}
