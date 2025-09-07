import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_proxy/shelf_proxy.dart';

void main() async {
  const target = 'https://elba-api.kontur.ru/v1';

  final handler = proxyHandler(target);

  final pipeline = const Pipeline()
      .addMiddleware(_cors())
      .addHandler(handler);

  final server = await io.serve(pipeline, 'localhost', 8080);
  print('Proxy started on http://${server.address.host}:${server.port}');
}

Middleware _cors() {
  return (Handler inner) {
    return (Request req) async {
      if (req.method == 'OPTIONS') {
        // Отвечаем сразу на preflight-запрос
        return Response.ok('', headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': req.headers['access-control-request-headers'] ?? '*',
        });
      }

      final resp = await inner(req);
      return resp.change(headers: {
        ...resp.headers,
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': '*',
      });
    };
  };
}
