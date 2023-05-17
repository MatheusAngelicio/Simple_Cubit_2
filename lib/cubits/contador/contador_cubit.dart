import 'package:bloc/bloc.dart';

part 'contador_state.dart';

class ContadorCubit extends Cubit<ContadorEstado> {
  // aqui eu inicio o cubit falando qual o estado inicial dele
  ContadorCubit() : super(ContadorCarregado(valor: 0));

  int _valor = 0;

  adicionaMaisUm() {
    _valor++;
    emit(ContadorCarregado(valor: _valor));
  }

  removeMaisUm() {
    _valor--;
    emit(ContadorCarregado(valor: _valor));
  }
}
