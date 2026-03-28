import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wize_cards/core/utils/color_constants.dart';
import 'package:wize_cards/core/utils/constant.dart';
import 'package:wize_cards/features/deck/constanst/deck_screen_constant.dart';

class DeckShimmerWidget extends StatelessWidget {
  const DeckShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(SpacingConstants.small),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: SpacingConstants.small),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(BorderRadiusConstants.large),
            ),
            clipBehavior: Clip.antiAlias,
            shadowColor: theme.shadowColor,
            elevation: 1,
            child: Shimmer.fromColors(
              baseColor: ColorConstants.baseLoading,
              highlightColor: ColorConstants.highlightLoading,
              child: SizedBox(
                height: DeckScreenConstants.sizeCard,
                child: Column(
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(SpacingConstants.medium),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: ColorConstants.baseLoading,
                              borderRadius: BorderRadius.circular(
                                BorderRadiusConstants.medium,
                              ),
                            ),
                            child: SizedBox(
                              width: SizeConstants.cardSize,
                              height: SizeConstants.cardSize,
                            ),
                          ),
                    
                          const SizedBox(width: SpacingConstants.medium),
                    
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: ColorConstants.baseLoading,
                                    borderRadius: BorderRadius.circular(
                                      BorderRadiusConstants.small,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: TextSizeConstants.subtitle,
                                  ),
                                ),
                    
                                const SizedBox(height: SpacingConstants.small),
                    
                                Row(
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: ColorConstants.baseLoading,
                                        borderRadius: BorderRadius.circular(
                                          BorderRadiusConstants.small,
                                        ),
                                      ),
                                        child: Text(
                                        '0 ${DeckScreenConstants.cards}',
                                        style: theme.textTheme.bodyMedium?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: TextSizeConstants.body,
                                        ),
                                      ),
                                    ),
                    
                                    const SizedBox(width: SpacingConstants.small),
                    
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: ColorConstants.baseLoading,
                                        borderRadius: BorderRadius.circular(
                                          BorderRadiusConstants.small,
                                        ),
                                      ),
                                        child: Text(
                                          '• ${DeckScreenConstants.lastStudied}: Today',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: theme.textTheme.bodyMedium?.copyWith(
                                            fontSize: TextSizeConstants.body,
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                    
                          const SizedBox(width: SpacingConstants.small),
                    
                          Icon(
                            Icons.chevron_right,
                            color: theme.colorScheme.secondary,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorConstants.baseLoading,
                        borderRadius: BorderRadius.circular(
                          BorderRadiusConstants.small,
                        ),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: ThicknessConstans.md,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}