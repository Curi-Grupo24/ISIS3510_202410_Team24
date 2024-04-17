import 'package:flutter/material.dart' hide Colors;
import '../../../../core/ui/colors_brand.dart';
import '../../../common_widgets/widgets.dart';
import 'modal_case.dart';

class ImagePickerModal extends StatelessWidget {
  const ImagePickerModal({
    required this.cameraMethod,
    required this.galleryMethod,
    super.key,
  });

  final VoidCallback cameraMethod;
  final VoidCallback galleryMethod;

  @override
  Widget build(BuildContext context) => ModalCase(
        'Actualizar foto de perfil',
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  '''¿De dónde quisieras agregar la imagen?''',
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: SunsetButton(
                      onPressed: cameraMethod,
                      text: 'Cámara',
                      //   style: TextStyle(color: Colors.sunset[50]),
                      // ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.sunset[50]!, width: 1),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(0),
                        ),
                        surfaceTintColor: MaterialStateProperty.all<Color>(
                          Colors.sunset[50]!,
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.sunset[50]!,
                        ),
                        overlayColor: MaterialStateProperty.all<Color>(
                          Colors.sunset[50]!,
                        ),
                        shadowColor: MaterialStateProperty.all<Color>(
                          Colors.sunset[50]!,
                        ),
                        // backgroundColor: MaterialStateProperty.all<Color>(
                        //   Colors.sunset[50]!,
                        // ),
                      ),
                      onPressed: galleryMethod,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            width: double.infinity,
                          ),
                          Text(
                            'Galería',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.sunset[50],
                              fontSize: 16,
                            ),
                          ),
                        ],

                        //   Text(
                        //     'Galeria',
                        //     style: TextStyle(color: Colors.sunset[50]),
                        //   ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        height: 240,
      );
}
