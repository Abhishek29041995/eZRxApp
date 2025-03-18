import 'package:ezrxmobile/domain/returns/entities/add_request_params.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/invoice_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_request_params_dto.freezed.dart';
part 'add_request_params_dto.g.dart';

@freezed
class AddRequestParamsDto with _$AddRequestParamsDto {
  const AddRequestParamsDto._();

  const factory AddRequestParamsDto({
    @JsonKey(
      name: 'orderSource',
      defaultValue: '',
    )
    required String orderSource,
    @JsonKey(
      name: 'purchaseNumberC',
      defaultValue: '',
    )
    required String purchaseNumberC,
    @JsonKey(
      name: 'specialInstruction',
      defaultValue: '',
    )
    required String specialInstruction,
    @JsonKey(
      name: 'username',
      defaultValue: '',
    )
    required String userName,
    @JsonKey(name: 'soldToCustomer', defaultValue: '')
    required String soldToCustomer,
    @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
    required List<InvoiceDetailsDto> invoiceDetails,
  }) = _AddRequestParamsDto;

  factory AddRequestParamsDto.fromDomain(AddRequestParams param) {
    return AddRequestParamsDto(
      orderSource: param.user.role.type.purchaseOrderType,
      purchaseNumberC: param.returnReference,
      specialInstruction: param.specialInstruction,
      soldToCustomer: param.soldTo,
      userName: param.user.username.getValue(),
      invoiceDetails: param.invoiceDetails
          .map((e) => InvoiceDetailsDto.fromDomain(e))
          .toList(),
    );
  }

  factory AddRequestParamsDto.fromJson(Map<String, dynamic> json) =>
      _$AddRequestParamsDtoFromJson(json);
}
