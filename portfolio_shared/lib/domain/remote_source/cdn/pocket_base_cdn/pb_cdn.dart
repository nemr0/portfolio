import 'package:portfolio_shared/domain/remote_source/cdn/cdn_abs.dart';

class PocketBaseCDN extends CDN{
  @override
  Future<List<String>?> getAllImages() {
    // TODO: implement getAllImages
    throw UnimplementedError();
  }

  @override
  Future<int> getPhotoCountForProject(String projectName) {
    // TODO: implement getPhotoCountForProject
    throw UnimplementedError();
  }

  @override
  String getPhotoUrl(String path) {
    // TODO: implement getPhotoUrl
    throw UnimplementedError();
  }
}