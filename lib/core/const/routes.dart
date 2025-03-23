class Routes {
  static const root = '/';
  static const contactMe = 'contact-me';
  static const experience = 'experience';
  static const highlightedProjectsWithId = '$highlightedProjects/:$highlightedProjectsId';
  static const highlightedProjectsId = 'projectId';
  static const highlightedProjects = 'highlighted-projects';

  static String getProjectPath(String project) => '$highlightedProjects/$project';
}
