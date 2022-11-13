import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<String?> {
  final ImagePicker _picker = ImagePicker();
  ImagePickerCubit() : super('assets/images/onboarding/imagePlaceholder.jpeg');

  Future<void> pickImage(ImageSource source) async {
    XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage == null) {
      return;
    }
    emit(pickedImage.path);
  }
}
