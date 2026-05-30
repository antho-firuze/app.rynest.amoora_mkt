extension DurationUtils on Duration {
  /// Format Duration to Custom String
  ///
  /// Example
  /// ```
  /// 'hh:nn:ss'  -> 02:55:30   // Default
  /// 'nn:ss'     -> 01:30
  /// ```
  String custom([String? pattern = 'hh:nn:ss']) {
    String hh = inHours.abs().toString().padLeft(2, "0");
    String nn = inMinutes.abs().remainder(60).toString().padLeft(2, "0");
    String ss = inSeconds.abs().remainder(60).toString().padLeft(2, "0");

    switch (pattern) {
      case 'nn:ss':
        return '$nn:$ss';
      default:
        return '$hh:$nn:$ss';
    }
  }

  String timeAgo({bool numericDates = true}) {
    final difference = abs();

    if (difference.inSeconds < 5) {
      return 'Just now';
    } else if (difference.inSeconds <= 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes <= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inMinutes <= 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours <= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inHours <= 60) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays <= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inDays <= 6) {
      return '${difference.inDays} days ago';
    } else if ((difference.inDays / 7).ceil() <= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if ((difference.inDays / 7).ceil() <= 4) {
      return '${(difference.inDays / 7).ceil()} weeks ago';
    } else if ((difference.inDays / 30).ceil() <= 1) {
      return (numericDates) ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 30).ceil() <= 30) {
      return '${(difference.inDays / 30).ceil()} months ago';
    } else if ((difference.inDays / 365).ceil() <= 1) {
      return (numericDates) ? '1 year ago' : 'Last year';
    }
    return '${(difference.inDays / 365).floor()} years ago';
  }
}
