import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/screens/root_screen/tabs/projects/pages/project_first_page.dart';
import 'package:portfolio_admin/presentation/screens/root_screen/tabs/projects/pages/project_links.dart';
import 'package:portfolio_admin/presentation/screens/root_screen/tabs/projects/pages/project_photos.dart';
import 'package:portfolio_shared/data/models/exceptions/exception_abs.dart';
import 'package:portfolio_shared/data/models/project/project.dart';
import 'package:portfolio_shared/domain/remote_source/database/firebase/add_project.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({super.key});

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}
class _ProjectsTabState extends State<ProjectsTab> {
  Map<String, dynamic> formData = {};
  late int currentIndex;
  @override
  void initState() {
    currentIndex =0;
    super.initState();
  }



  nextPage() {
    if(currentIndex<3){
      setState(() {
        currentIndex++;
      });
    }
  }
  previousPage(){
    if(currentIndex>=0){
      setState(() {
        currentIndex--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final List<Widget> children =[
      ProjectsFirstPage(
        onComplete: (name, cover, description, shortDescription,order) {
          formData.addAll({
            "name": name,
            "cover": cover,
            "description": description,
            "short_description": shortDescription,
            "order" : order
          });
          nextPage();
        }, initialName: formData['name'],
        initialCover: formData['cover'],
        initialDescription: formData['description'],
        initialShortDescription: formData['short_description'],
        initialOrder: formData['order'],
        onBackPressed: previousPage,
      ),
      ProjectLinks(onComplete: (List<Map<String, String>> links) {
        if(links.length !=1 &&links.first.isNotEmpty){
          formData.addAll({'links':links});
        }
        nextPage();

      }, initialLinks: formData['links'],  onBackPressed: (){
        previousPage();
      },),
      ProjectPhotos(onComplete: (List<String> photos) async{
        if(photos.length!=1&&photos.first.isNotEmpty){
          formData.addAll({'photos':photos});
        }

        Project project = Project.fromMap(formData);
        await addProject(project).catchError((e,s){
          if(e is ExceptionImpl) {
           if(context.mounted) {
             ScaffoldMessenger.of(context)
              .showSnackBar( SnackBar(content: Text(e.message??'Something went wrong!')));
           }
          }
        });
       if(context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Success")));
            setState(() {
              formData.clear();
              currentIndex = 0;
            });
          }
        }, onBackPressed: previousPage, photos:formData['photos'] ,),
    ];
    return IndexedStack(
      index: currentIndex,
        sizing: StackFit.passthrough,
        children: children,
    );
  }
}





