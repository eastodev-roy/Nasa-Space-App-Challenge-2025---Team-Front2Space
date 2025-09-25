import 'package:get/get.dart';

class NavBarController extends GetxController{
  final RxInt selectedIndex =0.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  void changeIndex(int index){
    selectedIndex.value =index;
    if (index ==1){
      selectedDate.value=DateTime.now();
    }
  }

}