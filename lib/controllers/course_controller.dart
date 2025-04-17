import 'package:learning_system/utils/imports.dart';

class CourseController extends GetxController {
  final RxList<CourseModel> courseList = <CourseModel>[].obs;
  final RxList<CourseModel> filteredList = <CourseModel>[].obs;
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
      await fetchCourse();
      filteredList.value = courseList;
    });
  }

  fetchCourse() async {
    try {
      isLoading.value = true;
      String url = "${Api.server}courses/get";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        courseList.value = (data['courses'] as List).map((e) => CourseModel.fromJson(e)).toList();
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
            courseList
                .where(
                  (element) => (element.name?.toLowerCase().contains(query.toLowerCase()) ?? false),
                )
                .toList();
        isSearching.value = true;
      } else {
        filteredList.value = courseList;
        isSearching.value = false;
      }
    } finally {
      isLoading.value = false;
    }
  }

  joinCourse(int id) async {
    try {
      isLoading.value = true;
      String url = "${Api.testServer}courses/join/$id";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Get.back();
        Get.snackbar(
          "Success",
          data['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        await fetchCourse();
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }
}
