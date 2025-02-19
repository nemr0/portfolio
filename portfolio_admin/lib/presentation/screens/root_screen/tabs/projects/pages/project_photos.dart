
import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart' show ImageRenderMethodForWeb;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:portfolio_admin/presentation/widgets/my_text_field.dart' show MyTextFormField;
import 'package:portfolio_shared/domain/remote_source/cdn/cloud_flare/cloudflare_cdn.dart' show CloudflareCDN;
import 'package:portfolio_shared/extensions/context_extension.dart';


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
  List<String> get result=>controllers.map((e)=>path+e.text).toList();
  Map<int,String> photoUrlById = {};
  String path = '';
  @override
  void initState() {
    controllers = [TextEditingController(text: '1.webp')];
    photoUrlById[0]='$path${controllers.first.text}';
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
      EdgeInsets.symmetric(vertical: 20, horizontal: context.width / 4),
      child: Column(
        children: [
          MyTextFormField(onChanged: (value){
            setState(() {
              path = value;
            });
          }, hintText: "Path, exp: /booktime"),
          const SizedBox(height: 50,),
          for(int i =0;i<controllers.length;i++)
            ...[
              AnimatedSwitcher(duration: const Duration(milliseconds: 200),
                child: photoUrlById[i] ==null?const SizedBox():SizedBox(
                    height: 200,
                    child: CachedNetworkImage(
                      height: 200,
                      imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                      imageUrl:CloudflareCDN().getPhotoUrl(path+photoUrlById[i]!),key: ValueKey(photoUrlById[i]),
                      errorWidget: (_,__,___)=>Text("Image Not Found",style: TextStyle(color: Theme.of(context).colorScheme.error),),
                    )),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextFormField(
                onChanged: (a){
                  setState(() {
                    photoUrlById[i]=a;
                  });
                },
                  prefix: Text(path,style: const TextStyle(color: Colors.white70),),
                  controller: controllers[i], hintText: "Photo $i"),
            ),],

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      int index =controllers.length-1;
                      var controller = controllers[index];
                      controllers.removeAt(index);
                      controller.dispose();
                      photoUrlById.remove(index);
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.exposure_minus_1_outlined),
                      Text('Remove Last Link'),
                    ],
                  )),
            ),
          ), Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 300,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      controllers.add(TextEditingController(text: '${controllers.length+1}.webp'));
                      photoUrlById[controllers.length-1] = '${controllers.length+1}.webp';
                    });
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.plus_one_outlined),
                      Text('Add New Link'),
                    ],
                  )),
            ),
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
                        if (kDebugMode) {
                          print(e);
                          print(s);
                        }

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