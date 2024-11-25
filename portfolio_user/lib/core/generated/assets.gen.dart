/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/404.svg
  String get a404 => 'assets/svg/404.svg';

  /// File path: assets/svg/error.svg
  String get error => 'assets/svg/error.svg';

  /// Directory path: assets/svg/icons
  $AssetsSvgIconsGen get icons => const $AssetsSvgIconsGen();

  /// List of all assets
  List<String> get values => [a404, error];
}

class $AssetsWebpGen {
  const $AssetsWebpGen();

  /// File path: assets/webp/avatar.webp
  AssetGenImage get avatar => const AssetGenImage('assets/webp/avatar.webp');

  /// File path: assets/webp/background_pattern.webp
  AssetGenImage get backgroundPattern => const AssetGenImage('assets/webp/background_pattern.webp');

  /// File path: assets/webp/logo.webp
  AssetGenImage get logo => const AssetGenImage('assets/webp/logo.webp');

  /// List of all assets
  List<AssetGenImage> get values => [avatar, backgroundPattern, logo];
}

class $AssetsSvgIconsGen {
  const $AssetsSvgIconsGen();

  /// File path: assets/svg/icons/contact_me_icon.svg
  String get contactMeIcon => 'assets/svg/icons/contact_me_icon.svg';

  /// File path: assets/svg/icons/experience_icon.svg
  String get experienceIcon => 'assets/svg/icons/experience_icon.svg';

  /// File path: assets/svg/icons/highlighted_projects_icon.svg
  String get highlightedProjectsIcon => 'assets/svg/icons/highlighted_projects_icon.svg';

  /// List of all assets
  List<String> get values => [contactMeIcon, experienceIcon, highlightedProjectsIcon];
}

class Assets {
  Assets._();

  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsWebpGen webp = $AssetsWebpGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
