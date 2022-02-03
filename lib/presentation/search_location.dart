import 'package:flutter/material.dart';
import 'package:weather_app/components/snackbar.dart';
import 'package:weather_app/core/service/exceptions/network_exceptions.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchLocation extends HookConsumerWidget {
  const SearchLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    final searchLocationController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.greyShade1,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          height: 48,
                          child: TextFormField(
                            enabled: true,
                            textInputAction: TextInputAction.search,
                            textCapitalization: TextCapitalization.words,
                            controller: searchLocationController,
                            style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.greyShade1,
                            ),
                            decoration: const InputDecoration(
                              isDense: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.darkGrey,
                              ),
                              hintText: 'Search location',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: AppColors.darkGrey,
                              ),
                              errorStyle: TextStyle(
                                fontSize: 16,
                                color: AppColors.darkGrey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyShade1,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.greyShade1,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 48,
                        child: TextButton(
                          onPressed: () {
                            if (searchLocationController.text.isNotEmpty) {
                              Navigator.pop(
                                  context, searchLocationController.text);
                            } else {
                              CustomSnackBar.showErrorSnackBar(
                                context,
                                message: NetworkExceptions.getErrorMessage(
                                    const NetworkExceptions.unexpectedError(
                                        'Please enter a location')),
                                milliseconds: 2000,
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: AppColors.blueColor,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                          ),
                          child: const Text('Search',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.greyShade1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
