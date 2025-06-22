import 'package:learning_system/utils/imports.dart';

class DoCourseAssignmentController extends GetxController {
  Rx<CourseAssignmentModel> assignment =
      CourseAssignmentModel(
        id: 0,
        videoUrl: '',
        title: '',
        description: '',
        duration: '',
        isSubmitted: false,
      ).obs;

  RxList<AnswerModel> answerList = <AnswerModel>[].obs;
  RxList<QuestionModel> questionList = <QuestionModel>[].obs;

  RxString token = "".obs;
  RxBool isLoading = true.obs;

  RxInt courseId = 0.obs;
  RxInt assignmentId = 0.obs;

  RxString username = ''.obs;
  RxInt currentQuestion = 0.obs;
  RxInt assignmentDuration = 0.obs;
  RxString assignmentTitle = ''.obs;

  RxString timeLeft = '00:00:00'.obs;
  Timer? _timer;

  final CourseDetailController courseDetailController = Get.find<CourseDetailController>();

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token.value = await Token.getToken() ?? Api.testToken;
      courseId = Get.arguments['courseId'] ?? '';
      assignmentId.value = Get.arguments['assignmentId'] ?? '';
      assignmentTitle.value = Get.arguments['assignmentTitle'] ?? '';

      if (StorageService.checkData(key: 'username')) {
        username.value = StorageService.readData(key: 'username');
      }

      await fetchAssignment(assignmentId.value);

      int duration = (assignmentDuration * 60).toInt();
      if (duration > 0) {
        startTimer(duration);
      } else {
        timeLeft.value = 'Không có';
      }
      isLoading.value = false;
    });
  }

  fetchAssignment(int assignmentId) async {
    try {
      isLoading(true);
      String url = "${Api.server}courses/assignment/detail/$assignmentId";
      var response = await get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var question = data['questions'];
        assignment.value = CourseAssignmentModel.fromMap(data);
        questionList.value = (question as List).map((e) => QuestionModel.fromMap(e)).toList();
        assignmentDuration.value = int.parse(assignment.value.duration!);
        loadChoiceToAnswerList();
      }
    } catch (e) {
      questionList.clear();
      Get.snackbar("Error", "Failed to fetch assignment");
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void loadChoiceToAnswerList() {
    for (var question in questionList) {
      saveSelection(question.id!, 0);
    }
  }

  void saveSelection(int questionId, int choiceId) {
    var answer = answerList.firstWhere(
      (element) => element.questionId == questionId,
      orElse: () => AnswerModel(questionId: questionId),
    );
    answer.choiceId = choiceId;
    if (!answerList.contains(answer)) {
      answerList.add(answer);
    } else {
      int index = answerList.indexOf(answer);
      answerList[index] = answer;
    }
    answerList.refresh();
  }

  void startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    var remainingSeconds = seconds;

    _timer?.cancel();
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        Get.dialog(
          NotificationDialogWithoutButton(title: 'time_up'.tr, message: 'time_up_message'.tr),
        );
        Future.delayed(const Duration(seconds: 3), () {
          Get.back();
          submitAssignment(isTimeUp: true);
        });
      } else {
        remainingSeconds--;
        int hours = remainingSeconds ~/ 3600;
        int minutes = (remainingSeconds % 3600) ~/ 60;
        int secs = remainingSeconds % 60;

        timeLeft.value =
            '${hours.toString().padLeft(2, '0')}:'
            '${minutes.toString().padLeft(2, '0')}:'
            '${secs.toString().padLeft(2, '0')}';
      }
    });
  }

  bool checkAllAnswered() {
    for (var question in questionList) {
      if (answerList
              .firstWhere(
                (element) => element.questionId == question.id,
                orElse: () => AnswerModel(),
              )
              .choiceId ==
          0) {
        return false;
      }
    }
    return true;
  }

  submitAssignment({bool isTimeUp = false}) async {
    try {
      isLoading(true);

      //notify user if time is not up and not all questions are answered
      if (!isTimeUp && !checkAllAnswered()) {
        Get.dialog(
          NotificationDialogWithCustomButton(
            title: 'note'.tr,
            message: 'submit_confirm'.tr,
            btnText: 'submit'.tr,
            btnColor: AppColors.errorMain,
            onTap: () {
              Get.back();
              submitAssignment(isTimeUp: true);
            },
          ),
        );
        return;
      } else if (!isTimeUp) {
        Get.dialog(
          NotificationDialogWithCustomButton(
            title: 'note'.tr,
            message: 'submit_confirm_1'.tr,
            btnText: 'submit'.tr,
            btnColor: AppColors.errorMain,
            onTap: () {
              Get.back();
              submitAssignment(isTimeUp: true);
            },
          ),
        );
        return;
      }

      String url = "${Api.server}courses/assignment/submit";
      var request = MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $token';
      request.headers['Content-Type'] = 'application/json';
      request.headers['Accept'] = 'application/json';
      request.fields['assignment_id'] = assignmentId.value.toString();
      request.fields['answers'] = jsonEncode(answerList.map((e) => e.toMap()).toList());
      var response = await request.send().timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        courseDetailController.fetchClassAssignment(courseId.value);
        courseDetailController.fetchStudentAssignmentPoint(courseId.value);
        Get.back();
        Get.snackbar('Success', 'Assignment submitted successfully');
      } else {
        Get.back();
        Get.snackbar('Error', 'Failed to submit assignment');
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', 'Failed to submit assignment');
      if (kDebugMode) {
        print(e);
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    _timer = null;
    answerList.clear();
    questionList.clear();
    assignment.value = CourseAssignmentModel(
      id: 0,
      videoUrl: '',
      title: '',
      description: '',
      duration: '',
      isSubmitted: false,
    );
    assignmentId.value = 0;
    courseId.value = 0;
    username.value = '';
    timeLeft.value = '00:00:00';
    assignmentDuration.value = 0;
    currentQuestion.value = 0;
    isLoading.value = true;
    token.value = '';
    assignmentTitle.value = '';
    super.onClose();
  }
}
