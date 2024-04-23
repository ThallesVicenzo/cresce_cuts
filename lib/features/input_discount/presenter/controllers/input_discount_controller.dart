import 'dart:io';

import 'package:cresce_cuts/core/domain/entities/product_entity.dart';
import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/core/main_routes.dart';
import 'package:cresce_cuts/core/page_state.dart';
import 'package:cresce_cuts/core/utils/extensions/date_time_extension.dart';
import 'package:cresce_cuts/core/utils/extensions/string_extensions.dart';
import 'package:cresce_cuts/core/utils/masks/mask_formatters.dart';
import 'package:cresce_cuts/features/input_discount/domain/use_case/edit_product_use_case.dart';
import 'package:cresce_cuts/features/input_discount/domain/use_case/send_product_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InputDiscountController extends ChangeNotifier {
  final SendProductUseCase sendUseCase;
  final EditProductUseCase editProductUseCase;

  InputDiscountController({
    required this.sendUseCase,
    required this.editProductUseCase,
  });

  final state = ValueNotifier<PageState>(InitialState());

  final fieldsControllers = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final file = ValueNotifier<File>(File(''));

  void getValues(ProductEntity? entity) {
    if (entity != null) {
      fieldsControllers[0].text = entity.title;

      fieldsControllers[1].text = entity.description;

      fieldsControllers[2].text = entity.initialPrice.toString().asCurrency();

      fieldsControllers[4].text =
          entity.activationDate.formattedDayMonthAndYear;

      fieldsControllers[5].text =
          entity.inactivationDate.formattedDayMonthAndYear;

      fieldsControllers[6].text = entity.price.toString().asCurrency();

      file.value = File(entity.image);

      if (entity.discount == DiscountType.perPrice) {
        fieldsControllers[3].text = entity.finalPrice.toString().asCurrency();
      } else {
        fieldsControllers[3].text = entity.finalPrice.toString();
      }
    }
  }

  String leftFieldLabel(DiscountType discountType) {
    switch (discountType.name.toUpperCase().trim()) {
      case 'POR PREÇO':
        return 'Preço "DE"';
      case 'PERCENTUAL':
        return 'Preço';
      case 'QUANTIDADE':
        return 'Leve';
      default:
        return 'Preço "DE"';
    }
  }

  List<TextInputFormatter>? setLeftFieldFormatters(DiscountType discountType) {
    switch (discountType.name.toUpperCase().trim()) {
      case 'POR PREÇO' || 'PERCENTUAL':
        return [
          FilteringTextInputFormatter.digitsOnly,
          MaskFormatters.maskMoney,
        ];
      case 'QUANTIDADE':
        return [
          FilteringTextInputFormatter.digitsOnly,
        ];
    }
    return null;
  }

  List<TextInputFormatter>? setRightFieldFormatters(DiscountType discountType) {
    switch (discountType.name.toUpperCase().trim()) {
      case 'POR PREÇO':
        return [
          FilteringTextInputFormatter.digitsOnly,
          MaskFormatters.maskMoney,
        ];
      case 'PERCENTUAL':
        return [
          FilteringTextInputFormatter.digitsOnly,
          MaskFormatters().maskPercentage,
        ];
      case 'QUANTIDADE':
        return [
          FilteringTextInputFormatter.digitsOnly,
        ];
    }
    return null;
  }

  String rightFieldLabel(DiscountType discountType) {
    switch (discountType.name.toUpperCase().trim()) {
      case 'POR PREÇO':
        return 'Preço "POR"';
      case 'PERCENTUAL':
        return 'Percentual de desconto';
      case 'QUANTIDADE':
        return 'Pague';
      default:
        return 'Preço "POR"';
    }
  }

  Future<void> getImage() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      file.value = File(result.files.single.path!);
    }
  }

  final formKeys = <GlobalKey<FormState>>[
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  String? validateField(int index) {
    if (fieldsControllers[index].text.isEmpty) {
      return '';
    }
    return null;
  }

  Future<void> saveDiscount(DiscountType discountType) async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate() &&
        formKeys[2].currentState!.validate() &&
        formKeys[3].currentState!.validate() &&
        formKeys[4].currentState!.validate() &&
        formKeys[5].currentState!.validate() &&
        file.value.path.isNotEmpty) {
      if (discountType == DiscountType.perQuantity) {
        if (formKeys[6].currentState!.validate() == false) {
          return;
        }
      }
      state.value = LoadingState();

      final result = await sendUseCase.call(
        discountTitle: fieldsControllers[0].text,
        description: fieldsControllers[1].text,
        discountType: discountType,
        initialPrice:
            fieldsControllers[2].text.clearPercentageAndConvertToDouble(),
        finalPrice:
            fieldsControllers[3].text.clearPercentageAndConvertToDouble(),
        price: discountType == DiscountType.perQuantity
            ? fieldsControllers[6].text.clearPercentageAndConvertToDouble()
            : null,
        activationDate: DateTime.parse(
            '${fieldsControllers[4].text.convertDateToServerFormat()} ${DateTime.now().formattedTimeWithSeconds}'),
        inactivationDate: DateTime.parse(
            '${fieldsControllers[5].text.convertDateToServerFormat()} ${DateTime.now().formattedTimeWithSeconds}'),
        image: file.value.path,
      );

      result.either(
        (left) => state.value = ErrorState(error: left),
        (right) {
          Modular.to.navigate(MainRoutes.home.route);
        },
      );
    }
  }

  Future<void> editDiscount(DiscountType discountType, int index) async {
    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate() &&
        formKeys[2].currentState!.validate() &&
        formKeys[3].currentState!.validate() &&
        formKeys[4].currentState!.validate() &&
        formKeys[5].currentState!.validate() &&
        file.value.path.isNotEmpty) {
      if (discountType == DiscountType.perQuantity) {
        if (formKeys[6].currentState!.validate() == false) {
          return;
        }
      }
      state.value = LoadingState();

      final result = await editProductUseCase.call(
        index: index,
        discountTitle: fieldsControllers[0].text,
        description: fieldsControllers[1].text,
        discountType: discountType,
        initialPrice:
            fieldsControllers[2].text.clearPercentageAndConvertToDouble(),
        finalPrice:
            fieldsControllers[3].text.clearPercentageAndConvertToDouble(),
        price: discountType == DiscountType.perQuantity
            ? fieldsControllers[6].text.clearPercentageAndConvertToDouble()
            : null,
        activationDate: DateTime.parse(
            '${fieldsControllers[4].text.convertDateToServerFormat()} ${DateTime.now().formattedTimeWithSeconds}'),
        inactivationDate: DateTime.parse(
            '${fieldsControllers[5].text.convertDateToServerFormat()} ${DateTime.now().formattedTimeWithSeconds}'),
        image: file.value.path,
      );

      result.either(
        (left) => state.value = ErrorState(error: left),
        (right) {
          Modular.to.navigate(MainRoutes.home.route);
        },
      );
    }
  }
}
