import 'package:learning_system/utils/imports.dart';

class ClassDetailController extends GetxController with GetSingleTickerProviderStateMixin {
  RxInt classId = 0.obs;
  Rx<ClassDetailModel> classDetail =
      ClassDetailModel(id: 0, name: '', description: '', teacherName: '', createAt: '').obs;

  RxList<AssignmentModel> assignmentList = <AssignmentModel>[].obs;
  RxList<ClassNotificationModel> notificationList = <ClassNotificationModel>[].obs;
  RxList<AssignmentPointModel> studentPointList = <AssignmentPointModel>[].obs;

  TextEditingController linkSubmit = TextEditingController();
  RxBool isLinkSubmitError = false.obs;
  RxString linkSubmitError = ''.obs;
  RxBool isSubmitButtonLoading = false.obs;

  late TabController tabController;
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  final RxBool isLoading = true.obs;
  final RxBool isSearching = false.obs;
  RxString token = "".obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token.value = await Token.getToken() ?? Api.testToken;
      classId.value = Get.arguments['classId'] ?? '';
      await fetchClassDetail(classId.value);
      await fetchClassNotification(classId.value);
      await fetchClassAssignment(classId.value);
      await fetchStudentAssignmentPoint(classId.value);

      isLoading.value = false;
    });
  }

  fetchClassDetail(int id) async {
    try {
      String url = "${Api.server}classes/info/1";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: Api.apiTimeOut));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        classDetail.value = ClassDetailModel.fromJson(data);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch class detail");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  fetchClassNotification(int id) async {
    notificationList.clear();
    try {
      String url = "${Api.server}notification/$id";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        var notificationData = jsonDecode(response.body);
        notificationList.value =
            (notificationData as List).map((e) => ClassNotificationModel.fromMap(e)).toList();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch class notification");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  fetchClassAssignment(int id) async {
    assignmentList.clear();
    try {
      isLoading.value = true;
      String url = "${Api.server}assignment/getByClass/$id/3";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var assignmentData = data['assignments'];
        assignmentList.value =
            (assignmentData as List).map((e) => AssignmentModel.fromMap(e)).toList();
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

  void submitAssignment(String type, String id) async {
    try {
      isSubmitButtonLoading.value = true;
      var uri = Uri.parse("${Api.server}assignment/submit");
      var request = MultipartRequest('POST', uri);
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';

      request.fields['type'] = type;
      request.fields['assignment_id'] = id;
      request.fields['link'] = linkSubmit.text.trim();
      request.fields['class_id'] = classId.value.toString();

      var streamedResponse = await request.send();
      if (streamedResponse.statusCode == 200) {
        fetchClassAssignment(classId.value);
        Get.snackbar('Success', 'Assignment submitted successfully');
      }
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Failed to submit assignment");
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isSubmitButtonLoading.value = false;
    }
  }

  fetchStudentAssignmentPoint(int id) async {
    studentPointList.clear();
    try {
      isLoading.value = true;
      String url = "${Api.server}classes/getStudentAssignmentPoint/$id";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        var studentPointData = jsonDecode(response.body);
        studentPointList.value =
            (studentPointData as List).map((e) => AssignmentPointModel.fromMap(e)).toList();
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

  @override
  void onClose() {
    tabController.dispose();
    searchFocusNode.dispose();
    searchController.dispose();
    assignmentList.clear();
    notificationList.clear();
    studentPointList.clear();
    classDetail.value = ClassDetailModel(
      id: 0,
      name: '',
      description: '',
      teacherName: '',
      createAt: '',
    );
    classId.value = 0;
    token.value = "";
    isLoading.value = true;
    isSearching.value = false;
    super.onClose();
  }
}
