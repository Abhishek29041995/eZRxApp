part of 'package:ezrxmobile/presentation/payments/new_claim_submission/new_claim_submission_page.dart';

class _NewClaimInformationSection extends StatelessWidget {
  const _NewClaimInformationSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(
            context.tr(
              'Please select the Claim type and submit your claim with related document',
            ),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.neutralsGrey1,
                ),
          ),
        ),
        const _PrincipalSearchField(),
        const _ClaimTypeField(),
        const _ClaimAmountField(),
        const _ClaimDetailField(),
        const _UploadDocumentsSection(),
        const SizedBox(height: 32),
      ],
    );
  }
}
