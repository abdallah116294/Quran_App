import 'package:quran/core/api/dio_helper.dart';
import '../models/ayahs_header_models.dart';
import '../models/quran_model2.dart';
import '../models/radios_model.dart';


abstract class RemoteDataSource {
//  Future<QuranModel> getData();
  // Future<SuwarsModel> getSuwars();
  Future<RadiosModel> getRadios();
  Future<QuranModel2> getSuraha();
  Future<AyahsHeaderModel> getAyahs(int  number);
}

class RemoteDatasourceImpl implements RemoteDataSource {
  final DioHelper dioHelper;
  RemoteDatasourceImpl({required this.dioHelper});
  // @override
  // Future<QuranModel> getData() async {
  //   var response = await dioHelper.getData();
  //   return QuranModel.fromJson(response);
  // }

  // @override
  // Future<SuwarsModel> getSuwars() async {
  //   var response = await dioHelper.getSuwars();
  //   return SuwarsModel.fromJson(response);
  // }

  @override
  Future<RadiosModel> getRadios() async {
    var response = await dioHelper.getRadios();
    return RadiosModel.fromJson(response);
  }

  @override
  Future<QuranModel2> getSuraha() async {
    var response = await dioHelper.getSuraha();
    return QuranModel2.fromJson(response);
  }

  @override
  Future<AyahsHeaderModel> getAyahs(int number) async {
    var response = await dioHelper.getAyahs(number: number);
    return AyahsHeaderModel.fromJson(response);
  }
}
