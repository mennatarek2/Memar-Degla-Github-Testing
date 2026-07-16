import 'package:flutter/material.dart';

class DocumentModel {
  final IconData icon;
  final String documentType;
  final String details;
  final String type;

  DocumentModel({
    required this.icon,
    required this.documentType,
    required this.details,
    required this.type,
  });
}

final List<DocumentModel> documents = [
  DocumentModel(
    icon: Icons.description_outlined,
    documentType: 'Sales Contract - VL-042-B',
    details: 'Contract',
    type: 'Contract',
  ),
  DocumentModel(
    icon: Icons.description_outlined,
    documentType: 'Payment Receipt - Jan 2025',
    details: 'Receipt',
    type: 'Receipt',
  ),
  DocumentModel(
    icon: Icons.description_outlined,
    documentType: 'Account Statement Q4 2024',
    details: 'Statement',
    type: 'Statement',
  ),
  DocumentModel(
    icon: Icons.image_outlined,
    documentType: 'Unit Floor Plan',
    details: 'Unit Document',
    type: 'Unit Document',
  ),
  DocumentModel(
    icon: Icons.description_outlined,
    documentType: 'Handover Checklist',
    details: 'Project',
    type: 'Project',
  ),
];
