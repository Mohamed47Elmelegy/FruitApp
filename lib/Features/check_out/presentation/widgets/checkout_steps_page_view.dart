import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/shipping_page_view.dart';
import 'ConfirmOrder/custom_comfirm_order.dart';
import 'checkout_page_base.dart';
import 'address/custom_address_page.dart';

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

  void _goToNextPage() {
    final nextPage = widget.currentStep + 1;
    if (nextPage < 4) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onPageChanged(nextPage);
    }
  }

  void _goToPreviousPage() {
    final prevPage = widget.currentStep - 1;
    if (prevPage >= 0) {
      _pageController.animateToPage(
        prevPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      widget.onPageChanged(prevPage);
    }
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
          ShippingPageView(onNext: _goToNextPage),
          CustomAddressPage(
            onNext: _goToNextPage,
            onBack: widget.currentStep > 0 ? _goToPreviousPage : null,
          ),
          // _buildPaymentPage(),
          const CustomConfirmOrderPage(),
        ],
      ),
    );
  }

  // Widget _buildPaymentPage() {
  //   return CheckoutPageBase(
  //     onNext: _goToNextPage,
  //     onBack: widget.currentStep > 0 ? _goToPreviousPage : null,
  //     child: const Center(
  //       child: Text('صفحة المدفوع'),
  //     ),
  //   );
  // }

  // Widget _buildOrderConfirmationPage() {
  //   return CheckoutPageBase(
  //     onNext: () {
  //       // Handle order confirmation
  //     },
  //     isLastStep: true,
  //     onBack: widget.currentStep > 0 ? _goToPreviousPage : null,
  //     child: const Center(
  //       child: Text('صفحة التوصيل'),
  //     ),
  //   );
  // }
}
