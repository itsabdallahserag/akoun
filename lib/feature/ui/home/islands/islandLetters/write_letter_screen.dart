import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/home/islands/islandLetters/letter_positions_screen.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteLetterScreen extends StatefulWidget {
  const WriteLetterScreen({super.key});

  @override
  State<WriteLetterScreen> createState() => _WriteLetterScreenState();
}

class _WriteLetterScreenState extends State<WriteLetterScreen> {
  // النقاط المرجعية لرسم حرف الباء (نسبة مئوية من حجم الكارت)
  static const List<Offset> _letterDots = [
    Offset(0.80, 0.35),
    Offset(0.78, 0.45),
    Offset(0.74, 0.55),
    Offset(0.68, 0.63),
    Offset(0.60, 0.69),
    Offset(0.50, 0.71),
    Offset(0.40, 0.69),
    Offset(0.32, 0.63),
    Offset(0.26, 0.55),
    Offset(0.22, 0.45),
    Offset(0.20, 0.35),
  ];
  static const Offset _bottomDot = Offset(0.50, 0.85);

  final List<Offset> _drawnPoints = [];
  final Set<int> _hitDots = {};
  bool _hitBottomDot = false;
  bool _isSuccess = false;

  void _onPanStart(DragStartDetails details, Size cardSize) {
    if (_isSuccess) return;
    _drawnPoints.clear();
    _hitDots.clear();
    _hitBottomDot = false;
    _checkPoint(details.localPosition, cardSize);
  }

