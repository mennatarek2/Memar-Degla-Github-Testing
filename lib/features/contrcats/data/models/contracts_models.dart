import 'package:memar_degla/features/contrcats/domain/contracts_entity.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';

class ContractsModels {
  final String contrcatCode;
  final String contractAgreement;
  final String unitCode;
  final String unitPrice;
  final ContractsStatus contractsStatus;
  final List<String> contractsTerms;
  final List<InstallmentModel> installmentDetails;

  ContractsModels({
    required this.contrcatCode,
    required this.contractAgreement,
    required this.unitCode,
    required this.unitPrice,
    required this.contractsStatus,
    required this.contractsTerms,
    required this.installmentDetails,
  });
}

final List<ContractsModels> dumyyContractModel = [
  ContractsModels(
    contrcatCode: "CNT-001",
    contractAgreement: "Residential Sale Agreement",
    unitCode: "VL-042-B",
    unitPrice: "4,500,000 EGP",
    contractsStatus: ContractsStatus.active,
    contractsTerms: [
      "The purchaser shall pay a 20% down payment upon signing the contract.",
      "The remaining balance shall be paid in equal quarterly installments over 7 years.",
      "Ownership transfer shall take place after full payment of the purchase price and fees.",
      "The purchaser is responsible for maintenance fees after the official handover date.",
      "Late installments may be subject to penalties according to the contract terms.",
      "The developer shall deliver the unit on the agreed handover date.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-002",
    contractAgreement: "Apartment Purchase Agreement",
    unitCode: "APT-105",
    unitPrice: "3,200,000 EGP",
    contractsStatus: ContractsStatus.completed,
    contractsTerms: [
      "A 10% reservation deposit is required upon signing the agreement.",
      "The remaining amount shall be paid through a 6-year payment plan.",
      "The purchaser cannot transfer ownership before completing all payments.",
      "Annual maintenance fees shall be paid after receiving the unit.",
      "The developer guarantees delivery according to the agreed schedule.",
      "Failure to pay installments may result in contract termination.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-003",
    contractAgreement: "Commercial Unit Agreement",
    unitCode: "CM-201",
    unitPrice: "6,800,000 EGP",
    contractsStatus: ContractsStatus.active,
    contractsTerms: [
      "The purchase price includes the allocated commercial unit only.",
      "Commercial activities must comply with project regulations.",
      "The purchaser shall complete all payments before receiving possession.",
      "Modification of the unit requires written approval from the developer.",
      "Maintenance charges are applicable from the handover date.",
      "The purchaser is responsible for utility connection expenses.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-004",
    contractAgreement: "Luxury Villa Agreement",
    unitCode: "VL-015-A",
    unitPrice: "8,900,000 EGP",
    contractsStatus: ContractsStatus.completed,
    contractsTerms: [
      "A 15% initial payment was paid upon contract signing.",
      "The remaining balance was settled according to the agreed schedule.",
      "The villa was delivered according to the approved specifications.",
      "The purchaser inspected the property before final handover.",
      "All ownership documents were issued after full settlement.",
      "The purchaser accepted the property condition upon delivery.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-005",
    contractAgreement: "Apartment Resale Agreement",
    unitCode: "APT-312",
    unitPrice: "2,750,000 EGP",
    contractsStatus: ContractsStatus.completed,
    contractsTerms: [
      "The purchaser paid the initial booking amount upon reservation.",
      "Cancellation requests are subject to the contract cancellation policy.",
      "Refunds shall be processed according to the agreed conditions.",
      "Administrative fees may be deducted from refunded amounts.",
      "The purchaser must provide official identification documents.",
      "The agreement becomes void after completion of cancellation procedures.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-006",
    contractAgreement: "Townhouse Sale Agreement",
    unitCode: "TH-078",
    unitPrice: "5,950,000 EGP",
    contractsStatus: ContractsStatus.active,
    contractsTerms: [
      "The purchaser shall pay a 5% booking deposit upon reservation.",
      "The remaining amount shall be paid through monthly installments.",
      "The townhouse shall be delivered according to the approved finishing level.",
      "The purchaser shall pay community service fees after handover.",
      "The property cannot be modified without developer approval.",
      "The developer shall provide all ownership documents after completion.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-007",
    contractAgreement: "Office Unit Agreement",
    unitCode: "OF-501",
    unitPrice: "7,250,000 EGP",
    contractsStatus: ContractsStatus.completed,
    contractsTerms: [
      "The purchaser shall complete commercial registration requirements.",
      "The unit price includes the agreed specifications mentioned in the contract.",
      "Payments shall be completed according to the approved schedule.",
      "Any changes to the office design require prior approval.",
      "Maintenance fees are payable annually after handover.",
      "The purchaser accepts all project rules and regulations.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-008",
    contractAgreement: "Studio Unit Agreement",
    unitCode: "ST-022",
    unitPrice: "1,850,000 EGP",
    contractsStatus: ContractsStatus.active,
    contractsTerms: [
      "The purchaser shall pay the booking amount upon signing.",
      "The remaining balance shall be paid over a 6-year installment plan.",
      "The developer shall complete construction according to specifications.",
      "The purchaser shall pay utility connection fees.",
      "Ownership transfer requires full settlement of payments.",
      "The purchaser agrees to all community regulations.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-009",
    contractAgreement: "Duplex Purchase Agreement",
    unitCode: "DX-110",
    unitPrice: "6,100,000 EGP",
    contractsStatus: ContractsStatus.completed,
    contractsTerms: [
      "The purchaser completed all scheduled installment payments.",
      "The duplex was handed over after final inspection.",
      "Ownership documents were transferred after settlement.",
      "The purchaser accepted the property specifications.",
      "Maintenance obligations started after handover.",
      "The agreement remains subject to project regulations.",
    ],
    installmentDetails: installments,
  ),

  ContractsModels(
    contrcatCode: "CNT-010",
    contractAgreement: "Penthouse Sale Agreement",
    unitCode: "PH-901",
    unitPrice: "12,300,000 EGP",
    contractsStatus: ContractsStatus.active,
    contractsTerms: [
      "The purchaser shall pay a 20% down payment upon contract signing.",
      "The remaining amount shall be paid over an 8-year payment plan.",
      "The penthouse shall be delivered according to luxury finishing standards.",
      "The purchaser shall pay annual maintenance charges.",
      "Any resale requires approval according to project regulations.",
      "The developer shall complete handover procedures after payment completion.",
    ],
    installmentDetails: installments,
  ),
];
