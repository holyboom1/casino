part of 'input_field.dart';

class InputFieldBorder extends StatefulWidget {
  final FocusNode focusNode;
  final bool isDisabled;
  final bool isError;
  final Widget child;
  final bool isMultiLine;
  final bool hasBorder;
  final bool isTransparent;
  final Color? backgroundColor;

  const InputFieldBorder({
    required this.focusNode,
    required this.isDisabled,
    required this.isError,
    required this.child,
    required this.isMultiLine,
    this.hasBorder = true,
    this.isTransparent = true,
    this.backgroundColor,
  });

  @override
  State<InputFieldBorder> createState() => _InputFieldBorderState();
}

class _InputFieldBorderState extends State<InputFieldBorder> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_focusChangeListener);
  }

  void _focusChangeListener() {
    _changeState();
    setState(() {});
  }

  void _changeState() {
    final AppColors appColors = AppColors.ofGlobalContext();

    color = widget.backgroundColor != null
        ? widget.backgroundColor!
        : appColors.secondaryBg;

    if (widget.isDisabled) {
      borderColor = appColors.primaryBg;
    }
    if (widget.isError) {
      borderColor = appColors.errorRed;
    } else {
      if (widget.focusNode.hasFocus) {
        borderColor = appColors.primaryBg;
      } else {
        borderColor = appColors.primaryBg.withOpacity(0.2);
      }
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusChangeListener);
    super.dispose();
  }

  Color borderColor = AppColors.ofGlobalContext().primaryBg;
  Color color = AppColors.transparent;

  @override
  Widget build(BuildContext context) {
    _changeState();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.borderRadius12),
        border: Border.all(color: widget.hasBorder ? borderColor : Colors.transparent),
        color: color,
      ),
      child: widget.child,
    );
  }
}
