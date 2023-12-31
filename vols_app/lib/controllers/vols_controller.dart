import 'package:get/get.dart';

import '../models/vols_model.dart';

class VolsController extends GetxController{
  List<Vols> vols = [];
  var isLoading = true.obs;
  setIsLoading(bool loading){
    isLoading.value=loading;
  }
  addVols(Vols vol){
    vols.add(vol);
  }
}