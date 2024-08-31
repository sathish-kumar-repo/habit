String formatDuration(Duration duration, bool isShowSeconds) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

  return "${duration.inHours != 0 ? '${twoDigits(duration.inHours)} hrs : ' : ''}$twoDigitMinutes min${isShowSeconds ? ':$twoDigitSeconds' : ''}";
}
