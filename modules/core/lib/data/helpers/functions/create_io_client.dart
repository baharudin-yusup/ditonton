// coverage:ignore-start
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/io_client.dart';

Future<IOClient> createIoClient(String certificatePath) async {
  final sslCert = await rootBundle.load(certificatePath);
  final securityContext = SecurityContext(withTrustedRoots: false)
    ..setTrustedCertificatesBytes(sslCert.buffer.asInt8List());
  final httpClient = HttpClient(context: securityContext)
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => false;
  return IOClient(httpClient);
}
// coverage:ignore-end
