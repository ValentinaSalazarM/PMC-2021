import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExchangeProgress extends StatelessWidget {
  const ExchangeProgress({
    Key? key,
    this.width = 320,
    this.height = 30,
  }) : super(key: key);
  final double width;
  final double height;

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
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Publicado"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Contraoferta aceptada"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "Esperando confirmación"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
              startChild: ExchangeProgressText(text: "En progreso"),
            ),
            TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.end,
              isLast: true,
              indicatorStyle: IndicatorStyle(
                height: 10,
                color: Color(0xFF1F3A83),
                padding: const EdgeInsets.all(5),
              ),
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
