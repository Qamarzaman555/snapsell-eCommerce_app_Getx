import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/address/address_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      AppLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Fetch selected addresses
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Clear the 'Selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelctedField(
            selectedAddress.value.id, false);
      }
      // Assign selected Address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the selected "address" firld to the newly selected address
      await addressRepository.updateSelctedField(
          selectedAddress.value.id, true);
    } catch (e) {
      AppLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
    }
  }

  /// Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  /// Add New Address
  Future addNewAddress() async {
    try {
      // Start Loading
      AppFullScreenLoader.openLoadingDialog(
          'Storing Address...', AppImages.docerAnimation);

      // Check Internet Activity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      // FormValidation
      if (!addressFormKey.currentState!.validate()) {
        AppFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
      );

      final id = await addressRepository.addAddress(address);

      // Update Selected  Address status
      address.id = id;
      await selectedAddress(address);

      // Remove Loader
      AppFullScreenLoader.stopLoading();

      // Show Success Message
      AppLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');

      // Refresh Address Data
      refreshData.toggle();

      // Reset Fields
      resetFormFields();

      // Re direct
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
    }
  }
}
