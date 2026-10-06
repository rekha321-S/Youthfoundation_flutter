import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../design_systems/components/assets/quote_image.dart';
import '../design_systems/components/label_with_description.dart';
import '../design_systems/typography/text_styles.dart';
import '../utils/breakpoint.dart';

class FounderVideoSection extends StatelessWidget {
  const FounderVideoSection({super.key});
  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: MaxContainer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 600;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: isMobile
                    ? Column(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraint) {
                              final fullWidth = constraint.biggest.width;
                              final halfWidth = fullWidth / 1.5;

                              final width = breakpoint.largerOrEqualToLaptop
                                  ? halfWidth
                                  : fullWidth;

                              return Container(
                                width: width,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: const LabelWithDescription(
                                  labelWithDescriptionAlign:
                                      LabelWithDescriptionAlign.center,
                                  title: 'Youth Foundation Founder ',
                                  subtitle:
                                      'A life devoted to service, dignity, and community.',
                                ),
                              );
                            },
                          ),
                          const FounderImage(),
                          const SizedBox(height: 20),
                          const VideoContent(),
                        ],
                      )
                    : Column(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraint) {
                              final fullWidth = constraint.biggest.width;
                              final halfWidth = fullWidth / 1.5;

                              final width = breakpoint.largerOrEqualToLaptop
                                  ? halfWidth
                                  : fullWidth;

                              return Container(
                                width: width,
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(bottom: 10),
                                child: const LabelWithDescription(
                                  labelWithDescriptionAlign:
                                      LabelWithDescriptionAlign.center,
                                  title: 'Youth Foundation Founder ',
                                  subtitle:
                                      'A life devoted to service, dignity, and community.',
                                ),
                              );
                            },
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: FounderImage(),
                              ), // Image on left for larger screens
                              SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: VideoContent(),
                              ), // Content on right
                            ],
                          ),
                        ],
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FounderImage extends StatelessWidget {
  const FounderImage({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(
                  'assets/founder_image.jpg'), // Replace with your image path
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const QuoteSection(
            story:
                "I have a dream that one day this society will rise up and embrace the true essence of compassion: 'We hold this belief to be undeniable, that every individual, regardless of their circumstances, deserves dignity, equality, and the chance to lead a better life.",
            personName: "Shankar V Prajapathi",
            position: "Founder",
            company: "Youth Foundation of India")
      ],
    );
  }
}

class VideoContent extends StatelessWidget {
  const VideoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: YouTubePlayerScreen(),
        )),
      ],
    );
  }
}

class YouTubePlayerScreen extends StatefulWidget {
  const YouTubePlayerScreen({super.key});

  @override
  _YouTubePlayerScreenState createState() => _YouTubePlayerScreenState();
}

class _YouTubePlayerScreenState extends State<YouTubePlayerScreen> {
  late YoutubePlayerController _controller;
  int videoIndex = 0;
  final List<String> videoList = ['ZKo3M-TloWk', 'sPica3i428A'];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    )..loadVideoById(videoId: videoList[videoIndex]);
  }

  void changeVideo(bool isNext) {
    setState(() {
      if (isNext) {
        videoIndex = (videoIndex + 1) % videoList.length;
      } else {
        videoIndex = (videoIndex - 1 + videoList.length) % videoList.length;
      }
      _controller.loadVideoById(videoId: videoList[videoIndex]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ArrowButton(
          onTap: () => changeVideo(false),
          iconData: Icons.arrow_back_ios_new,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: YoutubePlayer(controller: _controller),
          ),
        ),
        ArrowButton(
          onTap: () => changeVideo(true),
          iconData: Icons.arrow_forward_ios,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class VideoContentsPlayer extends StatefulWidget {
  const VideoContentsPlayer({
    super.key,
  });

  @override
  _VideoContentsPlayerState createState() => _VideoContentsPlayerState();
}

class _VideoContentsPlayerState extends State<VideoContentsPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    )..loadPlaylist(
        list: ['ZKo3M-TloWk', 'ZKo3M-TloWk'],
        listType: ListType.playlist,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayer(controller: _controller),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });
  final void Function() onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary600, borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Icon(
            iconData,
            color: AppColors.neutral300,
          )),
        ),
      ),
    );
  }
}

class QuoteSection extends StatelessWidget {
  const QuoteSection({
    super.key,
    required this.story,
    required this.personName,
    required this.position,
    required this.company,
  });

  final String story;

  final String personName;

  final String position;

  final String company;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
            color: AppColors.neutral900.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
            color: AppColors.neutral900.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const QuoteImage(),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story,
                      style: AppTextStyles.bodyLargeRegular.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      personName,
                      style: AppTextStyles.bodyLargeBold.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                    Text(
                      '$position, $company',
                      style: AppTextStyles.bodyMediumRegular.copyWith(
                        color: AppColors.neutral500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
