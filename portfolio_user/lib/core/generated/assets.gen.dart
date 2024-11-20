/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsWebpGen {
  const $AssetsWebpGen();

  /// File path: assets/webp/avatar.webp
  AssetGenImage get avatar => const AssetGenImage('assets/webp/avatar.webp');

  /// File path: assets/webp/background_pattern.webp
  AssetGenImage get backgroundPattern => const AssetGenImage('assets/webp/background_pattern.webp');

  /// Directory path: assets/webp/icons
  $AssetsWebpIconsGen get icons => const $AssetsWebpIconsGen();

  /// File path: assets/webp/logo.webp
  AssetGenImage get logo => const AssetGenImage('assets/webp/logo.webp');

  /// List of all assets
  List<AssetGenImage> get values => [avatar, backgroundPattern, logo];
}

class $AssetsWebpIconsGen {
  const $AssetsWebpIconsGen();

  /// File path: assets/webp/icons/contact_me_icon.webp
  AssetGenImage get contactMeIcon => const AssetGenImage('assets/webp/icons/contact_me_icon.webp');

  /// File path: assets/webp/icons/experience_icon.webp
  AssetGenImage get experienceIcon => const AssetGenImage('assets/webp/icons/experience_icon.webp');

  /// File path: assets/webp/icons/projects_icon.webp
  AssetGenImage get projectsIcon => const AssetGenImage('assets/webp/icons/projects_icon.webp');

  /// List of all assets
  List<AssetGenImage> get values => [contactMeIcon, experienceIcon, projectsIcon];
}

class Assets {
  Assets._();

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