  void _onPanUpdate(DragUpdateDetails details, Size cardSize) {
    if (_isSuccess) return;
    final pos = details.localPosition;

    // التحقق هل النقطة خارج مسار الحرف
    final isNearAny = _isNearLetterPath(pos, cardSize);
    if (!isNearAny) {
      // شخبط برة أو مش على الحرف -> يلغي الشخبطة ويبدأ من جديد فوراً
      setState(() {
        _drawnPoints.clear();
        _hitDots.clear();
        _hitBottomDot = false;
      });
      return;
    }

    _checkPoint(pos, cardSize);
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isSuccess) return;
    // إذا لم يكمل كل النقاط يُلغى التتبع ليعيد الطفل المحاولة
    if (_hitDots.length < _letterDots.length || !_hitBottomDot) {
      setState(() {
        _drawnPoints.clear();
        _hitDots.clear();
        _hitBottomDot = false;
      });
    }
  }

  bool _isNearLetterPath(Offset pos, Size cardSize) {
    const double tolerance = 46.0;
    for (final dot in _letterDots) {
      final actualDot = Offset(dot.dx * cardSize.width, dot.dy * cardSize.height);
      if ((pos - actualDot).distance <= tolerance) {
        return true;
      }
    }
    final actualBottom = Offset(_bottomDot.dx * cardSize.width, _bottomDot.dy * cardSize.height);
    if ((pos - actualBottom).distance <= tolerance) {
      return true;
    }
    return false;
  }

  void _checkPoint(Offset pos, Size cardSize) {
    const double hitRadius = 32.0;

    for (int i = 0; i < _letterDots.length; i++) {
      final dotPos = Offset(_letterDots[i].dx * cardSize.width, _letterDots[i].dy * cardSize.height);
      if ((pos - dotPos).distance <= hitRadius) {
        _hitDots.add(i);
      }
    }

    final bottomPos = Offset(_bottomDot.dx * cardSize.width, _bottomDot.dy * cardSize.height);
    if ((pos - bottomPos).distance <= hitRadius) {
      _hitBottomDot = true;
    }

    setState(() {
      _drawnPoints.add(pos);
      if (_hitDots.length >= _letterDots.length && _hitBottomDot) {
        _isSuccess = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LessonScaffold(
      title: l10n.write,
      onClose: () => Navigator.pop(context),
      onBack: () => Navigator.maybePop(context),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 6.h),
                Text(
                  l10n.traceLetterWithDots,
                  style: AppStyle.semiBpld20Purble,
                ),
                SizedBox(height: 16.h),

                // بطاقة تتبع النقاط
                Center(
                  child: Container(
                    width: 270.w,
                    height: 270.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(24.r),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blue.withValues(alpha: 0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final cardSize = Size(constraints.maxWidth, constraints.maxHeight);
                        return GestureDetector(
                          onPanStart: (d) => _onPanStart(d, cardSize),
                          onPanUpdate: (d) => _onPanUpdate(d, cardSize),
                          onPanEnd: _onPanEnd,
                          child: CustomPaint(
                            size: cardSize,
                            painter: _LetterTracePainter(
                              letterDots: _letterDots,
                              bottomDot: _bottomDot,
                              drawnPoints: _drawnPoints,
                              isSuccess: _isSuccess,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // الحالة 1: قبل إتمام الكتابة
          if (!_isSuccess) ...[
            // نص أسفل الكارت على اليمين
            Positioned(
              bottom: 0.06.sh,
              right: 18.w,
              child: SizedBox(
                width: 170.w,
                child: Text(
                  '${l10n.traceDotsToWrite}\n${l10n.letterBehPositions}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkBlue4,
                    height: 1.3,
                  ),
                ),
              ),
            ),

            // فقاعة الاستفهام بجوار رأس الشخصية
            Positioned(
              bottom: 0.16.sh,
              left: 0.22.sw,
              child: Column(
                children: [
                  Icon(
                    Icons.help_outline_rounded,
                    color: AppColors.mediumGray.withValues(alpha: 0.55),
                    size: 24.r,
                  ),
                  SizedBox(height: 2.h),
                  Container(
                    width: 6.r,
                    height: 6.r,
                    decoration: BoxDecoration(
                      color: AppColors.mediumGray.withValues(alpha: 0.45),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            // صورة الشخصية المفكر
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                AppImage.guideThinking,
                height: 0.28.sh,
                fit: BoxFit.contain,
              ),
            ),
          ],

          // الحالة 2: نجاح الكتابة وتوصيل جميع النقاط
          if (_isSuccess)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // النص وزر المتابعة على اليمين
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${l10n.wellDone}\n${l10n.champion}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.darkBlue4,
                                height: 1.25,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            SizedBox(
                              width: 145.w,
                              height: 48.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.darkBlue4,
                                  foregroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.r),
                                  ),
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const LetterPositionsScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  l10n.continueText,
                                  style: AppStyle.bold20White.copyWith(fontSize: 18.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // صورة الشخصية السعيد على اليسار
                    Expanded(
                      flex: 5,
                      child: Image.asset(
                        AppImage.guideHappy,
                        height: 0.28.sh,
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _LetterTracePainter extends CustomPainter {
  _LetterTracePainter({
    required this.letterDots,
    required this.bottomDot,
    required this.drawnPoints,
    required this.isSuccess,
  });

  final List<Offset> letterDots;
  final Offset bottomDot;
  final List<Offset> drawnPoints;
  final bool isSuccess;

  @override
  void paint(Canvas canvas, Size size) {
    final dotPaint = Paint()
      ..color = const Color(0xFFD3D8E8)
      ..style = PaintingStyle.fill;

    for (final dot in letterDots) {
      canvas.drawCircle(Offset(dot.dx * size.width, dot.dy * size.height), 7.0, dotPaint);
    }
    canvas.drawCircle(Offset(bottomDot.dx * size.width, bottomDot.dy * size.height), 7.0, dotPaint);

    if (isSuccess) {
      final successLinePaint = Paint()
        ..color = const Color(0xFF5A6678)
        ..strokeWidth = 4.5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      final path = Path();
      for (int i = 0; i < letterDots.length; i++) {
        final p = Offset(letterDots[i].dx * size.width, letterDots[i].dy * size.height);
        if (i == 0) {
          path.moveTo(p.dx, p.dy);
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
      canvas.drawPath(path, successLinePaint);

      final successDotPaint = Paint()
        ..color = const Color(0xFF5A6678)
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(bottomDot.dx * size.width, bottomDot.dy * size.height),
        7.0,
        successDotPaint,
      );
    } else if (drawnPoints.isNotEmpty) {
      final tracePaint = Paint()
        ..color = const Color(0xFF5A6678)
        ..strokeWidth = 4.5
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      for (int i = 0; i < drawnPoints.length - 1; i++) {
        canvas.drawLine(drawnPoints[i], drawnPoints[i + 1], tracePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _LetterTracePainter oldDelegate) => true;
}
