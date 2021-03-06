part of flutter_parse_sdk;

void logger(String appName, String className, String type,
    ParseResponse parseResponse) {
  String responseString = ' \n';
  String name = appName;
  if (name.isNotEmpty) {
    name = '$appName ';
  }

  responseString += '----\n${name}API Response ($className : $type) :';

  if (parseResponse.success) {
    responseString += '\nStatus Code: ${parseResponse.statusCode}';
    if (parseResponse.result != null) {
      responseString += '\nPayload: ${parseResponse.result.toString()}';
    } else {
      responseString += '\nReponse: OK';
    }
  } else if (!parseResponse.success) {
    responseString += '\nStatus Code: ${parseResponse.error.code}';
    responseString += '\nType: ${parseResponse.error.type}';

    final String errorOrException =
        parseResponse.error.isTypeOfException ? 'Exception' : 'Error';

    responseString += '\n$errorOrException: ${parseResponse.error.message}';
  }

  responseString += '\n----\n';
  print(responseString);
}

void logRequest(
    String appName, String className, String type, String uri, String body) {
  String requestString = ' \n';
  String name = appName;
  if (name.isNotEmpty) {
    name = '$appName ';
  }
    requestString += '----\n${name}API Request ($className : $type) :';
    requestString += '\nUri: $uri';
    requestString += '\nBody: $body';

    requestString += '\n----\n';
    print(requestString);
}
