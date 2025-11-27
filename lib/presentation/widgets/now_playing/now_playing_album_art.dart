import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jolly_podcast/core/constants/app_colors.dart';
import 'package:jolly_podcast/core/constants/app_dimensions.dart';

/// {@template now_playing_album_art}
/// Album art widget for the Now Playing screen.
///
/// Displays the episode artwork with loading and error states.
/// Single Responsibility: Display episode artwork only.
/// {@endtemplate}
///
/// **Implementation Note:** Custom implementation for Jolly Podcast Assessment
/// **Date:** 2025-11-26
/// **Purpose:** Bloocode Technology Recruitment - Widget Extraction
class NowPlayingAlbumArt extends StatelessWidget {
  const NowPlayingAlbumArt({
    required this.imageUrl,
    super.key,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: AspectRatio(
          aspectRatio: 1,
          child: imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: AppColors.surfaceDark,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.surfaceDark,
                    child: const Icon(
                      Icons.music_note,
                      size: AppDimensions.iconHuge,
                      color: Colors.white54,
                    ),
                  ),
                )
              : Container(
                  color: AppColors.surfaceDark,
                  child: const Icon(
                    Icons.music_note,
                    size: AppDimensions.iconHuge,
                    color: Colors.white54,
                  ),
                ),
        ),
      ),
    );
  }
}
