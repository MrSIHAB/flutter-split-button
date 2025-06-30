import 'package:flutter/material.dart';

class SplitButton<T> extends StatefulWidget {
  final Color? backgroundColor, foregroundColor;
  final VoidCallback? onPressed, onOpened, onCanceled;
  final Widget? leading, action;
  final Widget title;
  final Radius outerRadius, innerRadius, menuRadius;
  final bool enable;
  final double? elevation;
  final double width, spacing;
  final List<SplitButtonEntry<T>> popupList;
  final ValueChanged<T>? onChanged;
  final Offset offset;

  const SplitButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
    this.leading,
    this.action,
    this.outerRadius = const Radius.circular(30),
    this.innerRadius = const Radius.circular(7),
    this.menuRadius = const Radius.circular(20),
    this.elevation,
    this.enable = true,
    this.width = 200,
    this.spacing = 2,
    this.offset = const Offset(0, 0),
    this.onChanged,
    this.onOpened,
    this.onCanceled,
    required this.popupList,
    required this.title,
  });

  @override
  State<SplitButton<T>> createState() => _SplitButtonState<T>();
}

class SplitButtonEntry<T> {
  final T value;
  final Widget child;
  const SplitButtonEntry({required this.value, required this.child});
}

class _SplitButtonState<T> extends State<SplitButton<T>> {
  IconData icon = Icons.keyboard_arrow_down_rounded;
  void _onOpened() => setState(() => icon = Icons.keyboard_arrow_up_rounded);
  void _onClosed() => setState(() => icon = Icons.keyboard_arrow_down_rounded);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton.icon(
            onPressed: widget.onPressed ?? () {},
            icon: widget.leading,
            label: widget.title,
            style: ElevatedButton.styleFrom(
              elevation: widget.elevation,
              textStyle: TextStyle(overflow: TextOverflow.ellipsis),
              fixedSize: Size.fromWidth(widget.width - 55 - widget.spacing),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: widget.outerRadius,
                  right: widget.innerRadius,
                ),
              ),
              backgroundColor: widget.backgroundColor,
              foregroundColor: widget.foregroundColor,
            ),
          ),
          SizedBox(width: widget.spacing),
          PopupMenuButton<T>(
            icon: widget.action ?? Icon(icon),
            padding: EdgeInsets.zero,
            elevation: widget.elevation,
            enabled: widget.enable,
            position: PopupMenuPosition.under,
            color: Colors.transparent,
            iconColor: widget.foregroundColor,
            offset: widget.offset,
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.backgroundColor,
              foregroundColor: widget.foregroundColor,
              fixedSize: Size.fromWidth(55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  right: widget.outerRadius,
                  left: widget.innerRadius,
                ),
              ),
            ),
            itemBuilder: _popupItemBuilder,
            onOpened: () {
              if (widget.onOpened != null) {
                widget.onOpened!();
              }
              if (widget.action != null) {
                _onOpened();
              }
            },
            onCanceled: () {
              if (widget.onCanceled != null) {
                widget.onCanceled!();
              }
              if (widget.action != null) {
                _onClosed();
              }
            },
            onSelected: (value) {
              if (widget.onChanged != null) widget.onChanged!(value);
              _onClosed();
            },
          ),
        ],
      ),
    );
  }

  List<PopupMenuEntry<T>> _popupItemBuilder(BuildContext context) {
    return widget.popupList
        .map(
          (entry) => PopupMenuItem<T>(
            value: entry.value,
            padding: EdgeInsets.zero,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: widget.width,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.vertical(
                    top: entry == widget.popupList.first
                        ? widget.menuRadius
                        : Radius.zero,
                    bottom: entry == widget.popupList.last
                        ? widget.menuRadius
                        : Radius.zero,
                  ),
                ),
                child: entry.child,
              ),
            ),
          ),
        )
        .toList();
  }
}
