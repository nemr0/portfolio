import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/widgets/my_text_field.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';

class ProjectsFirstPage extends StatefulWidget {
  const ProjectsFirstPage({super.key, required this.onComplete, required this.initialName, required this.initialCover, required this.initialShortDescription, required this.initialDescription, required this.onBackPressed,required this.initialOrder});
  final String? initialName;
  final String? initialCover;
  final int? initialOrder;
  final String? initialShortDescription;
  final String? initialDescription;
  final VoidCallback onBackPressed;

  final void Function(String name, String cover, String description,
      String shortDescription,String order) onComplete;

  @override
  State<ProjectsFirstPage> createState() => _ProjectsFirstPageState();
}
class _ProjectsFirstPageState extends State<ProjectsFirstPage> {
  late final TextEditingController nameController;
  late final TextEditingController orderController;
  late final TextEditingController coverController;
  late final TextEditingController descriptionController;
  late final TextEditingController shortDescriptionController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName);
    orderController = TextEditingController(text: widget.initialOrder?.toString());
    coverController = TextEditingController(text: widget.initialCover);
    descriptionController = TextEditingController(text: widget.initialDescription);
    shortDescriptionController = TextEditingController(text: widget.initialShortDescription);
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
        child: Padding(
          padding:
          EdgeInsets.symmetric(vertical: 20, horizontal: context.width / 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MyTextFormField(
                  controller: nameController, hintText: 'Project Name'),
              const SizedBox(height: 50),
              MyTextFormField(
                  controller: coverController, hintText: 'Cover Link'),
              const SizedBox(height: 50),
              MyTextFormField(
                  controller: shortDescriptionController,
                  hintText: 'Short Description'),
              const SizedBox(height: 50),
              MyTextFormField(
                controller: orderController,
                hintText: 'Order',
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 50),
              MyTextFormField(
                controller: descriptionController,
                hintText: 'Description',
                minLines: 4,
                maxLines: 8,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: widget.onBackPressed, child: const Text('Back')),
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState?.validate() == true) {
                            widget.onComplete(
                              nameController.text,
                              coverController.text,
                              descriptionController.text,
                              shortDescriptionController.text,
                              orderController.text,
                            );
                          }
                        },
                        child: const Text('Next')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}