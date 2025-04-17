import 'package:learning_system/utils/imports.dart';

class Words extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      //common
      'search': 'Search',
      'join': 'Join',
      'detail': 'Detail',
      'logout': 'Logout',
      'note': 'Note!',
      'status': 'Status',

      //login screen
      'login': 'Login',
      'username': 'Username',
      'password': 'Password',
      'username_label': 'Enter your username',
      'password_label': 'Enter your password',
      'username_error': 'Username cannot be empty',
      'password_error': 'Password cannot be empty',
      'password_error_1': 'Password must be at least 6 characters',

      //bottom nav bar
      'class': 'Class',
      'course': 'Course',
      'profile': 'Profile',
      'favorite': 'Favorite',
      'result': 'Result',

      //class list screen
      'class_list': 'Class List',
      'class_list_empty': 'No class found',

      //class detail screen
      'class_detail': 'Class Detail',
      'overview': 'Overview',
      'assignment': 'Assignment',
      'points': 'Points',

      //assignment screen
      'start': 'Start',
      'hand_in': 'Hand in',
      'handed': 'Handed',
      'due': 'Due',
      'duration': 'Duration',
      'm': 'm',
      'overdue': 'Overdue',
      'submit_assignment': 'Submit assignment',
      'assignment_link': 'Assignment link',
      'enter_link': 'Enter link',
      'link_required': 'Link is required',

      //do assignment screen
      'Candidate': 'Candidate',
      'time_left': 'Time left',
      'submit': 'Submit',
      'time_up': 'Time is up!',
      'time_up_message':
          'System will submit your assignment automatically in 3 seconds. Please wait...',
      'submit_confirm':
          "You haven't finished your assignment yet, are you sure you want to submit it?",
      'submit_confirm_1': 'Are you sure you want to submit it?',

      //point screen
      'handed_date': 'Handed date',
      'not_handed': 'Not handed',
      'point': 'Point',

      //course list screen
      'course_list': 'Course List',
      'course_list_empty': 'No course found',

      //profile screen
      'my_profile': 'My Profile',
      'avatar': 'Avatar',
      'email': 'Email',
      'name': 'Name',
      'gender': 'Gender',
      'role': 'Role',
      'created_at': 'Created At',
      'updated_at': 'Updated At',
    },
    'vi_VN': {
      //common
      'search': 'Tìm kiếm',
      'join': 'Tham gia',
      'detail': 'Chi tiết',
      'logout': 'Đăng xuất',
      'note': 'Lưu ý!',
      'status': 'Status',

      //login screen
      'login': 'Đăng nhập',
      'username': 'Tên đăng nhập',
      'password': 'Mật khẩu',
      'username_label': 'Nhập tên đăng nhập của bạn',
      'password_label': 'Nhập mật khẩu của bạn',
      'username_error': 'Tên đăng nhập không được để trống',
      'password_error': 'Mật khẩu không được để trống',
      'password_error_1': 'Mật khẩu phải có ít nhất 6 ký tự',

      //bottom nav bar
      'class': 'Lớp học',
      'course': 'Khoá học',
      'profile': 'Hồ sơ',
      'favorite': 'Yêu thích',
      'result': 'Kết quả',

      //class list screen
      'class_list': 'Danh sách lớp học',
      'class_list_empty': 'Không tìm thấy lớp học nào',

      //class detail screen
      'class_detail': 'Chi tiết lớp học',
      'overview': 'Tổng quan',
      'assignment': 'Bài tập',
      'points': 'Điểm số',

      //assignment screen
      'start': 'Bắt đầu',
      'hand_in': 'Nộp bài',
      'handed': 'Đã nộp',
      'due': 'Hạn nộp',
      'duration': 'Thời gian',
      'm': 'p',
      'overdue': 'Quá hạn',
      'submit_assignment': 'Nộp bài tập',
      'assignment_link': 'Link bài tập',
      'enter_link': 'Nhập link',
      'link_required': 'Link không được để trống',

      //do assignment screen
      'Candidate': 'Thí sinh',
      'time_left': 'Thời gian còn lại',
      'submit': 'Nộp bài',
      'time_up': 'Hết thời gian!',
      'time_up_message': 'Hệ thống sẽ tự động nộp bài của bạn trong 3 giây. Vui lòng chờ...',
      'submit_confirm': 'Bạn chưa hoàn thành bài làm, bạn có chắc chắn muốn nộp bài không?',
      'submit_confirm_1': 'Bạn có chắc chắn muốn nộp bài không?',

      //point screen
      'handed_date': 'Ngày nộp',
      'not_handed': 'Chưa nộp',
      'point': 'Điểm',

      //course list screen
      'course_list': 'Danh sách khoá học',
      'course_list_empty': 'Không tìm thấy khoá học nào',

      //profile screen
      'my_profile': 'Hồ sơ của tôi',
      'avatar': 'Ảnh đại diện',
      'email': 'Email',
      'name': 'Tên',
      'gender': 'Giới tính',
      'role': 'Vai trò',
      'created_at': 'Ngày tạo',
      'updated_at': 'Ngày cập nhật',
    },
  };
}
