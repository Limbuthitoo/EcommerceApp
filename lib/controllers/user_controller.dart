import 'package:ecommerce/model/response_model.dart';
import 'package:ecommerce/model/user_model.dart';
import 'package:ecommerce/service/repository/user_repo.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserModel? _userModel;
  UserModel? get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    print("test " + response.body.toString());
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      responseModel = ResponseModel(true, "Successfull");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
