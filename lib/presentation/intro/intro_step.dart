import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_object.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroStep extends StatelessWidget {
  final IntroObject introObject;
  final bool isLastPage;
  final Function() getStarted;
  final Function() nextPage;

  const IntroStep({
    super.key,
    required this.introObject,
    required this.getStarted,
    required this.nextPage,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: SvgPicture.asset(
            introObject.assetsPath,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.tr(introObject.heading),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: introObject.headingColor,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                context.tr(introObject.description),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: introObject.descriptionColor),
              ),
              const Spacer(),
              SizedBox(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: OutlinedButton(
                        key: WidgetKeys.introGetStartedButton,
                        style: Theme.of(context)
                            .outlinedButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: WidgetStateProperty.all(
                                introObject.buttonBGColor,
                              ),
                            ),
                        onPressed: isLastPage ? getStarted : nextPage,
                        child: Text(
                          context.tr(
                            isLastPage
                                ? context.tr('Get started')
                                : context.tr('Next'),
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(color: introObject.buttonTextColor),
                        ),
                      ),
                    ),
                    if (!isLastPage)
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextButton(
                            key: WidgetKeys.introSkipButton,
                            onPressed: getStarted,
                            child: Text(
                              context.tr('Skip'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: ZPColors.paleLime),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
