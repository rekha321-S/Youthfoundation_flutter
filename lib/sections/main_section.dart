import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/screenshot_mobile_1.dart';
import 'package:youthfoundationofindia/design_systems/components/label_with_description.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/responsive_row_column.dart';
import 'package:youthfoundationofindia/design_systems/components/svg_scialmedia_widget.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import 'package:youthfoundationofindia/utils/constants.dart';

import '../design_systems/components/assets/donate_heart_image.dart';
import '../design_systems/components/assets/landing_main_background.dart';
import '../design_systems/components/assets/we_need_help_image.dart';
import 'package:url_launcher/url_launcher.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key, required this.onWatchVideo});

  final VoidCallback onWatchVideo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LandingMainBackground(),
        MaxContainer(child: MainContent(onWatchVideo: onWatchVideo)),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key, required this.onWatchVideo});

  final VoidCallback onWatchVideo;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 72 + (Constants.kNavigationBarHeight / 2)),
          child: ResponsiveRowColumn(
            layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
            columnSpacing: 72,
            children: [
              ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (breakpoint.smallerOrEqualToTablet) ...[
                      _SocialMediaLinks(
                        horizontal: true,
                        onLaunchUrl: _launchURL,
                      ),
                      const SizedBox(height: 16),
                    ],
                    const DonateHeartImage(),
                    const LabelWithDescription(
                      title: 'Empowering youth and social service in India.',
                      subtitle:
                          'From small efforts to big impacts, we organize initiatives so communities know what to do, why it matters, and how to make a difference.',
                      labelWithDescriptionType:
                          LabelWithDescriptionType.heading,
                    ),
                    const SizedBox(height: 32),
                    _InstructionButtons(onWatchVideo: onWatchVideo),
                    const SizedBox(height: 32),
                    const WeNeedHelpImage()
                  ],
                ),
              ),
              const ResponsiveRowColumnItem(
                rowFit: FlexFit.tight,
                child: ScreenshotMobile1(),
              ),
            ],
          ),
        ),
        if (!breakpoint.smallerOrEqualToTablet)
          Positioned(
            top: 100,
            right: 10,
            child: _SocialMediaLinks(
              onLaunchUrl: _launchURL,
            ),
          ),
      ],
    );
  }
}

class _SocialMediaLinks extends StatelessWidget {
  const _SocialMediaLinks({
    required this.onLaunchUrl,
    this.horizontal = false,
  });

  final Future<void> Function(String url) onLaunchUrl;
  final bool horizontal;

  @override
  Widget build(BuildContext context) {
    final icons = [
      SocialMediaIcon(
        path: 'assets/fb.svg',
        color: Colors.blue,
        tooltip: 'Facebook',
        onTap: () => onLaunchUrl('https://www.facebook.com/share/1A8Y5jtB8F/'),
      ),
      SocialMediaIcon(
        path: 'assets/insta.svg',
        color: Colors.pink.shade900,
        tooltip: 'Instagram',
        onTap: () => onLaunchUrl(
          'https://www.instagram.com/youthfoundationofindia?igsh=dGg3bTlkd3J4b29x',
        ),
      ),
      SocialMediaIcon(
        path: 'assets/ytube.svg',
        color: Colors.red,
        tooltip: 'YouTube',
        onTap: () => onLaunchUrl(
          'https://youtube.com/@youthfoundationofindia1990?si=ZB3pHEZglJMya57o',
        ),
      ),
      SocialMediaIcon(
        path: 'assets/whatsapp.svg',
        color: Colors.green,
        tooltip: 'WhatsApp',
        onTap: () => onLaunchUrl(
          'https://api.whatsapp.com/send?phone=919108007133&text=Hey%2C%20I%20want%20to%20know%20about%20youth%20foundation%20of%20india',
        ),
      ),
    ];

    if (horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var index = 0; index < icons.length; index++) ...[
            if (index > 0) const SizedBox(width: 12),
            icons[index],
          ],
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final icon in icons) ...[
          icon,
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _InstructionButtons extends StatelessWidget {
  const _InstructionButtons({required this.onWatchVideo});

  final VoidCallback onWatchVideo;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final isMobile = breakpoint.equals(Breakpoint.mobile);

    return ResponsiveRowColumn(
      rowSpacing: 16,
      columnSpacing: 8,
      layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
      children: [
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: SelectionContainer.disabled(
              child: FilledButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Join Us'),
              ),
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          child: SizedBox(
            width: isMobile ? double.infinity : null,
            child: SelectionContainer.disabled(
              child: TextButton(
                onPressed: onWatchVideo,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_circle_outline, size: 24),
                    SizedBox(width: 8),
                    Text('Watch Video'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
