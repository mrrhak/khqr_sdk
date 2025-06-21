import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:khqr_sdk/src/common/enum.dart';
import 'package:khqr_sdk/src/util/number_formatter_util.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

/// KhqrCardWidget is a widget that displays a KHQR card
class KhqrCardWidget extends StatefulWidget {
  /// Creates a [KhqrCardWidget]
  const KhqrCardWidget({
    super.key,
    this.qr = 'No Content',
    this.width = 300,
    this.padding,
    required this.receiverName,
    this.amount = 0.0,
    this.currency,
    this.keepIntegerDecimal = false,
    this.showEmptyAmount = true,
    this.showCurrencySymbol = true,
    this.isDark,
    this.showShadow = true,
    this.duration,
    this.regenerateButtonText,
    this.onRegenerate,
    this.isLoading = false,
    this.loadingWidget,
    this.isError = false,
    this.retryButtonText,
    this.onRetry,
  });

  /// The KHQR code default value is [No Content]
  final String qr;

  /// The width of the card
  final double width;

  /// The padding of the QR code
  final EdgeInsets? padding;

  /// The name of the receiver
  final String receiverName;

  /// The amount of the transaction
  final double amount;

  /// The currency of the transaction
  final KhqrCurrency? currency;

  /// Whether to keep the integer decimal of the amount
  final bool keepIntegerDecimal;

  /// Whether to show the empty amount
  final bool showEmptyAmount;

  /// Whether to show currency symbol
  final bool showCurrencySymbol;

  /// Whether to use dark mode
  final bool? isDark;

  /// Whether to show shadow
  final bool showShadow;

  /// The duration of qr code expiration
  final Duration? duration;

  /// The text of regenerate button
  final String? regenerateButtonText;

  /// The callback when regenerate qr code
  final Function()? onRegenerate;

  /// Whether the card is loading
  /// If true, the loading widget will be shown
  final bool isLoading;

  /// The widget to show when loading
  final Widget? loadingWidget;

  /// Whether the card is in error state
  /// If true, the retry button will be shown
  final bool isError;

  /// The text of retry button
  final String? retryButtonText;

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
  double get _amountFontSize => _height * 0.056;
  double get _dualCurrencyFontSize => _height * 0.035;
  EdgeInsets get _qrMargin => EdgeInsets.symmetric(
    horizontal: _height * 0.065,
    vertical: _height * 0.06,
  );

  Duration? _duration;
  int _durationCount = 0;
  final _bakongBraveryRed = const Color.fromRGBO(225, 35, 46, 1);
  final _ravenDarkBlack = const Color.fromRGBO(0, 0, 0, 1);
  final _pearlWhite = const Color.fromRGBO(255, 255, 255, 1);
  final _backgroundDark = const Color(0XFF1D1D1D);
  final _buttonColor = const Color(0xFF717171);
  final _fontFamily = 'NunitoSans';
  final _durationStream = StreamController<Duration>.broadcast();

