import 'package:flutter/material.dart';
import 'package:youthfoundationofindia/main_notifier.dart';
import 'package:youthfoundationofindia/repository/create_new_user.dart';
import 'package:youthfoundationofindia/screens/registration_member.dart';
import 'package:youthfoundationofindia/screens/registration_volunteer.dart';
import 'package:youthfoundationofindia/sections/job_apply_page_section.dart';
import 'package:youthfoundationofindia/sections/account_details_section.dart';
import 'package:youthfoundationofindia/sections/achievements_section.dart';
import 'package:youthfoundationofindia/sections/caption_section.dart';
import 'package:youthfoundationofindia/sections/courses_section.dart';
import 'package:youthfoundationofindia/sections/donation_benefit.dart';
import 'package:youthfoundationofindia/sections/donation_section.dart';
import 'package:youthfoundationofindia/sections/features_section.dart';
import 'package:youthfoundationofindia/sections/footer_section.dart';
import 'package:youthfoundationofindia/sections/gallery_section.dart';
import 'package:youthfoundationofindia/sections/stop_addiction_section.dart';
import 'package:youthfoundationofindia/sections/strike_section.dart';
import 'package:youthfoundationofindia/sections/weight_loss_section.dart';
import 'package:youthfoundationofindia/utils/breakpoint.dart';
import 'package:youthfoundationofindia/utils/constants.dart';
import 'package:youthfoundationofindia/utils/provider.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';
import 'package:youthfoundationofindia/design_systems/typography/text_styles.dart';
import 'package:youthfoundationofindia/sections/add_businuss_section.dart';
import 'package:youthfoundationofindia/sections/job_apply_section.dart';
import 'package:youthfoundationofindia/sections/founder_video_section.dart';
import 'package:youthfoundationofindia/sections/main_section.dart';
import 'package:youthfoundationofindia/shared/navigation_bar.dart';

void main() {
  runApp(
    Provider(
      notifier: MainNotifier(), // Adding MainNotifier here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youth Foundation of India',
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/volunteerregister': (context) => const RegisterVountererPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const LandingPage());
          case '/register':
            return MaterialPageRoute(
                builder: (context) => const RegisterPage());
        }
        return null;
      },
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraint) {
          return BreakpointProvider(
            breakpoint: Breakpoint.get(constraint.maxWidth),
            child: child!,
          );
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600),
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary600,
            minimumSize: const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
            foregroundColor: AppColors.primary600,
          ),
        ),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _homeSectionKey = GlobalKey();
  final _founderVideoSectionKey = GlobalKey();
  final _servicesSectionKey = GlobalKey();
  final _productsSectionKey = GlobalKey();
  final _coursesSectionKey = GlobalKey();
  final _contactSectionKey = GlobalKey();
  final _helpSectionKey = GlobalKey();
  final _jobSectionKey = GlobalKey();
  final _addBusinessSectionKey = GlobalKey();
  final _gallerySectionKey = GlobalKey();
  final _donationSectionKey = GlobalKey();
  CreateNewUser createduser = CreateNewUser();

  @override
  void initState() {
    super.initState();
    createduser.loginUser();

    _scrollController.addListener(() {
      final notifier = Provider.of<MainNotifier>(context);
      notifier.onScrollOffsetChanged(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.06,
      );
    });
  }

  void _handleNavigation(String section) {
    switch (section) {
      case 'Home':
        _scrollToSection(_homeSectionKey);
        break;
      case 'Services':
        _scrollToSection(_servicesSectionKey);
        break;
      case 'Products':
        _scrollToSection(_productsSectionKey);
        break;
      case 'Courses':
        _scrollToSection(_coursesSectionKey);
        break;
      case 'Contact us':
        _scrollToSection(_contactSectionKey);
        break;
      case 'Help':
        _scrollToSection(_helpSectionKey);
        break;
      case 'Job Apply':
        _scrollToSection(_jobSectionKey);
        break;
      case 'Add Business':
        _scrollToSection(_addBusinessSectionKey);
        break;
      case 'Food donate':
        _scrollToSection(_donationSectionKey);
        break;
      case 'Old age donate':
      case 'Handicapped donate':
      case 'Blind Donate':
      case 'Goshala donate':
        _scrollToSection(_gallerySectionKey);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(Constants.kNavigationBarHeight + 32.0),
          child: NavBar(onNavigate: _handleNavigation),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              KeyedSubtree(
                key: _homeSectionKey,
                child: MainSection(
                  onWatchVideo: () => _scrollToSection(_founderVideoSectionKey),
                ),
              ),
              KeyedSubtree(
                key: _founderVideoSectionKey,
                child: const FounderVideoSection(),
              ),
              KeyedSubtree(
                  key: _coursesSectionKey, child: const CourseHeader()),
              KeyedSubtree(
                  key: _gallerySectionKey, child: const GallerySection()),
              const StrikeSection(),
              const StopTobaccoSection(),
              KeyedSubtree(
                  key: _productsSectionKey, child: const WeightLossProducts()),
              KeyedSubtree(
                  key: _servicesSectionKey, child: const FeaturesSection()),
              const StoriesSection(),
              const AchievementsSection(),
              KeyedSubtree(key: _jobSectionKey, child: const JobApplySection()),
              KeyedSubtree(
                  key: _addBusinessSectionKey,
                  child: const AddBusinussSection()),
              KeyedSubtree(
                  key: _helpSectionKey, child: const JobApplyPageSection()),
              const IntegrationsSection(),
              KeyedSubtree(
                  key: _donationSectionKey, child: const DonationSection()),
              const GetAppSection(),
              KeyedSubtree(
                  key: _contactSectionKey, child: const FooterSection()),
              Container(
                width: double.infinity,
                color: AppColors.neutral900,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "© 2025 Youth Foundation of India. All rights reserved. Terms & Conditions. Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
