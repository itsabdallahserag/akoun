import 'package:akoun/core/app_colors.dart';
import 'package:akoun/core/app_image.dart';
import 'package:akoun/core/app_style.dart';
import 'package:akoun/feature/ui/widgets/lesson_widgets.dart';
import 'package:akoun/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  // الحروف المعروضة في العمود الأيسر
  final List<String> letters = const ['ب', 'ت', 'أ'];

  // الصور المعروضة في العمود الأيمن: 0 = تفاحة (ت), 1 = بيت (ب), 2 = أرنب (أ)
  final List<_TargetItem> targets = const [
    _TargetItem(id: 'ت', imagePath: AppImage.apple),
    _TargetItem(id: 'ب', imagePath: AppImage.home),
    _TargetItem(id: 'أ', imagePath: AppImage.rabbit),
  ];

  // خريطة التوصيلات الصحيحة المكتملة: فهرس الحرف -> فهرس الصورة
  final Map<int, int> _connections = {};

  int? _activeLetter; // الحرف الذي يتم سحبه أو تحديده حالياً
  Offset? _dragPosition; // إحداثيات السحب الحالية داخل الكارت

  bool get _isAllCompleted => _connections.length == letters.length;

  static const double _cardW = 74.0;
  static const double _cardH = 62.0;
  static const double _spacing = 20.0;
  static const double _padTop = 18.0;
  static const double _padH = 20.0;

  double get _totalHeight =>
      _padTop * 2 +
      (letters.length * _cardH) +
      ((letters.length - 1) * _spacing);

  int? _findLetterAt(Offset pos) {
    for (int i = 0; i < letters.length; i++) {
      if (_connections.containsKey(i)) continue;
      final top = _padTop + i * (_cardH + _spacing);
      final rect = Rect.fromLTWH(
        _padH - 12,
        top - 12,
        _cardW + 24,
        _cardH + 24,
      );
      if (rect.contains(pos)) {
        return i;
      }
    }
    return null;
  }

  int? _findTargetAt(Offset pos, double containerWidth) {
    final left = containerWidth - _padH - _cardW;
    for (int j = 0; j < targets.length; j++) {
      final top = _padTop + j * (_cardH + _spacing);
      final rect = Rect.fromLTWH(left - 15, top - 15, _cardW + 30, _cardH + 30);
      if (rect.contains(pos)) {
        return j;
      }
    }
    return null;
  }

  void _onPanStart(DragStartDetails details, double containerWidth) {
    if (_isAllCompleted) return;
    final pos = details.localPosition;
    final letterIdx = _findLetterAt(pos);

    if (letterIdx != null) {
      setState(() {
        _activeLetter = letterIdx;
        _dragPosition = pos;
      });
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isAllCompleted || _activeLetter == null) return;
    setState(() {
      _dragPosition = details.localPosition;
    });
  }

  void _onPanEnd(DragEndDetails details, double containerWidth) {
    if (_isAllCompleted || _activeLetter == null) return;

    if (_dragPosition != null) {
      final targetIdx = _findTargetAt(_dragPosition!, containerWidth);
      if (targetIdx != null) {
        final letter = letters[_activeLetter!];
        final targetLetter = targets[targetIdx].id;

        if (letter == targetLetter) {
          // توصيل صحيح ومطابق
          _connections[_activeLetter!] = targetIdx;
        } else {
          // توصيل خاطئ: يلغي التوصيل فوراً ويبدأ من جديد
          _activeLetter = null;
          _dragPosition = null;
        }
      }
    }

    setState(() {
      _activeLetter = null;
      _dragPosition = null;
    });
  }

  void _onTapUp(TapUpDetails details, double containerWidth) {
    if (_isAllCompleted) return;
    final pos = details.localPosition;

    // فحص الضغط على حرف
    final letterIdx = _findLetterAt(pos);
    if (letterIdx != null) {
      setState(() {
        if (_activeLetter == letterIdx) {
          _activeLetter = null; // إلغاء التحديد
        } else {
          _activeLetter = letterIdx; // تحديد الحرف
        }
        _dragPosition = null;
      });
      return;
    }

    // فحص الضغط على صورة إذا كان هناك حرف محدد
    if (_activeLetter != null) {
      final targetIdx = _findTargetAt(pos, containerWidth);
      if (targetIdx != null) {
        final letter = letters[_activeLetter!];
        final targetLetter = targets[targetIdx].id;

        if (letter == targetLetter) {
          setState(() {
            _connections[_activeLetter!] = targetIdx;
            _activeLetter = null;
            _dragPosition = null;
          });
        } else {
          // توصيل خطأ: يلغي التوصيل فوراً
          setState(() {
            _activeLetter = null;
            _dragPosition = null;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return LessonScaffold(
      title: l10n.matching,
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
                  l10n.matchLetterWithImage,
                  style: AppStyle.semiBpld20Purble,
                ),
                SizedBox(height: 18.h),

                // بطاقة التوصيل البيضاء - تحتوي التوصيل والسحب بالكامل مثل تدريب كتابة الحرف
                LayoutBuilder(
                  builder: (context, constraints) {
                    final containerWidth = constraints.maxWidth;

                    return GestureDetector(
                      onPanStart: (d) => _onPanStart(d, containerWidth),
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: (d) => _onPanEnd(d, containerWidth),
                      onTapUp: (d) => _onTapUp(d, containerWidth),
                      child: Container(
                        width: containerWidth,
                        height: _totalHeight,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(24.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blue.withValues(alpha: 0.08),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // 1. رسم خطوط التوصيل بدقة داخل الكارت
                            CustomPaint(
                              size: Size(containerWidth, _totalHeight),
                              painter: _MatchingCanvasPainter(
                                connections: _connections,
                                activeLetter: _activeLetter,
                                dragPosition: _dragPosition,
                                containerWidth: containerWidth,
                                padH: _padH,
                                padTop: _padTop,
                                cardW: _cardW,
                                cardH: _cardH,
                                spacing: _spacing,
                              ),
                            ),

                            // 2. الكروت (الحروف على اليسار والصور على اليمين)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: _padH,
                                vertical: _padTop,
                              ),
                              child: Row(
                                textDirection: TextDirection.ltr,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // عمود الحروف (يسار)
                                  Column(
                                    children: [
                                      for (
                                        int i = 0;
                                        i < letters.length;
                                        i++
                                      ) ...[
                                        _LetterBoxWidget(
                                          letter: letters[i],
                                          width: _cardW,
                                          height: _cardH,
                                          isSelected: _activeLetter == i,
                                          isConnected: _connections.containsKey(
                                            i,
                                          ),
                                        ),
                                        if (i != letters.length - 1)
                                          const SizedBox(height: _spacing),
                                      ],
                                    ],
                                  ),

                                  // عمود الصور (يمين)
                                  Column(
                                    children: [
                                      for (
                                        int j = 0;
                                        j < targets.length;
                                        j++
                                      ) ...[
                                        _ImageBoxWidget(
                                          imagePath: targets[j].imagePath,
                                          width: _cardW,
                                          height: _cardH,
                                          isConnected: _connections
                                              .containsValue(j),
                                        ),
                                        if (j != targets.length - 1)
                                          const SizedBox(height: _spacing),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // حالة النجاح بعد اكتمال التوصيل: الشخصية السعيد + أحسنت أيها البطل + زر متابعة
          if (_isAllCompleted)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // اليمين: النص وزر المتابعة
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
                                  Navigator.maybePop(context);
                                },
                                child: Text(
                                  l10n.continueText,
                                  style: AppStyle.bold20White.copyWith(
                                    fontSize: 18.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    // اليسار: صورة الشخصية السعيد
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

class _TargetItem {
  const _TargetItem({required this.id, required this.imagePath});
  final String id;
  final String imagePath;
}

class _LetterBoxWidget extends StatelessWidget {
  const _LetterBoxWidget({
    required this.letter,
    required this.width,
    required this.height,
    required this.isSelected,
    required this.isConnected,
  });

  final String letter;
  final double width;
  final double height;
  final bool isSelected;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.lightBlue3 : AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isConnected
              ? AppColors.darkBlue4
              : (isSelected ? AppColors.blue : const Color(0xFFC7D7E8)),
          width: 1.5,
        ),
      ),
      child: Text(
        letter,
        style: TextStyle(
          fontSize: 32.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.darkBlue4,
        ),
      ),
    );
  }
}

class _ImageBoxWidget extends StatelessWidget {
  const _ImageBoxWidget({
    required this.imagePath,
    required this.width,
    required this.height,
    required this.isConnected,
  });

  final String imagePath;
  final double width;
  final double height;
  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isConnected ? AppColors.darkBlue4 : const Color(0xFFC7D7E8),
          width: 1.5,
        ),
      ),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}

/// يرسم الخطوط الواصلة ونقاط التوصيل بدقة وسلاسة تامة داخل الكارت
class _MatchingCanvasPainter extends CustomPainter {
  _MatchingCanvasPainter({
    required this.connections,
    required this.activeLetter,
    required this.dragPosition,
    required this.containerWidth,
    required this.padH,
    required this.padTop,
    required this.cardW,
    required this.cardH,
    required this.spacing,
  });

  final Map<int, int> connections;
  final int? activeLetter;
  final Offset? dragPosition;
  final double containerWidth;
  final double padH;
  final double padTop;
  final double cardW;
  final double cardH;
  final double spacing;

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF384656)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFF384656)
      ..style = PaintingStyle.fill;

    // نقطة بداية الخط من الحافة الداخلية لكارت الحرف (يمين كارت الحرف)
    final double startX = padH + cardW;
    // نقطة نهاية الخط عند الحافة الداخلية لكارت الصورة (يسار كارت الصورة)
    final double endX = containerWidth - padH - cardW;

    // 1. رسم الخطوط المكتملة الصحيحة
    connections.forEach((letterIdx, targetIdx) {
      final double startY =
          padTop + letterIdx * (cardH + spacing) + (cardH / 2);
      final double endY = padTop + targetIdx * (cardH + spacing) + (cardH / 2);

      final p1 = Offset(startX, startY);
      final p2 = Offset(endX, endY);

      canvas.drawLine(p1, p2, linePaint);
      canvas.drawCircle(p1, 4.0, dotPaint);
      canvas.drawCircle(p2, 4.0, dotPaint);
    });

    // 2. رسم خط السحب النشط حالياً تحت يد الطفل
    if (activeLetter != null && dragPosition != null) {
      final double startY =
          padTop + activeLetter! * (cardH + spacing) + (cardH / 2);
      final p1 = Offset(startX, startY);

      final activeLinePaint = Paint()
        ..color = AppColors.blue
        ..strokeWidth = 2.5
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      canvas.drawLine(p1, dragPosition!, activeLinePaint);
      canvas.drawCircle(p1, 4.0, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _MatchingCanvasPainter oldDelegate) => true;
}
