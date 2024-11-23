abstract class CDN{
  Future<List<String>?> getAllImages();
  Future<int> getPhotoCountForProject(String projectName);
  String getPhotoUrl(String path);
}