import 'package:flutter/material.dart';
import 'package:mydocs/config/config.dart';

class FieldForm extends StatelessWidget {
  final String hint;
  const FieldForm({Key? Key, this.hint = ''}) : super(key: Key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF3F1F1),
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFC2BDBD), fontSize: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class MyInput extends StatefulWidget {
  final bool isGood;
  final String errorMessage;
  final String placeholder;
  final TextInputType? keyboardType;
  final Function? onchange;
  final TextEditingController? textEditingController;
  final IconData? icon;
  final bool enable;

  const MyInput({
    Key? key,
    this.errorMessage = '',
    required this.isGood,
    required this.enable,
    this.onchange,
    this.placeholder = '',
    this.keyboardType,
    this.textEditingController,
    this.icon,
  }) : super(key: key);

  @override
  _MyInputState createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: widget.isGood ? Colors.grey[200] : Config.colors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border:
            widget.isGood ? null : Border.all(color: Config.colors.dangerColor),
      ),
      child: Row(
        children: [
          Icon(widget.icon,
              color: widget.isGood
                  ? (widget.enable ? Colors.black : Colors.grey)
                  : Config.colors.dangerColor),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              enabled: widget.enable,
              controller: widget.textEditingController,
              keyboardType: widget.keyboardType,
              obscureText: widget.icon == Icons.lock_outline && isObscured,
              decoration: InputDecoration(
                hintText:
                    widget.isGood ? widget.placeholder : widget.errorMessage,
                hintStyle: TextStyle(
                    color: widget.isGood || !widget.enable
                        ? null
                        : Config.colors.dangerColor),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                widget.onchange!(value);
              },
            ),
          ),
          if (widget.icon == Icons.lock_outline)
            IconButton(
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              icon: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
