import '../../../core/network/simple_client.dart';
import '../../../core/remote_data_source_mixin.dart';
import '../../core/network/network_constants.dart';
import '../model/home_model.dart';

class HomeDatasource with RemoteDataSourceMixin {
  final SimpleClient _client;
  final NetworkConstants _networkConstants;
  HomeDatasource(this._client, this._networkConstants);

  Future<List<UserListModel>> getUserList() async {
    return call<List<UserListModel>>(() async {
      Uri url = Uri.parse(
        _networkConstants.userListEndPoint,
      );
      dynamic response = await _client.get(
        url,
        headers: _networkConstants.getHeadersForLogin(),
      );
      List<UserListModel> list = [];
      for (dynamic item in response) {
        list.add(UserListModel.fromJson(item));
      }
      return list;
    });
  }
}
