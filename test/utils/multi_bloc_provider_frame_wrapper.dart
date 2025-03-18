import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'material_frame_wrapper.dart';

class MultiBlocProviderFrameWrapper extends StatelessWidget {
  final List<BlocProvider> providers;
  final Widget child;
  final bool useMediaQuery;
  final bool usingLocalization;
  const MultiBlocProviderFrameWrapper({
    super.key,
    required this.providers,
    required this.child,
    this.useMediaQuery = true,
    this.usingLocalization = false,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialFrameWrapper(
        useMediaQuery: useMediaQuery,
        usingLocalization: usingLocalization,
        child: child,
      ),
    );
  }
}
