import 'package:flutter_bloc/flutter_bloc.dart';

enum UnitDetailsTab { details, floorPlan }

class UnitDetailsTabCubit extends Cubit<UnitDetailsTab> {
  UnitDetailsTabCubit() : super(UnitDetailsTab.details);
  void select(UnitDetailsTab tab) => emit(tab);
}
