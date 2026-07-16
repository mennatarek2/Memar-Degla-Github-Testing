import 'package:memar_degla/features/units/data/models/units_model.dart';

class UnitDetailsModel {
  final UnitsModel unit;
  final int bedroomsNumber, bathroomsNumber;
  final String constructionEndDate;
  final String buildingName;
  final String floorNumber;
  final double area;
  final List<String> unitFeatures;

  UnitDetailsModel({
    required this.unit,
    required this.bedroomsNumber,
    required this.bathroomsNumber,
    required this.constructionEndDate,
    required this.buildingName,
    required this.floorNumber,
    required this.area,
    required this.unitFeatures,
  });
}
// class UnitIconsModel {
//   final IconData icon;

//   UnitIconsModel({required this.icon});
// }
// final List<UnitIconsModel> iconsModel = [
//   UnitIconsModel(icon: Icons.bed_rounded),
//   UnitIconsModel(icon: Icons.bathtub_outlined),
//   UnitIconsModel(icon: Icons.arr)
//   UnitIconsModel(icon: Icons.layers_outlined),
//   UnitIconsModel(icon: Icons.home_outlined),
//   UnitIconsModel(icon: Icons.calendar_month_outlined),
// ];

final List<UnitDetailsModel> unitDetails = [
  UnitDetailsModel(
    unit: units[0],
    bedroomsNumber: 4,
    bathroomsNumber: 3,
    constructionEndDate: "2025-12-01",
    buildingName: "Building A",
    floorNumber: "Ground + 1",
    area: 280.0,
    unitFeatures: ["Private Garden", "Swimming Pool", "Maid's Room", "Parking"],
  ),
  UnitDetailsModel(
    unit: units[1],
    bedroomsNumber: 5,
    bathroomsNumber: 4,
    constructionEndDate: "2024-06-15",
    buildingName: "Building B",
    floorNumber: "Ground + 2",
    area: 320.0,
    unitFeatures: ["Landscape View", "Driver Room", "Private Garage"],
  ),
  UnitDetailsModel(
    unit: units[2],
    bedroomsNumber: 4,
    bathroomsNumber: 3,
    constructionEndDate: "2026-03-01",
    buildingName: "Building C",
    floorNumber: "Ground + 1",
    area: 260.0,
    unitFeatures: ["Corner Unit", "Smart Home", "Large Garden"],
  ),
  UnitDetailsModel(
    unit: units[3],
    bedroomsNumber: 2,
    bathroomsNumber: 2,
    constructionEndDate: "2024-09-20",
    buildingName: "Sky Residence",
    floorNumber: "5th Floor",
    area: 120.0,
    unitFeatures: ["City View", "Balcony", "Elevator Access"],
  ),
  UnitDetailsModel(
    unit: units[4],
    bedroomsNumber: 3,
    bathroomsNumber: 2,
    constructionEndDate: "2024-02-10",
    buildingName: "Garden View",
    floorNumber: "3rd Floor",
    area: 145.0,
    unitFeatures: ["Garden View", "Storage Room", "Covered Parking"],
  ),
  UnitDetailsModel(
    unit: units[5],
    bedroomsNumber: 4,
    bathroomsNumber: 4,
    constructionEndDate: "2028-06-30",
    buildingName: "Royal Town",
    floorNumber: "Ground + 2",
    area: 240.0,
    unitFeatures: ["Rooftop Terrace", "Private Entrance", "Clubhouse Access"],
  ),
  UnitDetailsModel(
    unit: units[6],
    bedroomsNumber: 6,
    bathroomsNumber: 5,
    constructionEndDate: "2025-08-15",
    buildingName: "Sunset Villas",
    floorNumber: "Ground + 2",
    area: 420.0,
    unitFeatures: ["Private Pool", "Sea View", "Smart Home", "Garage"],
  ),
  UnitDetailsModel(
    unit: units[7],
    bedroomsNumber: 3,
    bathroomsNumber: 2,
    constructionEndDate: "2024-11-01",
    buildingName: "Elite Heights",
    floorNumber: "8th Floor",
    area: 165.0,
    unitFeatures: ["Gym Access", "Balcony", "Security System"],
  ),
  UnitDetailsModel(
    unit: units[8],
    bedroomsNumber: 4,
    bathroomsNumber: 3,
    constructionEndDate: "2025-05-20",
    buildingName: "Crystal Park",
    floorNumber: "Ground + 2",
    area: 230.0,
    unitFeatures: ["Private Garden", "Corner Unit", "Children's Play Area"],
  ),
  UnitDetailsModel(
    unit: units[9],
    bedroomsNumber: 6,
    bathroomsNumber: 5,
    constructionEndDate: "2029-03-10",
    buildingName: "Emerald Bay",
    floorNumber: "Ground + 2",
    area: 500.0,
    unitFeatures: [
      "Waterfront",
      "Infinity Pool",
      "Private Dock",
      "Luxury Finishing",
    ],
  ),
  UnitDetailsModel(
    unit: units[10],
    bedroomsNumber: 3,
    bathroomsNumber: 2,
    constructionEndDate: "2025-01-15",
    buildingName: "Lake View",
    floorNumber: "6th Floor",
    area: 150.0,
    unitFeatures: ["Lake View", "Balcony", "Covered Parking"],
  ),
  UnitDetailsModel(
    unit: units[11],
    bedroomsNumber: 5,
    bathroomsNumber: 4,
    constructionEndDate: "2024-12-30",
    buildingName: "Grand Oasis",
    floorNumber: "Ground + 2",
    area: 340.0,
    unitFeatures: [
      "Private Garden",
      "Clubhouse Access",
      "Swimming Pool",
      "Smart Home",
    ],
  ),
];
