import 'package:memar_degla/features/contrcats/data/models/contracts_models.dart';

abstract class ContractsLocalDataSource {
  List<ContractsModels> getAllContratcs();
}

class ContratcsLocalDataSourceImplementaion
    implements ContractsLocalDataSource {
  @override
  List<ContractsModels> getAllContratcs() {
    // TODO: implement getAllContratcs
    throw UnimplementedError();
  }
}
