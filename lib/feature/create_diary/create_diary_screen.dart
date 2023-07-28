import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:flutter_application_1/feature/create_diary/bloc/create_diary_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';

class CreateDiaryScreen extends StatelessWidget {
  CreateDiaryScreen({super.key});

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateDiaryBloc>(),
      child: BlocBuilder<CreateDiaryBloc, CreateDiaryState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              backgroundColor: Colors.black87,
              leading: const Icon(Icons.close, color: Colors.white),
              title: const Text(
                'New Diary',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text('Add to site diary'),
                          Spacer(),
                          Icon(
                            CupertinoIcons.question_circle_fill,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Add Photos to site diary',
                              ),
                              const Divider(),
                              if (state.imgList.isNotEmpty)
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: state.imgList
                                      .map(
                                        (e) => Stack(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: FileImage(e),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<CreateDiaryBloc>()
                                                      .add(
                                                          CreateDiaryRemovePhoto(
                                                              photoFile: e));
                                                },
                                                child: const Icon(
                                                  CupertinoIcons
                                                      .xmark_circle_fill,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 154, 218, 58),
                                  ),
                                  onPressed: () async {
                                    final photoFileList =
                                        await ImagePicker().pickMultiImage();
                                    if (photoFileList.isNotEmpty &&
                                        context.mounted) {
                                      context.read<CreateDiaryBloc>().add(
                                            CreateDiaryAddPhoto(
                                              xFiles: photoFileList,
                                            ),
                                          );
                                    }
                                  },
                                  child: const Text('Add a photo'),
                                ),
                              ),
                              CheckboxListTile(
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                                title: const Text('include in photo gallery'),
                                value: state.isInclude,
                                onChanged: (boolean) {
                                  context.read<CreateDiaryBloc>().add(
                                        CreateDiarySetIncludePhotoGallery(
                                            isInclude: boolean!),
                                      );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 154, 218, 58),
                          ),
                          onPressed: state.uiState == UIState.loading
                              ? null
                              : () {
                                  context
                                      .read<CreateDiaryBloc>()
                                      .add(const CreateDiaryExecute());
                                },
                          child: state.uiState == UIState.loading
                              ? Transform.scale(
                                  scale: 0.5,
                                  child: const CircularProgressIndicator
                                      .adaptive())
                              : const Text('Next'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
