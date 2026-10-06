import 'package:flutter/material.dart';

class MarqueeTextBar extends StatefulWidget {
  final String text;

  const MarqueeTextBar({
    super.key,
    this.text =
        'WELCOME TO YOUTH FOUNDATION OF INDIA — EMPOWERING YOUTH & COMMUNITY EVERY DAY .',
  });

  @override
  State<MarqueeTextBar> createState() => _MarqueeTextBarState();
}

class _MarqueeTextBarState extends State<MarqueeTextBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _textWidth = 0.0;
  double _containerWidth = 0.0;
  static const double _gap = 100.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayText = widget.text.toUpperCase();
    final textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ) ??
        const TextStyle(
            color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);

    return Container(
      color: Colors.grey.shade200,
      height: 32,
      child: ClipRect(
        child: LayoutBuilder(
          builder: (context, constraints) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              final textPainter = TextPainter(
                text: TextSpan(text: displayText, style: textStyle),
                textDirection: Directionality.of(context),
                maxLines: 1,
              )..layout();

              if (!mounted) return;
              if (_textWidth != textPainter.width ||
                  _containerWidth != constraints.maxWidth) {
                setState(() {
                  _textWidth = textPainter.width;
                  _containerWidth = constraints.maxWidth;
                });
              }
            });

            return Stack(
              children: [
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final animationDistance = _textWidth + _gap;
                      final offsetX = _textWidth == 0
                          ? 0.0
                          : -(_controller.value * animationDistance);

                      return OverflowBox(
                        alignment: Alignment.centerLeft,
                        minWidth: 0,
                        maxWidth: double.infinity,
                        child: Transform.translate(
                          offset: Offset(offsetX, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(displayText, style: textStyle, maxLines: 1),
                              const SizedBox(width: _gap),
                              Text(displayText, style: textStyle, maxLines: 1),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
