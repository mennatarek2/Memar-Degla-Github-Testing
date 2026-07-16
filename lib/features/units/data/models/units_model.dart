import 'package:memar_degla/features/units/domain/entities/unit_entity.dart';

class UnitsModel {
  final String code;
  final String unitName;
  final UnitStatus status;
  final String unitPrice;

  UnitsModel({
    required this.code,
    required this.unitName,
    required this.status,
    required this.unitPrice,
  });
}

final List<UnitsModel> units = [
  UnitsModel(
    code: "VL-001-A",
    unitName: "Al Nakhil",
    status: UnitStatus.active,
    unitPrice: "1,850,000",
  ),
  UnitsModel(
    code: "VL-002-B",
    unitName: "Palm Hills",
    status: UnitStatus.handOver,
    unitPrice: "2,150,000",
  ),
  UnitsModel(
    code: "VL-003-C",
    unitName: "Green Valley",
    status: UnitStatus.underConstructions,
    unitPrice: "1,620,000",
  ),
  UnitsModel(
    code: "AP-101-A",
    unitName: "Sky Residence",
    status: UnitStatus.active,
    unitPrice: "980,000",
  ),
  UnitsModel(
    code: "AP-102-B",
    unitName: "Garden View",
    status: UnitStatus.handOver,
    unitPrice: "1,150,000",
  ),
  UnitsModel(
    code: "TW-201-A",
    unitName: "Royal Town",
    status: UnitStatus.underConstructions,
    unitPrice: "2,950,000",
  ),
  UnitsModel(
    code: "VL-010-D",
    unitName: "Sunset Villas",
    status: UnitStatus.active,
    unitPrice: "3,450,000",
  ),
  UnitsModel(
    code: "AP-205-C",
    unitName: "Elite Heights",
    status: UnitStatus.handOver,
    unitPrice: "1,420,000",
  ),
  UnitsModel(
    code: "TW-305-B",
    unitName: "Crystal Park",
    status: UnitStatus.active,
    unitPrice: "2,780,000",
  ),
  UnitsModel(
    code: "VL-015-E",
    unitName: "Emerald Bay",
    status: UnitStatus.underConstructions,
    unitPrice: "4,150,000",
  ),
  UnitsModel(
    code: "AP-310-D",
    unitName: "Lake View",
    status: UnitStatus.active,
    unitPrice: "1,300,000",
  ),
  UnitsModel(
    code: "TW-401-C",
    unitName: "Grand Oasis",
    status: UnitStatus.handOver,
    unitPrice: "3,100,000",
  ),
];
