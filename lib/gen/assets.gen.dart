/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal

import 'package:flutter/widgets.dart';

class $AssetsAudioGen {
  const $AssetsAudioGen();

  /// File path: assets/audio/background.mp3
  String get background => 'assets/audio/background.mp3';

  /// File path: assets/audio/effect.mp3
  String get effect => 'assets/audio/effect.mp3';

  /// List of all assets
  List<String> get values => [background, effect];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesBackgroundGen get background =>
      const $AssetsImagesBackgroundGen();

  /// File path: assets/images/knight_idle.png
  AssetGenImage get knightIdle =>
      const AssetGenImage('assets/images/knight_idle.png');

  /// File path: assets/images/knight_run.png
  AssetGenImage get knightRun =>
      const AssetGenImage('assets/images/knight_run.png');

  /// File path: assets/images/unicorn_animation.png
  AssetGenImage get unicornAnimation =>
      const AssetGenImage('assets/images/unicorn_animation.png');

  /// File path: assets/images/warrior_animation.png
  AssetGenImage get warriorAnimation =>
      const AssetGenImage('assets/images/warrior_animation.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [knightIdle, knightRun, unicornAnimation, warriorAnimation];
}

class $AssetsLicensesGen {
  const $AssetsLicensesGen();

  $AssetsLicensesPoppinsGen get poppins => const $AssetsLicensesPoppinsGen();
}

class $AssetsImagesBackgroundGen {
  const $AssetsImagesBackgroundGen();

  /// File path: assets/images/background/Background DARKER.png
  AssetGenImage get backgroundDARKER =>
      const AssetGenImage('assets/images/background/Background DARKER.png');

  /// File path: assets/images/background/Background Reference.png
  AssetGenImage get backgroundReference =>
      const AssetGenImage('assets/images/background/Background Reference.png');

  /// File path: assets/images/background/Background_Big Stars_v01.png
  AssetGenImage get backgroundBigStarsV01 => const AssetGenImage(
      'assets/images/background/Background_Big Stars_v01.png');

  /// File path: assets/images/background/Background_Block Shapes_v01.png
  AssetGenImage get backgroundBlockShapesV01 => const AssetGenImage(
      'assets/images/background/Background_Block Shapes_v01.png');

  /// File path: assets/images/background/Background_Orbs_V01.png
  AssetGenImage get backgroundOrbsV01 =>
      const AssetGenImage('assets/images/background/Background_Orbs_V01.png');

  /// File path: assets/images/background/Background_Small Stars_v01.png
  AssetGenImage get backgroundSmallStarsV01 => const AssetGenImage(
      'assets/images/background/Background_Small Stars_v01.png');

  /// File path: assets/images/background/Background_Solid_v01.png
  AssetGenImage get backgroundSolidV01 =>
      const AssetGenImage('assets/images/background/Background_Solid_v01.png');

  /// File path: assets/images/background/Background_Squiggles_v01.png
  AssetGenImage get backgroundSquigglesV01 => const AssetGenImage(
      'assets/images/background/Background_Squiggles_v01.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        backgroundDARKER,
        backgroundReference,
        backgroundBigStarsV01,
        backgroundBlockShapesV01,
        backgroundOrbsV01,
        backgroundSmallStarsV01,
        backgroundSolidV01,
        backgroundSquigglesV01
      ];
}

class $AssetsLicensesPoppinsGen {
  const $AssetsLicensesPoppinsGen();

  /// File path: assets/licenses/poppins/OFL.txt
  String get ofl => 'assets/licenses/poppins/OFL.txt';

  /// List of all assets
  List<String> get values => [ofl];
}

class Assets {
  Assets._();

  static const $AssetsAudioGen audio = $AssetsAudioGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLicensesGen licenses = $AssetsLicensesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
