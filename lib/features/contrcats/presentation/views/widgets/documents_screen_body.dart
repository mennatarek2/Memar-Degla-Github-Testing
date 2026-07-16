import 'package:flutter/material.dart';
import 'package:memar_degla/features/contrcats/data/models/document_model.dart';
import 'package:memar_degla/features/contrcats/presentation/views/widgets/document_item.dart';

class DocumentsScreenBody extends StatelessWidget {
  const DocumentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final document = documents[index];
          return DocumentItem(
            icon: document.icon,
            documentType: document.documentType,
            details: document.details,
            type: document.type,
          );
        },
        separatorBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(color: Colors.grey, thickness: 0.5),
          );
        },
        itemCount: documents.length,
      ),
    );
  }
}
