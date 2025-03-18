// This class is responsible for all the queries for the GraphQl
// for fetching the data from the APIs and the params are mentioned
// in each and every query we require for the functionality

class PriceOverrideQueryMutation {
  String getItemPriceOverride() {
    return '''


query price(
        \$customer: String!
        \$salesOrganisation: String!
        \$request: [PriceRequest!]!
        ) {
          price(
            customer: \$customer
            salesOrganisation: \$salesOrganisation
            request: \$request
          ) {
            MaterialNumber
            OldMaterialCode
            ListPrice
            FinalIndividualPrice
            DiscountedValue
            FinalTotalPrice
            IsMOVExclusion
            PriceRules {
              Type
              Rate
              Conditions
              TieredRules {
                Tier
                RuleTier {
                  Rate
                  Quantity
                }
              }
              BonusEligible
              ConditionNumber
              OverriddenBy
              MaxQuota
              RemainingQuota
            }
            Bonuses {
              BonusTiers {
                BonusMaterial {
                  Id
                  MaterialNumber
                  MaterialDescription
                  Calculation
                  BonusRatio
                  QualifyingQuantity
                  BonusQuantity
                  LimitPerTransaction
                  ConditionId
                  OldMaterialCode
                }
                Calculation
                QualifyingQuantity
              }
            }
            TieredPricing {
              Tier
              PriceTier {
                Sequence
                Quantity
                Type
                Rate
                ApplyBonus
                Percentage
                MinAmount
                ScaleBasis
                PromotionAmount
              }
            }
            Bundles {
              BundleName
              BundleCode
              Conditions
              BonusEligible
              BundleInformation {
                Sequence
                Quantity
                Type
                Rate
              }
            }
            Valid
            AdditionalBonusEligible
            ZMGDiscount
            ZDP5MaxQuota
            ZDP5RemainingQuota
            ExceedQty
            OverridenRulePresent
            OverridenRules {
              Type
              Rate
              Conditions
              TieredRules {
                Tier
                RuleTier {
                  Rate
                  Quantity
                }
              }
              BonusEligible
              ConditionNumber
              OverriddenBy
              MaxQuota
              RemainingQuota
            }
            OverridenRuleTier {
              Rate
              Quantity
              Conditions
              Tier
              Overrider
            }
          }
        }
    ''';
  }
}
