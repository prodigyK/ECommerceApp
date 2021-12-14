import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.02),
        Column(
          children: errors.map((item) => buildErrorItem(errorText: item)).toList(),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
      ],
    );
  }

  Row buildErrorItem({required String errorText}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          width: getProportionalScreenWidth(14),
          height: getProportionalScreenHeight(14),
        ),
        SizedBox(width: getProportionalScreenWidth(10)),
        Text(errorText),
      ],
    );
  }
}
