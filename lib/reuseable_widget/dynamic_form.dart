// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class DynamicForm extends StatefulWidget {
//   final List<String> fieldNames;
//   final Function(Map<String, String>) onSubmit;
//   final Map<String, String>? initialValues; // ✅ NEW for edit mode

//   const DynamicForm({
//     super.key,
//     required this.fieldNames,
//     required this.onSubmit,
//     this.initialValues,
//   });

//   @override
//   State<DynamicForm> createState() => _DynamicFormState();
// }

// class _DynamicFormState extends State<DynamicForm> {
//   late List<TextEditingController> controllers;
//   late List<FocusNode> focusNodes;

//   @override
//   void initState() {
//     super.initState();
//     controllers =
//         List.generate(widget.fieldNames.length, (_) => TextEditingController());
//     focusNodes = List.generate(widget.fieldNames.length, (_) => FocusNode());
//   }

//   @override
//   void dispose() {
//     for (var c in controllers) c.dispose();
//     for (var f in focusNodes) f.dispose();
//     super.dispose();
//   }

//   void _handleKey(RawKeyEvent event, int index) {
//     if (event is RawKeyDownEvent) {
//       if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
//           index < focusNodes.length - 1) {
//         FocusScope.of(context).requestFocus(focusNodes[index + 1]);
//       } else if (event.logicalKey == LogicalKeyboardKey.arrowUp && index > 0) {
//         FocusScope.of(context).requestFocus(focusNodes[index - 1]);
//       }
//     }
//   }

//   void _submitForm() {
//     final values = <String, String>{};
//     for (int i = 0; i < widget.fieldNames.length; i++) {
//       values[widget.fieldNames[i]] = controllers[i].text;
//     }
//     widget.onSubmit(values);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ...List.generate(widget.fieldNames.length, (index) {
//             return RawKeyboardListener(
//               focusNode:
//                   FocusNode(), // ✅ RawKeyboardListener gets its own dummy node
//               onKey: (event) => _handleKey(event, index),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: TextField(
//                   controller: controllers[index],
//                   focusNode: focusNodes[index], // ✅ actual focus for typing
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     labelText: widget.fieldNames[index],
//                   ),
//                   textInputAction: index == widget.fieldNames.length - 1
//                       ? TextInputAction.done
//                       : TextInputAction.next,
//                   onSubmitted: (_) {
//                     if (index < focusNodes.length - 1) {
//                       FocusScope.of(context)
//                           .requestFocus(focusNodes[index + 1]);
//                     } else {
//                       _submitForm();
//                       Navigator.pop(context);
//                     }
//                   },
//                 ),
//               ),
//             );
//           }),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text("Cancel"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _submitForm();
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Save"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicForm extends StatefulWidget {
  final List<String>
      fieldNames; // list istamil ki ha taka names  order ma aaain
  final Function(Map<String, String>)
      onSubmit; //onSubmit aik callBack funtion hota ha jo parent widget ko data return karta ha jab subit ho ga
  final Map<String, String>?
      initialValues; //is ka map banai ha taka jab edit karan to pahla jo data saved tha show ho
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  DynamicForm({
    super.key,
    required this.fieldNames, //required ka matlab ha ka ya field zaruri ha
    required this.onSubmit,
    this.initialValues,
  });

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    //initsate sirf aik bari call hota ha agr is ko build ma rakhata to baar baar call hota haar widget ka lia
    super.initState();
    controllers = List.generate(widget.fieldNames.length, (index) {
      final fieldName = widget.fieldNames[
          index]; //geneerte list ka use ha ka jitni fields chaiya hon go utni banjain gi
      return TextEditingController(
        text: widget.initialValues != null &&
                widget.initialValues!.containsKey(
                    fieldName) //is ki edit funtionality ka lia bana ha tak data show so jab edit dialog open ho
            ? widget.initialValues![fieldName]
            : '',
      );
    });
    focusNodes = List.generate(widget.fieldNames.length,
        (_) => FocusNode()); //is ko textfield pa lana ka lia istamail hot ha
  }

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  void _handleKey(RawKeyEvent event, int index) {
    //is ma raykey event or index add kia taqa down up wagera kar saka or index konsa field par ha
    if (event is RawKeyDownEvent) {
      //jab chala ga jan down keyword preesed ho ga
      if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
          index < focusNodes.length - 1) {
        // logicalkey aik specific key hotaha to keyboard ka keys ka lia istamil hoti
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp && index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  bool _submitForm() {
    final values = <String, String>{};
    for (int i = 0; i < widget.fieldNames.length; i++) {
      final text = controllers[i].text.trim();
      // if (text.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(content: Text("${widget.fieldNames[i]} cannot be empty")),
      //   );
      //   return false;
      // }
      values[widget.fieldNames[i]] = text;
    }
    widget.onSubmit(values);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(widget.fieldNames.length, (index) {
            return RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) => _handleKey(event, index),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: widget.fieldNames[index],
                  ),
                  textInputAction: index == widget.fieldNames.length - 1
                      ? TextInputAction.done

                      ///ya use hota ha ka jab button dabaa to kia hona chaiya
                      : TextInputAction.next,
                  onSubmitted: (_) {
                    if (index < focusNodes.length - 1) {
                      FocusScope.of(context)
                          .requestFocus(focusNodes[index + 1]);
                    } else {
                      if (_submitForm()) Navigator.pop(context);
                    }
                  },
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_submitForm()) Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
