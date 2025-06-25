import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:frutes_app/core/services/get_it_services.dart';
import 'package:frutes_app/core/widgets/butn.dart';
import 'package:frutes_app/core/theme/colors_theme.dart';
import '../../../data/models/address_model.dart';
import '../../../domain/Repositories/address_repository.dart';
import '../../manager/address_cubit.dart';
import 'custom_address_form.dart';
import 'custom_address_list.dart';

class CustomAddressPage extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback? onBack;
  const CustomAddressPage({super.key, required this.onNext, this.onBack});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddressCubit(getIt<AddressRepository>()),
      child: _CustomAddressPageBody(onNext: onNext, onBack: onBack),
    );
  }
}

class _CustomAddressPageBody extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback? onBack;
  const _CustomAddressPageBody({required this.onNext, this.onBack});

  @override
  State<_CustomAddressPageBody> createState() => _CustomAddressPageBodyState();
}

class _CustomAddressPageBodyState extends State<_CustomAddressPageBody> {
  int? selectedIndex;
  bool showForm = false;
  bool saveAddress = false;
  bool isEditing = false;
  int? editingIndex;
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _detailsController = TextEditingController();

  void _editAddress(int index) {
    final addresses = context.read<AddressCubit>().state;
    if (index < addresses.length) {
      final address = addresses[index];
      setState(() {
        isEditing = true;
        editingIndex = index;
        showForm = true;
        _fullNameController.text = address.fullName;
        _emailController.text = address.email;
        _addressController.text = address.address;
        _cityController.text = address.city;
        _detailsController.text = address.details;
      });
    }
  }

  void _clearForm() {
    setState(() {
      isEditing = false;
      editingIndex = null;
      showForm = false;
      _fullNameController.clear();
      _emailController.clear();
      _addressController.clear();
      _cityController.clear();
      _detailsController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, List<AddressModel>>(
      builder: (context, addresses) {
        // Show different buttons based on selection
        final hasSelectedAddress = selectedIndex != null;

        return Column(
          children: [
            Expanded(
              child: (addresses.isEmpty || showForm)
                  ? CustomAddressForm(
                      formKey: _formKey,
                      fullNameController: _fullNameController,
                      emailController: _emailController,
                      addressController: _addressController,
                      cityController: _cityController,
                      detailsController: _detailsController,
                      onSaved: () {
                        final address = AddressModel(
                          fullName: _fullNameController.text,
                          email: _emailController.text,
                          address: _addressController.text,
                          city: _cityController.text,
                          details: _detailsController.text,
                        );
                        if (isEditing && editingIndex != null) {
                          // Update existing address
                          final existingAddress = addresses[editingIndex!];
                          final updatedAddress = AddressModel(
                            id: existingAddress.id,
                            fullName: _fullNameController.text,
                            email: _emailController.text,
                            address: _addressController.text,
                            city: _cityController.text,
                            details: _detailsController.text,
                            userId: existingAddress.userId,
                          );
                          context
                              .read<AddressCubit>()
                              .updateAddress(updatedAddress);
                        } else {
                          // Add new address
                          context.read<AddressCubit>().addAddress(address);
                        }
                        _clearForm();
                        setState(() {
                          selectedIndex = addresses
                              .length; // Select the newly added address
                        });
                      },
                      onCancel: context.read<AddressCubit>().state.isNotEmpty
                          ? () => _clearForm()
                          : null,
                      saveAddress: saveAddress,
                      onSaveAddressChanged: (val) =>
                          setState(() => saveAddress = val),
                    )
                  : AddressListWidget(
                      addresses: addresses,
                      selectedIndex: selectedIndex,
                      onSelect: (val) => setState(() => selectedIndex = val),
                      onDelete: (index) {
                        final address = addresses[index];
                        if (address.id != null) {
                          context
                              .read<AddressCubit>()
                              .deleteAddress(address.id!);
                        } else {
                          context
                              .read<AddressCubit>()
                              .deleteAddressByIndex(index);
                        }
                        if (selectedIndex == index) {
                          setState(() => selectedIndex = null);
                        }
                      },
                      onEdit: _editAddress,
                      onAddNew: () => setState(() => showForm = true),
                    ),
            ),
            // Custom buttons based on selection
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  if (widget.onBack != null)
                    Expanded(
                      child: Butn(
                        text: 'رجوع',
                        onPressed: widget.onBack!,
                        color: AppColors.grayscale400,
                      ),
                    ),
                  if (widget.onBack != null) SizedBox(width: 12.w),
                  Expanded(
                    flex: 2,
                    child: Butn(
                      text: hasSelectedAddress ? 'التالي' : 'اضف عنوان',
                      onPressed: hasSelectedAddress
                          ? () {
                              if (showForm && saveAddress) {
                                if (_formKey.currentState!.validate()) {
                                  final address = AddressModel(
                                    fullName: _fullNameController.text,
                                    email: _emailController.text,
                                    address: _addressController.text,
                                    city: _cityController.text,
                                    details: _detailsController.text,
                                  );
                                  if (isEditing && editingIndex != null) {
                                    // Update existing address
                                    final existingAddress =
                                        addresses[editingIndex!];
                                    final updatedAddress = AddressModel(
                                      id: existingAddress.id,
                                      fullName: _fullNameController.text,
                                      email: _emailController.text,
                                      address: _addressController.text,
                                      city: _cityController.text,
                                      details: _detailsController.text,
                                      userId: existingAddress.userId,
                                    );
                                    context
                                        .read<AddressCubit>()
                                        .updateAddress(updatedAddress);
                                  } else {
                                    // Add new address
                                    context
                                        .read<AddressCubit>()
                                        .addAddress(address);
                                  }
                                  _clearForm();
                                  setState(() {
                                    selectedIndex = addresses
                                        .length; // Select the newly added address
                                  });
                                } else {
                                  return;
                                }
                              }
                              widget.onNext();
                            }
                          : () => setState(() => showForm = true),
                      color: hasSelectedAddress
                          ? AppColors.green1_500
                          : AppColors.orange500,
                    ),
                  ),
                ],
              ),
            ),
            Gap(16.h),
          ],
        );
      },
    );
  }
}
