import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khqr_sdk/src/common/enum.dart';
import 'package:khqr_sdk/src/util/money_formatter_util.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// KhqrCardWidget is a widget that displays a KHQR card
class KhqrCardWidget extends StatefulWidget {
  /// Creates a [KhqrCardWidget]
  const KhqrCardWidget({
    super.key,
    this.width = 300,
    this.padding,
    required this.receiverName,
    this.amount = 0.0,
    required this.currency,
    required this.qr,
    this.duration,
    this.showEmptyAmount = true,
    this.isDark,
    this.showShadow = true,
    this.onRetry,
  });

  /// The width of the card
  final double width;

  /// The padding of the QR code
  final EdgeInsets? padding;

  /// The name of the receiver
  final String receiverName;

  /// The amount of the transaction
  final double amount;

  /// The currency of the transaction
  final KhqrCurrency currency;

  /// The KHQR code
  final String qr;

  /// The duration of qr code expiration
  final Duration? duration;

  /// Whether to show the empty amount
  final bool showEmptyAmount;

  /// Whether to use dark mode
  final bool? isDark;

  /// Whether to show shadow
  final bool showShadow;

  /// The callback when retry
  final Function()? onRetry;

  @override
  State<KhqrCardWidget> createState() => _KhqrCardWidgetState();
}

class _KhqrCardWidgetState extends State<KhqrCardWidget> {
  double get _aspectRatio => 20 / 29;
  double get _height => widget.width / _aspectRatio;
  double get _headerHeight => _height * 0.12;
  double get _receiverNameFontSize => _height * 0.03;
  double get _amountFontSize => _height * 0.065;
  double get _currencyFontSize => _height * 0.03;
  EdgeInsets get _qrMargin => EdgeInsets.symmetric(
        horizontal: (_height * 0.1),
        vertical: (_height * 0.08),
      );

  Duration? _duration;
  int _durationCount = 0;
  final _bakongBraveryRed = const Color.fromRGBO(225, 35, 46, 1);
  final _ravenDarkBlack = const Color.fromRGBO(0, 0, 0, 1);
  final _pearlWhite = const Color.fromRGBO(255, 255, 255, 1);
  final _backgroundDark = Color(0xff1d1d1d);
  final _fontFamily = 'NunitoSans';
  final _durationStream = StreamController<Duration>.broadcast();

