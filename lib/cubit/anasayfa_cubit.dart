import 'package:bloc/bloc.dart';
import 'package:bloc_patern_ornek/entity/kisi.dart';
import 'package:bloc_patern_ornek/repo/kisiler_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisi>> {
  AnasayfaCubit() : super(<Kisi>[]);
  var kisidao = KisilerDaoRepository();
  Future<void> kisileriYukle() async {
    var liste = await kisidao.fetchAllPersons();
    // print(liste);
    emit(liste);
  }
}
