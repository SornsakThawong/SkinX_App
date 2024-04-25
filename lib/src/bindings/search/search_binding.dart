import 'package:get/get.dart';
import 'package:skin_x_app/src/services/repository/search/search_repo.dart';
import 'package:skin_x_app/src/services/repository/search/search_repo_impl.dart';

class SearchRepoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRepo>(
      () => SearchRepoImpl(),
      tag: (SearchRepo).toString(),
    );
  }
}
