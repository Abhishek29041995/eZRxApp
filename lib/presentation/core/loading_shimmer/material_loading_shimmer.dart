part of 'loading_shimmer.dart';

class MaterialLoading extends StatelessWidget {
  const MaterialLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: Responsive.isLargerThan(context, Breakpoint.desktop)
            ? MediaQuery.of(context).size.width * 0.25
            : MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: LoadingShimmer.withChild(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                    ),
                    color: ZPColors.white,
                  ),
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LoadingShimmer.withChild(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      flex: 6,
                      child: LoadingShimmer.withChild(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Expanded(
                      child: LoadingShimmer.withChild(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(right: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Expanded(
                      flex: 2,
                      child: LoadingShimmer.withChild(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(right: 70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: ZPColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
