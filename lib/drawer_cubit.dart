import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<int> {
  DrawerCubit() : super(0);
  void toggle(int index) => emit(index);
}
