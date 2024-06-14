class Services{
  static final Services instance = Services();

  String convertDateToString(DateTime dateTime){
    String day = dateTime.day < 10 ? '0${dateTime.day}' : dateTime.day.toString();
    String month = dateTime.month < 10 ? '0${dateTime.month}' : dateTime.month.toString();

    return "$day/$month/${dateTime.year}";
  }
}