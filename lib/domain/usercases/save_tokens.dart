import 'package:base_project/domain/repositories/secure_repository.dart';

class SaveTokens {
  final SecureRepository secureRepository;

  SaveTokens(this.secureRepository);

  Future<void> execute(String accessToken, String refreshtoken) async {
    await secureRepository.saveAccessToken(accessToken);
    await secureRepository.saveRefreshToken(refreshtoken);
  }
}
