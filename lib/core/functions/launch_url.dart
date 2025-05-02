import 'package:bookly_app_arch/core/functions/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, {required String? url}) async {
  if (url != null) {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  } else {
    customSnackBar(context, 'Cannot launch $url');
  }
}
