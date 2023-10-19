abstract class IApiService<T> {
  Future<T> fetch(String endpoint);
}
