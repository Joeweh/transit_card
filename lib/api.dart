import 'dart:convert';

class GWalletAPI {
  static String formatRequest() {
    const loyaltyClassDef =
    """
    {
      "id": "ISSUER_ID.LOYALTY_CLASS_ID",
      "programLogo": {
        "sourceUri": {
          "uri": "https://images.unsplash.com/photo-1512568400610-62da28bc8a13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=660&h=660"
        },
        "contentDescription": {
          "defaultValue": {
            "language": "en-US",
            "value": "LOGO_IMAGE_DESCRIPTION"
          }
        }
      },
      "localizedIssuerName": {
        "defaultValue": {
          "language": "en-US",
          "value": "[TEST ONLY] Heraldic Coffee"
        }
      },
      "localizedProgramName": {
        "defaultValue": {
          "language": "en-US",
          "value": "Heraldic Rewards"
        }
      },
      "hexBackgroundColor": "#72461d",
      "heroImage": {
        "sourceUri": {
          "uri": "https://images.unsplash.com/photo-1447933601403-0c6688de566e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&h=336"
        },
        "contentDescription": {
          "defaultValue": {
            "language": "en-US",
            "value": "HERO_IMAGE_DESCRIPTION"
          }
        }
      }
    }
    """;

    const loyaltyObjectDef =
    """
    {
      "id": "ISSUER_ID.OBJECT_ID",
      "classId": "ISSUER_ID.LOYALTY_CLASS_ID",
      "loyaltyPoints": {
        "balance": {
          "int": "1234"
        },
        "localizedLabel": {
          "defaultValue": {
            "language": "en-US",
            "value": "Reward Points"
          }
        }
      },
      "barcode": {
        "type": "QR_CODE",
        "value": "BARCODE_VALUE",
        "alternateText": ""
      }
    }
    """;

    final request = <String, dynamic> {
      "iss": "",
      "aud": "google",
      "typ": "savetowallet",
      "origins": [],
      "payload": {
        "loyaltyObjects": [
          jsonDecode(loyaltyObjectDef)
        ],
        "loyaltyClasses": [
          jsonDecode(loyaltyClassDef)
        ],
      }
    };

    return jsonEncode(request);
  }
}