  final BoxShadow _boxShadow = BoxShadow(
    color: const Color(0xff000000).withAlpha(10),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0, 0),
  );

  Image get _usdSymbol => Image.asset(
        'assets/images/dollar_symbol.png',
        package: 'khqr_sdk',
      );

  Image get _khrSymbol => Image.asset(
        'assets/images/riel_symbol.png',
        package: 'khqr_sdk',
      );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateDuration();
    });
  }

  @override
  void dispose() {
    _durationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    Color qrBackgroundColor = isDark ? _backgroundDark : _pearlWhite;
    Color qrTextColor = isDark ? _pearlWhite : _ravenDarkBlack;

    if (widget.isDark != null) {
      if (widget.isDark!) {
        qrBackgroundColor = _backgroundDark;
        qrTextColor = _pearlWhite;
      } else {
        qrBackgroundColor = _pearlWhite;
        qrTextColor = _ravenDarkBlack;
      }
    }

    final qrImageView = Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: QrImageView(
            padding: widget.padding ?? EdgeInsets.zero,
            data: widget.qr,
            version: QrVersions.auto,
            errorCorrectionLevel: QrErrorCorrectLevel.H,
            backgroundColor: _pearlWhite,
          ),
        ),
        SizedBox(
          width: _height * 0.08,
          height: _height * 0.08,
          child: widget.currency == KhqrCurrency.khr ? _khrSymbol : _usdSymbol,
        ),
      ],
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: widget.width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_height * 0.045),
              boxShadow: widget.showShadow ? [_boxShadow] : null,
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                //* Header
                Container(
                  width: double.infinity,
                  height: _headerHeight,
                  color: _bakongBraveryRed,
                  padding:
                      EdgeInsets.symmetric(vertical: _height * 0.12 * 0.34),
                  child: SvgPicture.asset(
                    'assets/svg/khqr_logo.svg',
                    package: 'khqr_sdk',
                  ),
                ),
                Expanded(
                  child: Container(
                    width: widget.width,
                    color: _bakongBraveryRed,
                    child: ClipPath(
                      clipper:
                          _KhqrCardHeaderClipper(aspectRatio: _aspectRatio),
                      child: Container(
                        color: qrBackgroundColor,
                        child: Column(
                          children: [
                            SizedBox(height: _height * 0.05),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: _height * 0.1,
                              ),
                              //* Receiver Name
                              child: Text(
                                widget.receiverName,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: _fontFamily,
                                  package: 'khqr_sdk',
                                  fontSize: _receiverNameFontSize,
                                  color: qrTextColor,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: _height * 0.1,
                              ),
                              //* Amount
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  widget.amount > 0 || widget.showEmptyAmount
                                      ? Text(
                                          widget.currency == KhqrCurrency.khr
                                              ? MoneyFormatterUtil
                                                  .rielDisplayFormatter(
                                                  widget.amount,
                                                  showSymbol: false,
                                                ).toString()
                                              : MoneyFormatterUtil
                                                  .dollarDisplayFormatter(
                                                  widget.amount,
                                                  showSymbol: false,
                                                ).toString(),
                                          style: TextStyle(
                                            fontFamily: _fontFamily,
                                            package: 'khqr_sdk',
                                            fontWeight: FontWeight.bold,
                                            fontSize: _amountFontSize,
                                            color: qrTextColor,
                                          ),
                                        )
                                      : Text(''),
                                  if (widget.amount > 0 ||
                                      widget.showEmptyAmount)
                                    SizedBox(width: _height * 0.02),
                                  Text(
                                    widget.currency.name.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: _fontFamily,
                                      fontSize: _currencyFontSize,
                                      color: qrTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: _height * 0.04),
                            CustomPaint(
                              painter: _DashedLineHorizontalPainter(
                                aspectRatio: _aspectRatio,
                              ),
                              size: Size(widget.width, 1),
                            ),
                            //* QR Image
                            Expanded(
                              child: Container(
                                margin: _qrMargin,
                                alignment: Alignment.center,
                                child: StreamBuilder<Duration>(
                                  stream: _durationStream.stream,
                                  builder: (context, snapshot) {
                                    final data = snapshot.data;
                                    return data == null || data.inSeconds > 0
                                        ? qrImageView
                                        : MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                widget.onRetry?.call();
                                                _updateDuration();
                                              },
                                              child: const Icon(
                                                Icons.restart_alt,
                                                size: 50,
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
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (widget.duration != null)
            SizedBox(
              height: _height * 0.07 * _aspectRatio,
            ),
          if (widget.duration != null)
            StreamBuilder<Duration>(
              stream: _durationStream.stream,
              builder: (context, snapshot) {
                if (snapshot.data?.inSeconds == 0) {
                  return Text(
                    'QR was expired',
                    style: TextStyle(color: _bakongBraveryRed),
                  );
                }
                return Text(
                  "${_duration?.inMinutes.remainder(60).toString().padLeft(1, '0')}:${_duration?.inSeconds.remainder(60).toString().padLeft(2, '0')} | QR will be expired",
                  style: TextStyle(
                    fontFamily: _fontFamily,
                    color: Colors.white,
                    fontSize: 0.07 * widget.width * _aspectRatio,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  void _updateDuration() {
    if (widget.duration == null) return;
    _duration = widget.duration;
    _durationCount = 0;
    Future.microtask(() async {
      while (_duration!.inSeconds > 0) {
        _duration =
            Duration(seconds: widget.duration!.inSeconds - _durationCount);
        _durationStream.sink.add(_duration!);
        await Future.delayed(const Duration(seconds: 1));
        _durationCount += 1;
        if (!mounted) break;
      }
    });
  }
}

class _DashedLineHorizontalPainter extends CustomPainter {
  _DashedLineHorizontalPainter({required this.aspectRatio});

  final double aspectRatio;

  @override
  void paint(Canvas canvas, Size size) {
    final double dashWidth = size.width * 0.03 * aspectRatio;
    final double dashSpace = size.width * 0.02 * aspectRatio;
    final paint = Paint();
    paint.color = Colors.grey;
    paint.strokeWidth = 0.5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _KhqrCardHeaderClipper extends CustomClipper<Path> {
  _KhqrCardHeaderClipper({required this.aspectRatio});

  final double aspectRatio;

  @override
  Path getClip(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;

    path.lineTo(width - (width * 0.14 * aspectRatio), 0);
    path.lineTo(width, height * 0.11 * aspectRatio);
    path.lineTo(height, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
