import 'package:cresce_cuts/core/enums/discount_types.dart';
import 'package:cresce_cuts/features/input_discount/domain/repository/send_product_repository.dart';
import 'package:cresce_cuts/features/input_discount/domain/use_case/send_product_use_case.dart';
import 'package:cresce_cuts/features/input_discount/external/send_product_data_source_impl.dart';
import 'package:cresce_cuts/features/input_discount/infra/data_source/send_product_data_source.dart';
import 'package:cresce_cuts/features/input_discount/infra/repository/send_product_repository_impl.dart';
import 'package:cresce_cuts/features/input_discount/input_discount_routes.dart';
import 'package:cresce_cuts/features/input_discount/presenter/controllers/input_discount_controller.dart';
import 'package:cresce_cuts/features/input_discount/presenter/pages/input_discount_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InputDiscountModule extends Module {
  @override
  void binds(Injector i) {
    i.add<SendProductRepository>(SendProductRepositoryImpl.new);
    i.addInstance<SendProductDataSource>(
      SendProductDataSourceImpl(
        clientHttp: Modular.get(key: 'client'),
        storage: Modular.get(key: 'storage'),
      ),
    );
    i.add<SendProductUseCase>(SendProductUsecaseImpl.new);
    i.add<InputDiscountController>(InputDiscountController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      InputDiscountRoutes.inputDiscountPage.route,
      transition: TransitionType.rightToLeft,
      child: (context) => InputDiscountPage(
        controller: context.read<InputDiscountController>(),
        discountType: r.args.data['discount'] as DiscountType,
      ),
    );
  }
}
