class DateTimeUtil {
  /// [now] returns [DateTime] in local time zone.
  static DateTime get now => DateTime.now();

  /// [utc] returns [DateTime] in utc.
  static DateTime get utc => DateTime.utc(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second,
        now.millisecond,
        now.microsecond,
      );
}
