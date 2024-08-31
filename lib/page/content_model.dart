class OnboardingContent {
  String image;
  String title;
  String description;
  OnboardingContent(
      {required this.image, required this.description, required this.title});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: "images/assets/screen1.png",
      description: "Pick your Food from Our menu \n         More than 39 times",
      title: "Select from our\n   Best menu"),
  OnboardingContent(
      image: "images/assets/screen2.png",
      description:
          "You can pay cash on delivery\n                         and\n card payment is available",
      title: "Easy and Online Payment"),
  OnboardingContent(
      image: "images/assets/screen3.png",
      description: "Deliver your food at your\n                Doorstep",
      title: "Quick doorstep delivery")
];

class FeedbackContent {
  String feedback;
  FeedbackContent({required this.feedback});
}

List<FeedbackContent> feedback = [
  FeedbackContent(feedback: "Please Enter Name!"),
  FeedbackContent(feedback: "Please Enter Email!"),
  FeedbackContent(feedback: "Please Enter Password!")
];

class UserName {
  static String username = "";
}
