class NetworkConstants {
  String get prodUrl => 'https://jsonplaceholder.typicode.com/';
  String get devUrl => 'https://jsonplaceholder.typicode.com/';
  String get baseUrl => devUrl;
  String get userListEndPoint => '${devUrl}users';

  getHeadersForLogin() {
    return {'Content-Type': 'application/json'};
  }
}
