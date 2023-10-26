final class JsonService {
  const JsonService._();

  static const instance = JsonService._();

  Future<bool> load(Stream<List<int>> bytes) async {
    // TODO: Implement this method
    await Future.delayed(const Duration(seconds: 3));
    return false;
  }
}
