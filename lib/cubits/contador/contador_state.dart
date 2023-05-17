part of 'contador_cubit.dart';
// Faz parte do contador_cubit
// tudo que importa la, eu trago pra ca tb

abstract class ContadorEstado {}

class ContadorInicial extends ContadorEstado {}

class ContadorCarregando extends ContadorEstado {}

// sempre que eu emitir o ContadorCarregado
// eu tenho que passar o novo valor
class ContadorCarregado extends ContadorEstado {
  ContadorCarregado({required this.valor});
  final int valor;
}
