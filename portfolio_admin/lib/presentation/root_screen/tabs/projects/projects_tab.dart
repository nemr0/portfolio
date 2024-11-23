import 'package:flutter/material.dart';
class ProjectsTab extends StatefulWidget {
  const ProjectsTab({super.key});

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {
  late final PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [ProjectsFirstPage(onComplete: ( name,
           cover,
           description,
           shortDescription){
        return;
      },)],
    );
  }
}

class ProjectsFirstPage extends StatefulWidget {
  const ProjectsFirstPage({super.key, required this.onComplete});
  final void Function(
       String name,
       String cover,
        String description,
       String shortDescription) onComplete;
  @override
  State<ProjectsFirstPage> createState() => _ProjectsFirstPageState();
}

class _ProjectsFirstPageState extends State<ProjectsFirstPage> {
  late final TextEditingController nameController;
  late final TextEditingController coverController;
  late final TextEditingController descriptionController;
  late final TextEditingController shortDescriptionController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    coverController = TextEditingController();
    descriptionController = TextEditingController();
    shortDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    coverController.dispose();
    descriptionController.dispose();
    shortDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),
            MyTextFormField(
                controller: nameController, hintText: 'Project Name'),
            const SizedBox(height: 50),
            MyTextFormField(controller: coverController, hintText: 'Cover Link'),
            const SizedBox(height: 50),
            MyTextFormField(controller: shortDescriptionController, hintText: 'Short Description'),
            const SizedBox(height: 50),
            MyTextFormField(controller: descriptionController, hintText: 'Description',textInputAction: TextInputAction.done,),
            ElevatedButton(onPressed: (){
              if(formKey.currentState?.validate() == true){

                widget.onComplete( nameController.text,
                coverController.text,
                descriptionController.text,
                shortDescriptionController.text,);
              }
            }, child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    this.textInputAction,
    required this.hintText,
  });

  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
String? notEmptyValidator(String? value){
  if(value ==null || value.isEmpty) return 'Field can\'t be empty.';
  return null;
}