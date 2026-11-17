import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/island_letters.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // عدد الجزر المفتوحة (غيّره لـ 5 عشان تجرب حركة السهم)
  final int unlockedCount = 1;

  // الجزيرة اللي واقف عليها السهم
  int arrowIndex = 0;
  bool arrowVisible = true;

  // مركز كل جزيرة كنسبة من الشاشة (x, y). آخر واحدة هي الكنز.
  final List<Offset> centers = const [
    Offset(0.32, 0.29), // 1 الحروف
    Offset(0.75, 0.38), // 2 الحركات
    Offset(0.32, 0.48), // 3 حروف المد
    Offset(0.76, 0.58), // 4 الكلمات
    Offset(0.32, 0.69), // 5 الجمل والقواعد
    Offset(0.50, 0.86), // 6 الكنز
  ];

  final List<String> images = [
    AppImage.island1,
    AppImage.island2,
    AppImage.island3,
    AppImage.island4,
    AppImage.island5,
    AppImage.island6,
  ];

  void onIslandTap(int index, AppLocalizations l10n) {
    final isTreasure = index == images.length - 1;

    if (isTreasure) {
      setState(() => arrowVisible = false); // الكنز: السهم يختفي
    } else if (index >= unlockedCount) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.islandLocked)));
    } else {
      setState(() {
        arrowIndex = index; // السهم يروح للجزيرة
        arrowVisible = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => IslandLetters()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);

    final titles = [
      l10n.islandLetters,
      l10n.islandHarakat,
      l10n.islandMadd,
      l10n.islandWords,
      l10n.islandSentences,
      l10n.bigTreasure,
    ];

    final double islandSize = 150.w;
    final double arrowWidth = 35.w;
    final double arrowHeight = 100.h;

    // مركز الجزيرة بالبكسل
    double cx(int i) => centers[i].dx * size.width;
    double cy(int i) => centers[i].dy * size.height;

    return Scaffold(
      body: Stack(
        children: [
          // 1) الخلفية بتملا الشاشة
          Positioned.fill(
            child: Image.asset(AppImage.homebg, fit: BoxFit.fill),
          ),

          // 2) الجزر بالترتيب
          for (int i = 0; i < images.length; i++)
            Positioned(
              left: cx(i) - islandSize / 2,
              top: cy(i) - islandSize / 2,
              width: islandSize,
              height: islandSize,
              child: IslandItem(
                image: images[i],
                title: titles[i],
                isLocked: i != images.length - 1 && i >= unlockedCount,
                onTap: () => onIslandTap(i, l10n),
              ),
            ),

          // 3) السهم
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: cx(arrowIndex) - arrowWidth / 2,
            top: cy(arrowIndex) - islandSize / 2 - arrowHeight + 25.w,
            child: IgnorePointer(
              child: AnimatedOpacity(
                opacity: arrowVisible ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  AppImage.arrow,
                  width: arrowWidth,
                  height: arrowHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // 4) الشريط العلوي
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(child: TopBar(l10n: l10n)),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// الجزيرة: صورة + قفل + اسم على بانر
// -----------------------------------------------------------------------------
class IslandItem extends StatelessWidget {
  const IslandItem({
    super.key,
    required this.image,
    required this.title,
    required this.isLocked,
    required this.onTap,
  });

  final String image;
  final String title;
  final bool isLocked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // الصورة
          Positioned.fill(child: Image.asset(image, fit: BoxFit.contain)),

          // القفل (دايرة رمادي بإطار أبيض)
          if (isLocked)
            Align(
              alignment: const Alignment(0, -0.25),
              child: Container(
                width: 38.r,
                height: 38.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mediumGray,
                  border: Border.all(color: AppColors.white, width: 3),
                ),
                child: Icon(
                  Icons.lock_outline,
                  color: AppColors.white,
                  size: 20.r,
                ),
              ),
            ),

          // الاسم على بانر بيج
          Positioned(
            left: 8.w,
            right: 8.w,
            bottom: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.white52,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  maxLines: 1,
                  style: AppStyle.bold20DarkBlue3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// الشريط العلوي: صورة الطفل (شمال) + التحية + العملات والنجوم (يمين)
// -----------------------------------------------------------------------------
class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        textDirection: TextDirection.ltr, // نفس ترتيب Figma
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة الطفل
          CircleAvatar(
            radius: 30.r,
            backgroundColor: AppColors.white,
            child: CircleAvatar(
              radius: 26.r,
              backgroundColor: AppColors.accent,
              backgroundImage: AssetImage(AppImage.boyAppbar),
            ),
          ),
          SizedBox(width: 10.w),

          // التحية (ملزوقة في صورة الطفل)
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // شمال في RTL
                children: [
                  Text(
                    l10n.homeGreeting('عبدالله'), // TODO: اسم الطفل الحقيقي
                    style: AppStyle.bold20White,
                  ),
                  Text(l10n.homeSubtitle, style: AppStyle.medium14white),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // العملات والنجوم
          Column(
            children: [
              StatPill(
                icon: Image.asset(AppImage.iconCoin, width: 18.r),
                value: '100',
              ),
              SizedBox(height: 6.h),
              StatPill(
                icon: Icon(Icons.star, color: AppColors.accent, size: 18.r),
                value: '0',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// كبسولة العملات / النجوم: أيقونة + رقم + (+)
// -----------------------------------------------------------------------------
class StatPill extends StatelessWidget {
  const StatPill({super.key, required this.icon, required this.value});

  final Widget icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.darkBlue2,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.7)),
      ),
      child: Row(
        textDirection: TextDirection.ltr, // 🪙 100 +
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          SizedBox(width: 6.w),
          Text(value, style: AppStyle.medium14white),
          SizedBox(width: 6.w),
          Icon(Icons.add, color: AppColors.white, size: 16.r),
        ],
      ),
    );
  }
}
