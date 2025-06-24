import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frutes_app/Features/check_out/presentation/widgets/shipping_page_view.dart';
import 'checkout_page_base.dart';

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
          _buildAddressPage(),
          _buildPaymentPage(),
          _buildDeliveryPage(),
        ],
      ),
    );
  }

  Widget _buildAddressPage() {
    return CheckoutPageBase(
      onNext: _goToNextPage,
      child: const Center(
        child: Text('صفحة العنوان'),
      ),
    );
  }

  Widget _buildPaymentPage() {
    return CheckoutPageBase(
      onNext: _goToNextPage,
      child: const Center(
        child: Text('صفحة المدفوع'),
      ),
    );
  }

  Widget _buildDeliveryPage() {
    return CheckoutPageBase(
      onNext: () {
        // Handle order confirmation
      },
      isLastStep: true,
      child: const Center(
        child: Text('صفحة التوصيل'),
      ),
    );
  }
}
