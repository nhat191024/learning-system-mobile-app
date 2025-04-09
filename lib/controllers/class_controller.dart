import 'package:learning_system/utils/imports.dart';

class ClassController extends GetxController {
  final RxList<ClassModel> classList = <ClassModel>[].obs;
  final RxList<ClassModel> filteredList = <ClassModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isSearching = false.obs;

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  RxString token = "".obs;
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token.value = await Token.getToken() ?? Api.testToken;
      await fetchClass();
      filteredList.value = classList;
    });
  }

  fetchClass() async {
    try {
      isLoading.value = true;
      String url = "${Api.server}classes/1";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        classList.value =
            (data['classes'] as List)
                .map((e) => ClassModel.fromJson(e))
                .toList();
      }
    } finally {
      isLoading.value = false;
    }
  }

  classFilter(String query) async {
    try {
      isLoading.value = true;

      if (query.isNotEmpty) {
        filteredList.value =
            classList
                .where(
                  (element) =>
                      (element.name?.toLowerCase().contains(
                            query.toLowerCase(),
                          ) ??
                          false),
                )
                .toList();
        isSearching.value = true;
      } else {
        filteredList.value = classList;
        isSearching.value = false;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
