class MaterialPriceQueryMutation {
  /* For fetching material price  */
  String getMaterialPrice(bool useNewEndpoint) {
    return '''
      query price(
        \$customer: String!
        \$salesOrganisation: String!
        \$request: [PriceRequest!]!
        \$shipToCode: String!
        ) {
          ${useNewEndpoint ? 'GetPriceList' : 'price'}(
            customer: \$customer
            salesOrganisation: \$salesOrganisation
            request: \$request
            shipToCode: \$shipToCode
          ) {
            MaterialNumber
            OldMaterialCode
            ListPrice
            FinalIndividualPrice
            FinalTotalPrice
            DiscountedValue
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
            ComboDeals {
              Eligible
              FlexibleGroup
              SalesDeal
              Category {
                Type
                Value
              }
            }
            ${useNewEndpoint ? '''
              ConditionFlags {
                IsFOC
              }
            ''' : ''}
          }
        }
    ''';
  }
}
