import 'package:flutter/material.dart';
import 'package:memar_degla/features/installments/data/models/installment_model.dart';
import 'package:memar_degla/features/installments/presentation/models/installment_filter_option.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installment_card.dart';
import 'package:memar_degla/features/installments/presentation/views/widgets/installment_filter_button.dart';

class InstallmentsScreenBody extends StatefulWidget {
  const InstallmentsScreenBody({super.key});

  @override
  State<InstallmentsScreenBody> createState() => _InstallmentsScreenBodyState();
}

class _InstallmentsScreenBodyState extends State<InstallmentsScreenBody> {
  int _selectedFilterIndex = 0;

  List<InstallmentModel> get _filteredInstallments {
    if (_selectedFilterIndex == 0) {
      // All
      return installments;
    } else {
      final selectedStatus = filterOptions[_selectedFilterIndex].status;
      return installments
          .where((installment) => installment.billStatus == selectedStatus)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Horizontal Filter List
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: List.generate(
              filterOptions.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InstallmentFilterButton(
                  option: filterOptions[index],
                  isSelected: _selectedFilterIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedFilterIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        // Installments List
        Expanded(
          child: ListView.builder(
            itemCount: _filteredInstallments.length,
            itemBuilder: (context, index) {
              return InstallmentCard(
                installment: _filteredInstallments[index],
                onTap: () {
                  // Navigate to installment details
                  // You can implement navigation here
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
