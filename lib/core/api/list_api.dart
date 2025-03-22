class ListAPI {
  ListAPI._();

  static const String BASE_URL = "https://api.tozauz.uz/api/";
  static const String ACCESS_TOKEN = 'access-token';
  static const String RefreshToken = 'refresh-token';
  static const String LANG = 'app_lang';
  static const String OnBoard = 'app_onboarding';
  static const String themeIsSystem = 'themeIsSystem';
  static const String theme = 'theme';
  static const String userID = 'userID';
  static const String token = "Token";

  /// News

  static const String login = 'v1/account/api-token-auth/';
  static const String boxes = 'v1/ecopacket/agent/boxes/';
  static const String agentEarnings = 'v1/bank/agent-earning-list/';
  static const String meBank = 'v1/bank/me-bank/';
  static const String archivePayment = 'v1/bank/agent/payme/list/';

  static const String agentAppCreate = "v1/bank/agent-application-create/";
  static const String agentPayMeCreate = "v1/bank/agent/payme/create/";
  static const String userUpdatePassword = "v1/account/user-update-password/";
  static const String ecoPacketBoxesById = "v1/ecopacket/boxes/";
  static const String payMeList = "v1/bank/payme-list";
  static const String agentApplicationList = "v1/bank/agent-application-list/";
}
