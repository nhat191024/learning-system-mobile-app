import 'package:learning_system/utils/imports.dart';

class CourseDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  RxInt courseId = 0.obs;

  RxList<CourseAssignmentModel> assignmentList = <CourseAssignmentModel>[].obs;
  RxList<CourseAssignmentPointModel> studentPointList = <CourseAssignmentPointModel>[].obs;

  late TabController tabController;
  final RxBool isLoading = true.obs;
  RxString token = "".obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token.value = await Token.getToken() ?? Api.testToken;
      courseId.value = Get.arguments['courseId'] ?? '';

      await fetchClassAssignment(courseId.value);
      await fetchStudentAssignmentPoint(courseId.value);

      isLoading.value = false;
    });
  }

  fetchClassAssignment(int id) async {
    assignmentList.clear();
    try {
      isLoading.value = true;
      String url = "${Api.server}courses/assignment/$id";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        var assignmentData = jsonDecode(response.body);
        assignmentList.value =
            (assignmentData as List).map((e) => CourseAssignmentModel.fromMap(e)).toList();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch class assignment");
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }

  fetchStudentAssignmentPoint(int id) async {
    studentPointList.clear();
    try {
      isLoading.value = true;
      String url = "${Api.server}courses/assignment/point/$id";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var studentPointData = jsonDecode(response.body);
        studentPointList.value =
            (studentPointData as List).map((e) => CourseAssignmentPointModel.fromMap(e)).toList();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch student assignment point");
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading.value = false;
    }
  }
}
