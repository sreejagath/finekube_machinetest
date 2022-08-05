import 'package:finekube_machinetest/controllers/data_fetch.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var dataCopy = [].obs;
  var data = [].obs;
  var pageNumber = '1'.obs;
  final DataFetch dataFetch = Get.put(DataFetch());

  fetchDebts() async {
    
      var response = await Get.find<DataFetch>().fetchData(pageNumber.value);
    if(pageNumber.value == '1') {
      dataCopy.value = response['data'];
      data.value = response['data'];
    }else{
      dataCopy.value.addAll(response['data']);
      print(dataCopy.value);
      data.value.addAll(response['data']);
    }
    // data.clear();
    // data.addAll(dataCopy.value);
    //data.value = response['data'];
  }

  incrementPagination() {
    pageNumber.value = (int.parse(pageNumber.value) + 1).toString();
    
  }
}