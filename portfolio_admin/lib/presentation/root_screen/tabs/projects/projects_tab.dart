import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_admin/presentation/state_manger/upload_cover_cubit/upload_cover_cubit.dart';

class ProjectsTab extends StatelessWidget {
  const ProjectsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadCoverCubit, UploadCoverState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              state.maybeWhen<Widget>(
                  imagePicked: (){
                    return Image.memory(UploadCoverCubit.get(context).bytes! );
                  },
                  orElse: ()=>const SizedBox()),

              state.maybeWhen(orElse: ()=>ElevatedButton(onPressed: UploadCoverCubit.get(context).pickCover, child: const Text('Pick Cover'),),
              imagePicked: ()=>ElevatedButton(onPressed: UploadCoverCubit.get(context).uploadCover, child: const Text('Upload Cover'),),
                uploadingImage: (d)=>CircularProgressIndicator(value: d,),
                uploaded: ()=> const Icon(Icons.check_circle,color: Colors.green,),
              )
            ],
          ),
        );
      },
    );
  }
}
