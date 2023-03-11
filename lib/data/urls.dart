class Urls {
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String loginUrl = '$baseUrl/login';
  static String registrationUrl = '$baseUrl/registration';
  static String createNewTaskUrl = '$baseUrl/createTask';
  static String newTaskUrl = '$baseUrl/listTaskByStatus/New';
  static String completedTaskUrl = '$baseUrl/listTaskByStatus/Completed';
  static String profileUpdateUrl = '$baseUrl/profileUpdate';

  static String changeTaskStatus(String taskId, String status) =>
      '$baseUrl/updateTaskStatus/$taskId/$status';

  static String recoverVerifyEmailUrl(String email) =>
      '$baseUrl/RecoverVerifyEmail/$email';
}
