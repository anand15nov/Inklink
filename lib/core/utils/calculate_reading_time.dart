int calculateReadingTime(String content) {
  final wordCount = content.split(RegExp(r'\s+')).length; //space newline char

  final readingTime =  wordCount/225;

  return readingTime.ceil();
}
