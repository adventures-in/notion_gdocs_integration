import 'package:functions_framework/functions_framework.dart';
import 'package:googleapis/docs/v1.dart' hide Request, Response;
import 'package:googleapis/sheets/v4.dart' hide Request, Response;
import 'package:googleapis/slides/v1.dart' hide Request, Response;
import 'package:googleapis_auth/auth_io.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final authClient = await clientViaApplicationDefaultCredentials(
    scopes: [
      DocsApi.documentsReadonlyScope,
      SheetsApi.spreadsheetsReadonlyScope,
      SlidesApi.presentationsReadonlyScope,
    ],
  );

  final slidesApi = SlidesApi(authClient);
  final presentation = await slidesApi.presentations
      .get('16CMGt3BZOX709yX_jPmsacqPuo3vC3eKqqBv41z00Wk');

  print(presentation.slides?.first.pageProperties);

  return Response.ok('Hello, World!');
}
