import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/widgets/my_text_field.dart';
import 'package:portfolio_shared/extensions/context_extension.dart';

class ProjectLinks extends StatefulWidget {
  const ProjectLinks(
      {super.key, required this.onComplete, required this.initialLinks, required this.onBackPressed});

  final Function(List<Map<String, String>> links) onComplete;
  final List<Map<String, String>>? initialLinks;
  final VoidCallback onBackPressed;

  @override
  State<ProjectLinks> createState() => _ProjectLinksState();
}

class _ProjectLinksState extends State<ProjectLinks> {
  final formKey = GlobalKey<FormState>();

  late List<Map<String, TextEditingController>> controllers;
  ScrollController controller = ScrollController();
initControllers(){
  if (widget.initialLinks == null) {
    controllers = [
      {
        'link': TextEditingController(),
        'icon': TextEditingController(),
        'tooltip': TextEditingController(),
      }
    ];
  } else {
    controllers= widget.initialLinks!.map(
          (e) => e.map(
            (key, value) => MapEntry(
          key,
          TextEditingController(text: value),
        ),
      ),
    ).toList();
  }
}
  @override
  void initState() {
  initControllers();
    super.initState();
  }

  onAdd() async {
    setState(() {
      controllers.add({
        'link': TextEditingController(),
        'icon': TextEditingController(),
        'tooltip': TextEditingController(),
      });
    });
    await Future.delayed(const Duration(milliseconds: 100));
    controller.animateTo(controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    for (var map in controllers) {
      for (TextEditingController? controller in (map.values)) {
        if (controller != null) controller.dispose();
      }
    }
    controller.dispose();
    super.dispose();
  }

  List<Map<String, String>> get result =>controllers.map((e)=>e.map((key,value)=>MapEntry(key, value.text))).toList();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: context.width / 4),
        child: Column(children: [
          for (var item in controllers)
           ...[

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text(
                     'Link ${controllers.indexOf(item)}:',
                     style: const TextStyle(
                         color: Colors.black,
                         fontSize: 24,
                         fontWeight: FontWeight.bold),
                   )),
             ),
             for (var key in item.keys) ...[
              const SizedBox(
                height: 12,
              ),

              if (key == 'add')
                const SizedBox.shrink()
              else
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextFormField(controller: item[key]!, hintText: key),
                ),
              const SizedBox(
                height: 12,
              )
            ],],
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: onAdd,
                child: const Row(
                  children: [
                    Icon(Icons.add_circle_outlined),
                    Text('Add new link'),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(onPressed: widget.onBackPressed, child: const Text('Back')),

                ElevatedButton(
                    onPressed: () {
                        widget.onComplete(result);

                    },
                    child: const Text('Next')),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
