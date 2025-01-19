import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';

class GWalletAPI {
  static final _objectId = const Uuid().v4();

  static String formatRequest() {
    final issuerId = dotenv.env['GOOGLE_WALLET_ISSUER_ID'];
    final passClass = dotenv.env['GOOGLE_WALLET_PASS_CLASS'];
    final serviceAccountEmail = dotenv.env['GOOGLE_CLOUD_SERVICE_ACCOUNT'];
    final iat = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final loyaltyObjectDef =
    """
    {
      "id": "$issuerId.$_objectId",
      "classId": "$issuerId.$passClass",
      "state": "ACTIVE",
      "loyaltyPoints": {
        "balance": {
          "int": "2530"
        },
        "localizedLabel": {
          "defaultValue": {
            "language": "en-US",
            "value": "Portal Points"
          }
        }
      }
    }
    """;

    final request =
    """ 
    {
      "iss": $serviceAccountEmail,
      "aud": "google",
      "typ": "savetowallet",
      "iat": $iat,
      "origins": [
        "https://localhost:8080"
      ],
      "payload": {
        "loyaltyObjects": [
          $loyaltyObjectDef
        ]
      }
    }
    """;

    return request;
  }
}