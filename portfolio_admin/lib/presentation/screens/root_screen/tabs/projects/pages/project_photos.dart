
import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/widgets/my_text_field.dart';

class ProjectPhotos extends StatefulWidget {
  const ProjectPhotos({super.key, required this.onComplete, required this.onBackPressed, required this.photos});
  final Future<void> Function(List<String> photos) onComplete;
  final List<String>? photos;
  final VoidCallback onBackPressed;
  @override
  State<ProjectPhotos> createState() => _ProjectPhotosState();
}
class _ProjectPhotosState extends State<ProjectPhotos> {
  late List<TextEditingController> controllers;
   bool loading = false;
  List<String> get result=>controllers.map((e)=>e.text).toList();
  @override
  void initState() {
    controllers = [TextEditingController()];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for(int i =0;i<controllers.length;i++)
            MyTextFormField(controller: controllers[i], hintText: "Photo $i"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    controllers.add(TextEditingController());
                  });
                },
                child: const Row(
                  children: [
                    Icon(Icons.add_circle_outlined),
                    Text('Add new link'),
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(onPressed:loading?null: widget.onBackPressed, child: const Text('Back')),

              ElevatedButton(
                  onPressed: loading?null:() async {
                      setState(() {
                        loading = true;
                      });
                      await  widget.onComplete(result).catchError((e,s){
                        print(e);
                        print(s);
                      });
                      setState(() {
                        loading = false;
                      });
                  },
                  child:loading?const CircularProgressIndicator.adaptive(): const Text('Finish')),
            ],
          )

        ],
      ),
    );
  }
}