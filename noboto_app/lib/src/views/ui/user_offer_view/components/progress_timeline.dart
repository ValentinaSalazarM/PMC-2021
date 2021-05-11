import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExchangeProgress extends StatelessWidget {
  const ExchangeProgress({
    Key? key,
    this.width = 320,
    this.height = 30,
    this.state = 0,
  }) : super(key: key);
  final double width;
  final double height;
  final int state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 45, maxWidth: 330),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isFirst: true,
              indicatorStyle: getTimelineDotStyle(state - 0),
              startChild: ExchangeProgressText(text: "Publicado"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: getTimelineDotStyle(state - 1),
              startChild: ExchangeProgressText(text: "Contraoferta aceptada"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: getTimelineDotStyle(state - 2),
              startChild: ExchangeProgressText(text: "Esperando confirmación"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: getTimelineDotStyle(state - 3),
              startChild: ExchangeProgressText(text: "En progreso"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isLast: true,
              indicatorStyle: getTimelineDotStyle(state - 4),
              startChild: ExchangeProgressText(text: "Finalizado"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExchangeProgressText extends StatelessWidget {
  const ExchangeProgressText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 20,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 9),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

IndicatorStyle getTimelineDotStyle(int state) => IndicatorStyle(
      height: 10,
      color: state >= 0 ? Color(0xFF1F3A83) : Color(0xFFB6B7B7),
      padding: const EdgeInsets.all(5),
    );
