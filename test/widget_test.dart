import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youthfoundationofindia/main_notifier.dart';
import 'package:youthfoundationofindia/sections/main_section.dart';
import 'package:youthfoundationofindia/shared/navigation_bar.dart';
import 'package:youthfoundationofindia/shared/marquee_text_bar.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import 'package:youthfoundationofindia/utils/provider.dart';

void main() {
  testWidgets('marquee stays within its viewport without layout overflow',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SizedBox(
          width: 240,
          child: MarqueeTextBar(text: 'Youth Foundation of India'),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('YOUTH FOUNDATION OF INDIA'), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });

  testWidgets('laptop navigation opens and selects a section', (tester) async {
    String? selectedSection;
    tester.view.physicalSize = const Size(1100, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Provider<MainNotifier>(
            notifier: MainNotifier(),
            child: BreakpointProvider(
              breakpoint: Breakpoint.laptop,
              child: SizedBox(
                width: 1100,
                child: _NavigationHost(
                  onNavigate: (section) => selectedSection = section,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byIcon(Icons.menu), findsOneWidget);
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('Home'), findsOneWidget);
    final homeY = tester.getTopLeft(find.text('Home')).dy;
    final servicesY = tester.getTopLeft(find.text('Services')).dy;
    expect(homeY, closeTo(servicesY, 1));

    await tester.tap(find.text('Home'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    expect(selectedSection, 'Home');
    expect(find.byIcon(Icons.menu), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('desktop app bar navigation stays horizontal', (tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Provider<MainNotifier>(
            notifier: MainNotifier(),
            child: BreakpointProvider(
              breakpoint: Breakpoint.desktop,
              child: const SizedBox(
                width: 1440,
                child: _NavigationHost(onNavigate: _ignoreNavigation),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsNothing);
    expect(
      tester.getTopLeft(find.text('Home')).dy,
      closeTo(tester.getTopLeft(find.text('Products')).dy, 1),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('homepage Watch Video button invokes its action', (tester) async {
    var watchedVideo = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              width: 390,
              child: BreakpointProvider(
                breakpoint: Breakpoint.mobile,
                child: MainSection(
                  onWatchVideo: () => watchedVideo = true,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump(const Duration(milliseconds: 100));
    await tester.ensureVisible(find.text('Watch Video'));
    await tester.tap(find.text('Watch Video'));
    await tester.pump();

    expect(watchedVideo, isTrue);
    expect(tester.takeException(), isNull);
  });
}

void _ignoreNavigation(String section) {}

class _NavigationHost extends StatelessWidget {
  const _NavigationHost({required this.onNavigate});

  final void Function(String section) onNavigate;

  @override
  Widget build(BuildContext context) {
    return NavBar(onNavigate: onNavigate);
  }
}