  final BoxShadow _boxShadow = BoxShadow(
    color: const Color(0xFF000000).withAlpha(10),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0, 0),
  );

  AssetImage get _usdIcon =>
      const AssetImage('assets/images/dollar_symbol.png', package: 'khqr_sdk');

  AssetImage get _khrIcon =>
      const AssetImage('assets/images/riel_symbol.png', package: 'khqr_sdk');

  AssetImage get _bakongIcon =>
      const AssetImage('assets/images/bakong_symbol.png', package: 'khqr_sdk');

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

  Widget _buildQrView() {
    final qrCode = QrCode(10, QrErrorCorrectLevel.M)..addData(widget.qr);
    final decoration = PrettyQrDecoration(
      image: PrettyQrDecorationImage(
        scale: 0.18,
        position: PrettyQrDecorationImagePosition.foreground,
        image:
            widget.currency == KhqrCurrency.khr
                ? _khrIcon
                : widget.currency == KhqrCurrency.usd
                ? _usdIcon
                : _bakongIcon,
      ),
      shape: const PrettyQrSmoothSymbol(roundFactor: 0.1),
      quietZone: const PrettyQrQuietZone.pixels(6.0),
      background: _pearlWhite,
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
      child: PrettyQrView(qrImage: QrImage(qrCode), decoration: decoration),
    );
  }

  Widget _buildLoadingOverly() {
    return Center(
      child: SizedBox(
        width: 34.0,
        height: 34.0,
        child: CircularProgressIndicator(
          strokeWidth: 3.0,
          backgroundColor: Theme.of(context).primaryColor,
          valueColor: AlwaysStoppedAnimation<Color>(_pearlWhite),
        ),
      ),
    );
  }

  Widget _buildErrorOverly() {
    return Center(
      child: IntrinsicWidth(
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40.0),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            color: _buttonColor,
            child: InkWell(
              onTap: widget.onRetry?.call,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.refresh_outlined, color: _pearlWhite),
                    SizedBox(width: 4.0),
                    Text(
                      widget.retryButtonText ?? 'Retry',
                      style: TextStyle(
                        color: _pearlWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpiredOverly() {
    return Center(
      child: IntrinsicWidth(
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40.0),
          clipBehavior: Clip.antiAlias,
          child: Ink(
            color: _buttonColor,
            child: InkWell(
              onTap: () async {
                await widget.onRegenerate?.call();
                _updateDuration();
              },
              child: Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 12.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.refresh_outlined, color: _pearlWhite),
                    SizedBox(width: 4.0),
                    Text(
                      widget.regenerateButtonText ?? 'Regenerate',
                      style: TextStyle(
                        color: _pearlWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        widget.isDark ?? Theme.of(context).brightness == Brightness.dark;
    final qrBackgroundColor = isDark ? _backgroundDark : _pearlWhite;
    final qrTextColor = isDark ? _pearlWhite : _ravenDarkBlack;

    final qrViewWidget = _buildQrView();

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
                  padding: EdgeInsets.symmetric(
                    vertical: _height * 0.12 * 0.34,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/khqr_logo.svg',
                    package: 'khqr_sdk',
                    colorFilter: ColorFilter.mode(_pearlWhite, BlendMode.srcIn),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: widget.width,
                    color: _bakongBraveryRed,
                    child: ClipPath(
                      clipper: _KhqrCardHeaderClipper(
                        aspectRatio: _aspectRatio,
                      ),
                      child: Container(
                        color: qrBackgroundColor,
                        child: Column(
                          children: [
                            SizedBox(height: _height * 0.05),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.symmetric(
                                horizontal: _height * 0.08,
                              ),
                              //* Receiver Name
                              child: AutoSizeText(
                                widget.receiverName,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: _fontFamily,
                                  package: 'khqr_sdk',
                                  fontSize: _receiverNameFontSize,
                                  color: qrTextColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: _height * 0.08,
                              ),
                              child:
                                  widget.currency == null
                                      ? Row(
                                        children: [
                                          AutoSizeText(
                                            'KHR / USD',
                                            style: TextStyle(
                                              fontFamily: _fontFamily,
                                              package: 'khqr_sdk',
                                              fontSize: _dualCurrencyFontSize,
                                              height: 1.9,
                                              color: qrTextColor,
                                            ),
                                          ),
                                        ],
                                      )
                                      :
                                      //* Amount
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //* Currency symbol
                                          widget.showCurrencySymbol
                                              ? widget.currency ==
                                                      KhqrCurrency.khr
                                                  ? SvgPicture.asset(
                                                    'assets/svg/riel.svg',
                                                    package: 'khqr_sdk',
                                                    height:
                                                        _amountFontSize * 0.75,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          qrTextColor,
                                                          BlendMode.srcIn,
                                                        ),
                                                  )
                                                  : SvgPicture.asset(
                                                    'assets/svg/dollar.svg',
                                                    package: 'khqr_sdk',
                                                    height:
                                                        _amountFontSize * 0.86,
                                                    colorFilter:
                                                        ColorFilter.mode(
                                                          qrTextColor,
                                                          BlendMode.srcIn,
                                                        ),
                                                  )
                                              : const SizedBox.shrink(),
                                          Visibility(
                                            visible: widget.showCurrencySymbol,
                                            child: const SizedBox(width: 4.0),
                                          ),
                                          //* Amount
                                          Expanded(
                                            child: AutoSizeText(
                                              widget.amount > 0 ||
                                                      widget.showEmptyAmount
                                                  ? NumberFormatterUtil.formatThousandNumber(
                                                    widget.amount,
                                                    alwaysShowDecimal:
                                                        widget
                                                            .keepIntegerDecimal,
                                                  )
                                                  : '',
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontFamily: _fontFamily,
                                                package: 'khqr_sdk',
                                                fontWeight: FontWeight.bold,
                                                fontSize: _amountFontSize,
                                                height: 1.2,
                                                color: qrTextColor,
                                              ),
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
                              child: Stack(
                                children: [
                                  StreamBuilder<Duration>(
                                    stream: _durationStream.stream,
                                    builder: (context, snapshot) {
                                      final isExpired =
                                          snapshot.data?.inSeconds == 0;
                                      return Opacity(
                                        opacity:
                                            (widget.isLoading ||
                                                    widget.isError ||
                                                    isExpired)
                                                ? 0.08
                                                : 1,
                                        child: Container(
                                          margin: _qrMargin,
                                          alignment: Alignment.center,
                                          child: qrViewWidget,
                                        ),
                                      );
                                    },
                                  ),

                                  //* Loading Widget
                                  if (widget.isLoading)
                                    widget.loadingWidget ??
                                        _buildLoadingOverly(),
                                  //* Error Widget
                                  if (widget.isError) _buildErrorOverly(),
                                  //* Expired Widget
                                  if (widget.duration != null)
                                    StreamBuilder<Duration>(
                                      stream: _durationStream.stream,
                                      builder: (context, snapshot) {
                                        if (snapshot.data?.inSeconds == 0) {
                                          return _buildExpiredOverly();
                                        }
                                        return Center(
                                          child: Container(
                                            width: 30.0,
                                            height: 30.0,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 1.0,
                                            ),
                                            alignment: Alignment.center,
                                            decoration: ShapeDecoration(
                                              shape: CircleBorder(
                                                side: BorderSide(
                                                  width: 4.0,
                                                  color: _pearlWhite,
                                                  strokeAlign: 1.0,
                                                ),
                                              ),
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).primaryColor,
                                            ),
                                            child: AutoSizeText(
                                              "${_duration?.inSeconds.toString().padLeft(2, '0')}",
                                              minFontSize: 8.0,
                                              style: TextStyle(
                                                color: _pearlWhite,
                                                fontFamily: _fontFamily,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    0.07 *
                                                    widget.width *
                                                    _aspectRatio,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                ],
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
        _duration = Duration(
          seconds: widget.duration!.inSeconds - _durationCount,
        );
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

    path.lineTo(width - (width * 0.12 * aspectRatio), 0);
    path.lineTo(width, height * 0.08 * aspectRatio);
    path.lineTo(height, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
