import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'is_scure_state.dart';

class IsScureCubit extends Cubit<IsScureState> {
  IsScureCubit() : super(IsScureInitial());
 bool isScure = true;
   shangeSecure() {
    isScure =!isScure;
    emit(IsScure(isScure: isScure));
  }
}
