import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../theme/app_colors.dart';

class RouletteTable extends StatelessWidget {
  final Function(RouletteCellModel number) onPressed;
  final RouletteCalculator rouletteCalculator = appLocator<RouletteCalculator>();

  RouletteTable({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.h),
          CustomPaint(
            painter: RouletteTablePainter(
              lineColor: Colors.black,
              bgColor: AppColors.of(context).tableBg,
            ),
            child: GestureDetector(
              onTap: () => onPressed(rouletteCalculator.rulletteFieldBets[0]!),
              child: SizedBox(
                height: 130.h,
                width: 894.w,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '0',
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                        style: AppFonts.playfairDisplay.copyWith(
                          color: AppColors.of(context).textGray,
                          fontSize: 80.sp,
                        ),
                      ),
                    ),
                    ValueListenableBuilder<double>(
                      valueListenable: rouletteCalculator.rulletteFieldBets[0]!.bet,
                      builder: (BuildContext context, double value, Widget? child) {
                        return Text(
                          rouletteCalculator.rulletteFieldBets[0]!.bet.value == 0
                              ? ''
                              : '${value.toStringAsFixed(0)} / ${rouletteCalculator.maxBet.toStringAsFixed(0)}',
                          style: AppFonts.playfairDisplay.copyWith(
                            color: AppColors.of(context).textGray,
                            fontSize: 22.sp,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              Column(
                children: <Widget>[
                  for (int i = 0; i < 12; i++) ...<Widget>[
                    Row(
                      children: <Widget>[
                        for (int j = 0; j < 3; j++)
                          CellWidget(
                            cell: rouletteCalculator
                                .rulletteFieldBets[rouletteCalculator.cellNumber(i, j)]!,
                            index: j,
                            crossIndex: i,
                            onPressed: onPressed,
                          ),
                      ],
                    ),
                    if ((i + 1) % 4 == 0 && i != 11)
                      Container(
                        width: 900.w,
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColors.of(context).tableBg,
                          border: const Border(
                            left: BorderSide(width: 2.0),
                            right: BorderSide(width: 2.0),
                          ),
                        ),
                      )
                  ]
                ],
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}

class CellWidget extends StatelessWidget {
  final RouletteCellModel cell;
  final Function(RouletteCellModel number) onPressed;
  final int index;
  final int crossIndex;

  const CellWidget({
    required this.cell,
    required this.index,
    required this.crossIndex,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(cell),
      child: Container(
        width: 300.w,
        decoration: BoxDecoration(
          border: Border(
            bottom: const BorderSide(
              width: 2.0,
            ),
            left: const BorderSide(
              width: 2.0,
            ),
            right: BorderSide(
              width: index == 2 ? 2.0 : 0.0,
            ),
            top: BorderSide(
              width: crossIndex % 4 == 0 ? 2.0 : 0.0,
            ),
          ),
          color: AppColors.of(context).tableBg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.h),
            Text(
              cell.number.toString(),
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
              style: AppFonts.playfairDisplay.copyWith(
                color: cell.color,
                fontSize: 60.sp,
              ),
            ),
            cell.bet.value == 0
                ? SizedBox(height: 33.h)
                : ValueListenableBuilder<double>(
                    valueListenable: cell.bet,
                    builder: (BuildContext context, double value, Widget? child) {
                      return Text(
                        cell.bet.value == 0
                            ? ''
                            : '${value.toStringAsFixed(0)} / ${appLocator<RouletteCalculator>().maxBet.toStringAsFixed(0)}',
                        style: AppFonts.playfairDisplay.copyWith(
                          color: AppColors.of(context).textGray,
                          fontSize: 22.sp,
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

class RouletteTablePainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double lineWidth;

  RouletteTablePainter({
    this.bgColor = Colors.yellow,
    this.lineColor = Colors.red,
    this.lineWidth = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    Paint bgPaint = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, size.height / 3);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, bgPaint);
    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
