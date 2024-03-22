abstract class DashboardRepository {
  Future<Map<String, dynamic>?> getUser(String uid);
  Future<String> getUserName(String uid);
}
