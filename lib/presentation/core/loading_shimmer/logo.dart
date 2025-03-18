part of 'loading_shimmer.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return _WithChild(
      enabled: true,
      child: SvgPicture.asset(
        'assets/svg/ezrx+logo.svg',
        height: 30,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
