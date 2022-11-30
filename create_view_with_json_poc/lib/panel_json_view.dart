import 'package:flutter/material.dart';

import 'get_it_config.dart';
import 'view_model.dart';

class PanelJsonView extends StatelessWidget {
  const PanelJsonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ViewModel viewModel = getIt.get<ViewModel>();

    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.white,
          child: TextField(
            expands: true,
            minLines: null,
            maxLines: null,
            controller: controller,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50),
          child: ElevatedButton(
            onPressed: () {
              viewModel.subject.add(controller.text);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 7, 64, 110),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
            ),
            child: const Text('Render'),
          ),
        ),
      ],
    );
  }
}
