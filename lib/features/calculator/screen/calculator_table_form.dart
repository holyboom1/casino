import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../../core_ui/theme/app_fonts.dart';
import '../bloc/calculator_table_cubit.dart';

class CalculatorTableForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorTableCubit, CalculatorTableState>(
      builder: (BuildContext context, CalculatorTableState state) {
        if (state.rouletteCalculator == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: <Widget>[
              SizedBox(height: 100.h),
              CustomPaint(
                painter: RouletteTablePainter(
                  lineColor: Colors.black,
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 40.h,
                  ),
                  height: 160.h,
                  width: 894.w,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                                cell: state.rouletteCalculator!
                                    .rulletteFieldBets[state.rouletteCalculator!.cellNumber(i, j)]!,
                                index: j,
                                crossIndex: i,
                              ),
                          ],
                        ),
                        if ((i + 1) % 3 == 0 && i != 11)
                          Container(
                            width: 900.w,
                            height: 12.h,
                            decoration: const BoxDecoration(
                              border: Border(
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
      },
    );
  }
}

class CellWidget extends StatelessWidget {
  final RouletteCellModel cell;
  final int index;
  final int crossIndex;

  const CellWidget({
    required this.cell,
    required this.index,
    required this.crossIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.h),
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
            width: crossIndex % 3 == 0 ? 2.0 : 0.0,
          ),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          cell.number.toString(),
          style: AppFonts.playfairDisplay.copyWith(
            color: cell.color,
            fontSize: 66.sp,
          ),
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
