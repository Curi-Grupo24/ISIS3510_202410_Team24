import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<dynamic> setUserProperties(String userId) async {
    await _analytics.setUserProperty(name: 'user_id', value: userId);
    //We can set any information we need from our user
  }

  Future<dynamic> setUserFiltersHistory({
    String major = 'None',
    String? specialType = 'None',
    String semester = 'None',
    String course_name = 'None',
  }) async {
    await _analytics.logEvent(
      name: 'used_filters',
      parameters: <String, dynamic>{
        'major': major,
        'type': specialType,
        'semester': semester,
        'course_name': course_name,
      },
    );
  }

  Future<dynamic> setScheduledHour(String scheduledHour) async {
    await _analytics.logEvent(
      name: 'scheduled_hour',
      parameters: <String, dynamic>{
        'scheduled_hour': scheduledHour,
      },
    );
  }

  Future<dynamic> setTutorshipByMonth(String month, String courseName) async {
    await _analytics.logEvent(
      name: 'course_month',
      parameters: <String, dynamic>{
        'month': month,
        'course_name': courseName,
      },
    );
  }

  Future<dynamic> setTutorshipByUser(
    String course_name,
    String tutor_name,
  ) async {
    await _analytics.logEvent(
      name: 'scheduled_tutorship',
      parameters: <String, dynamic>{
        'course_name': course_name,
        'tutor_name': tutor_name,
      },
    );
  }
}
