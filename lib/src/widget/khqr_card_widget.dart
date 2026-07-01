import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../enum/khqr_currency.dart';
import '../util/number_formatter_util.dart';

/// KhqrCardWidget is a widget that displays a KHQR card
class KhqrCardWidget extends StatefulWidget {
  /// Creates a [KhqrCardWidget]
  const KhqrCardWidget({
    super.key,
    this.qr = 'No Content',
    this.width,
    this.padding,
    required this.receiverName,
    this.amount = 0.0,
    this.currency,
    this.keepIntegerDecimal = false,
    this.showEmptyAmount = false,
    this.showCurrencySymbol = false,
    this.showCurrencyLabel = true,
    this.alwaysShowBakongIcon = true,
    this.isDark,
    this.showShadow = true,
    this.duration,
    this.regenerateButtonText,
    this.onRegenerate,
    this.isLoading = false,
    this.loadingWidget,
    this.isError = false,
    this.errorOverlay,
    this.onAmountTap,
  });

  /// The KHQR code default value is [No Content]
  final String qr;

  /// The width of the card.
  /// If null, defaults to 80% of the screen width via [MediaQuery] and
  /// updates automatically when the screen is resized.
  final double? width;

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

  /// Whether to show currency label
  final bool showCurrencyLabel;

  /// Whether to always show Bakong icon or dynamic change base on currency
  final bool alwaysShowBakongIcon;

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

  /// The widget to show when isError true
  final Widget? errorOverlay;

  /// The callback when tap on amount
  final Function()? onAmountTap;

  @override
  State<KhqrCardWidget> createState() => _KhqrCardWidgetState();
}

class _KhqrCardWidgetState extends State<KhqrCardWidget> {
  double get _aspectRatio => 20 / 29;
  double get _effectiveWidth =>
      widget.width ?? MediaQuery.sizeOf(context).width * 0.8;
  double get _height => _effectiveWidth / _aspectRatio;
  double get _receiverNameFontSize => _height * 0.03;
  double get _amountFontSize => _height * 0.065;
  double get _currencyFontSize => _height * 0.03;
  double get _headerHeight => _height * 0.12;
  EdgeInsets get _qrMargin => EdgeInsets.symmetric(
    horizontal: _height * 0.01,
    vertical: _height * 0.08,
  );

  late QrImage _qrImage;
  static const _bakongBraveryRed = Color(0xFFE1232E);
  static const _ravenDarkBlack = Color(0xFF000000);
  static const _pearlWhite = Color(0xFFFFFFFF);
  static const _backgroundDark = Color(0XFF1D1D1D);
  static const _buttonColor = Color(0xFF717171);
  static const _fontFamily = 'NunitoSans';
  static const _usdIcon = AssetImage(
    'assets/images/dollar_symbol.png',
    package: 'khqr_sdk',
  );
  static const _khrIcon = AssetImage(
    'assets/images/riel_symbol.png',
    package: 'khqr_sdk',
  );
  static const _bakongIcon = AssetImage(
    'assets/images/bakong_symbol.png',
    package: 'khqr_sdk',
  );
  static final _boxShadow = BoxShadow(
    color: const Color(0xFF000000).withValues(alpha: 0.1),
    blurRadius: 16,
    spreadRadius: 4,
    offset: const Offset(0, 0),
  );

  Duration? _duration;
  int _durationCount = 0;
  final _durationStream = StreamController<Duration>.broadcast();

