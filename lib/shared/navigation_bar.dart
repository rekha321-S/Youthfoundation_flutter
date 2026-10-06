import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/app_store_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/google_play_image.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/logo_with_text.dart';
import 'package:youthfoundationofindia/design_systems/components/max_container.dart';
import 'package:youthfoundationofindia/design_systems/components/assets/text_link_button.dart';
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';
import 'package:youthfoundationofindia/main_notifier.dart';
import 'package:youthfoundationofindia/shared/marquee_text_bar.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import 'package:youthfoundationofindia/utils/constants.dart';
import 'package:youthfoundationofindia/utils/provider.dart';

typedef NavigationCallback = void Function(String sectionName);

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.onNavigate});

  final NavigationCallback onNavigate;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final popoverKey = UniqueKey();
  final overlayPortalController = OverlayPortalController();
  bool isShowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (BreakpointProvider.of(context).largerThanTablet) {
      hide();
    }
  }

  void hide() {
    if (isShowing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        overlayPortalController.hide();

        setState(() {
          isShowing = false;
        });
      });
    }
  }

  bool isColorTransparent(bool isExceedNavbar) {
    if (isExceedNavbar) {
      return false;
    }

    return !isShowing;
  }

  void toggle() {
    overlayPortalController.toggle();

    if (isShowing != overlayPortalController.isShowing) {
      setState(() {
        isShowing = overlayPortalController.isShowing;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<MainNotifier>(context);

    return TapRegion(
      groupId: popoverKey,
      child: OverlayPortal(
        controller: overlayPortalController,
        overlayChildBuilder: (context) {
          return TapRegion(
            groupId: popoverKey,
            onTapOutside: (event) => hide(),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: Constants.kNavigationBarHeight + 32,
                ),
                padding: const EdgeInsets.only(bottom: 24),
                width: double.infinity,
                child: Material(
                  color: Colors.white,
                  child: _NavbarOverlay(
                    onNavigate: (section) {
                      widget.onNavigate(section);
                      hide();
                    },
                  ),
                ),
              ),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Navbar(
              isShowing: isShowing,
              isColorTransparent: isColorTransparent(notifier.value),
              onPressed: toggle,
              onNavigate: widget.onNavigate,
            ),
            const SizedBox(
              width: double.infinity,
              child: MarqueeTextBar(
                text:
                    'Welcome to Youth Foundation of India — Empowering youth & communities every day.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar({
    required this.isShowing,
    required this.isColorTransparent,
    required this.onPressed,
    required this.onNavigate,
  });

  final bool isShowing;
  final bool isColorTransparent;
  final GestureTapCallback onPressed;
  final NavigationCallback onNavigate;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final showNavigation = breakpoint.largerThanLaptop;
    final showStoreLogo = breakpoint.largerOrEqualToTablet;
    final showBarsIcon = !showNavigation;

    return ColoredBox(
      color: isColorTransparent ? Colors.transparent : Colors.white,
      child: MaxContainer(
        child: SizedBox(
          height: Constants.kNavigationBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LogoWithTextImage(),
              if (showNavigation) ...{
                const SizedBox(width: 32),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _Navigation(onNavigate: onNavigate),
                  ),
                ),
              },
              if (showStoreLogo || showBarsIcon) ...{
                if (!showNavigation) const Spacer(),
                if (showStoreLogo) ...{
                  const _Apps(),
                },
                if (showBarsIcon) ...{
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: onPressed,
                    icon: Icon(isShowing ? Icons.close : Icons.menu, size: 24),
                  ),
                }
              },
            ],
          ),
        ),
      ),
    );
  }
}

class _NavbarOverlay extends StatelessWidget {
  const _NavbarOverlay({required this.onNavigate});

  final NavigationCallback onNavigate;

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);
    final showStores = breakpoint.equals(Breakpoint.mobile);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Navigation(onNavigate: onNavigate),
          if (showStores) ...[
            const SizedBox(width: 16),
            const _Apps(),
          ],
        ],
      ),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({required this.onNavigate});

  final NavigationCallback onNavigate;

  @override
  Widget build(BuildContext context) {
    const navigation = [
      'Home',
      'Services',
      'Products',
      'Courses',
      'Contact us',
      'Help',
      'Job',
      'Donate',
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final label in navigation) _buildNavigationItem(context, label),
      ],
    );
  }

  Widget _buildNavigationItem(BuildContext context, String label) {
    if (label == 'Job') {
      return PopupMenuButton<String>(
        tooltip: 'Job options',
        offset: const Offset(0, 12),
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onSelected: onNavigate,
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'Job Apply',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Job Apply'),
          ),
          const PopupMenuItem(
            value: 'Add Business',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Add Business'),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Text(
            label,
            style: AppTextStyles.bodySmallSemiBold
                .copyWith(color: AppColors.primary600),
          ),
        ),
      );
    }

    if (label == 'Donate') {
      return PopupMenuButton<String>(
        tooltip: 'Donation options',
        offset: const Offset(0, 12),
        color: Colors.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onSelected: onNavigate,
        itemBuilder: (context) => [
          const PopupMenuItem(
            value: 'Food donate',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Food donate'),
          ),
          const PopupMenuItem(
            value: 'Old age donate',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Old age donate'),
          ),
          const PopupMenuItem(
            value: 'Handicapped donate',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Handicapped donate'),
          ),
          const PopupMenuItem(
            value: 'Blind Donate',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Blind Donate'),
          ),
          const PopupMenuItem(
            value: 'Goshala donate',
            textStyle: TextStyle(color: Colors.white),
            child: Text('Goshala donate'),
          ),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Text(
            label,
            style: AppTextStyles.bodySmallSemiBold
                .copyWith(color: AppColors.primary600),
          ),
        ),
      );
    }

    return TextLinkButton.light(label, () => onNavigate(label));
  }
}

class _Apps extends StatelessWidget {
  const _Apps();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GooglePlayImage(),
        SizedBox(width: 12),
        AppStoreImage(),
      ],
    );
  }
}