  @override
  void initState() {
    super.initState();
    _qrImage = _buildQrImage();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _updateDuration();
    });
  }

  @override
  void didUpdateWidget(KhqrCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.qr != widget.qr) {
      _qrImage = _buildQrImage();
    }
  }

  QrImage _buildQrImage() {
    final qrCode = QrCode(10, QrErrorCorrectLevel.M)..addData(widget.qr);
    return QrImage(qrCode);
  }

  @override
  void dispose() {
    _durationStream.close();
    super.dispose();
  }

  Widget _buildQrView() {
    final decoration = PrettyQrDecoration(
      image: PrettyQrDecorationImage(
        scale: 0.18,
        position: PrettyQrDecorationImagePosition.foreground,
        image: widget.alwaysShowBakongIcon
            ? _bakongIcon
            : widget.currency == KhqrCurrency.khr
            ? _khrIcon
            : widget.currency == KhqrCurrency.usd
            ? _usdIcon
            : _bakongIcon,
      ),
      shape: const PrettyQrSquaresSymbol(),
      quietZone: const PrettyQrQuietZone.pixels(6.0),
      background: _pearlWhite,
    );

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
      child: PrettyQrView(qrImage: _qrImage, decoration: decoration),
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
          valueColor: const AlwaysStoppedAnimation<Color>(_pearlWhite),
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
                    const Icon(Icons.refresh_outlined, color: _pearlWhite),
                    const SizedBox(width: 4.0),
                    Text(
                      widget.regenerateButtonText ?? 'Regenerate',
                      style: const TextStyle(
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

    final amount = widget.amount > 0 || widget.showEmptyAmount
        ? NumberFormatterUtil.formatThousandNumber(
            widget.amount,
            alwaysShowDecimal: widget.keepIntegerDecimal,
          )
        : '';

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: _effectiveWidth,
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
                    colorFilter: const ColorFilter.mode(
                      _pearlWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: _effectiveWidth,
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
                            //* Amount Row
                            InkWell(
                              onTap: widget.onAmountTap,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: _height * 0.08,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 4.0,
                                  children: [
                                    //* Currency symbol
                                    if (widget.showCurrencySymbol &&
                                        widget.currency == KhqrCurrency.khr)
                                      SvgPicture.asset(
                                        'assets/svg/riel.svg',
                                        package: 'khqr_sdk',
                                        height: _amountFontSize * 0.75,
                                        colorFilter: ColorFilter.mode(
                                          qrTextColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    if (widget.showCurrencySymbol &&
                                        widget.currency == KhqrCurrency.usd)
                                      SvgPicture.asset(
                                        'assets/svg/dollar.svg',
                                        package: 'khqr_sdk',
                                        height: _amountFontSize * 0.86,
                                        colorFilter: ColorFilter.mode(
                                          qrTextColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    //* Amount
                                    Flexible(
                                      child: AutoSizeText(
                                        amount,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: _fontFamily,
                                          package: 'khqr_sdk',
                                          fontWeight: FontWeight.bold,
                                          fontSize: _amountFontSize,
                                          color: qrTextColor,
                                        ),
                                      ),
                                    ),
                                    //* Currency label
                                    if (widget.showCurrencyLabel &&
                                        widget.currency != null &&
                                        amount.isNotEmpty)
                                      Text(
                                        widget.currency!.name.toUpperCase(),
                                        style: TextStyle(
                                          fontFamily: _fontFamily,
                                          package: 'khqr_sdk',
                                          fontSize: _currencyFontSize,
                                          color: qrTextColor,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: _height * 0.04),
                            CustomPaint(
                              painter: _DashedLineHorizontalPainter(
                                aspectRatio: _aspectRatio,
                                color: isDark ? Colors.white : Colors.black,
                              ),
                              size: Size(_effectiveWidth, 1),
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
                                  if (widget.isError &&
                                      widget.errorOverlay != null)
                                    widget.errorOverlay!,
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
                                              shape: const CircleBorder(
                                                side: BorderSide(
                                                  width: 4.0,
                                                  color: _pearlWhite,
                                                  strokeAlign: 1.0,
                                                ),
                                              ),
                                              color: Theme.of(
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
                                                    _effectiveWidth *
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
        if (!mounted || _durationStream.isClosed) break;
        _duration = Duration(
          seconds: widget.duration!.inSeconds - _durationCount,
        );
        _durationStream.sink.add(_duration!);
        await Future.delayed(const Duration(seconds: 1));
        _durationCount += 1;
      }
    });
  }
}

class _DashedLineHorizontalPainter extends CustomPainter {
  _DashedLineHorizontalPainter({
    required this.aspectRatio,
    this.color = Colors.grey,
  });

  final double aspectRatio;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final double dashWidth = size.width * 0.03 * aspectRatio;
    final double dashSpace = size.width * 0.02 * aspectRatio;
    final paint = Paint();
    paint.color = color;
    paint.strokeWidth = 0.2;
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
    path.lineTo(width, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
