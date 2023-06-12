import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../ticker.dart';
import '../timer.dart';

class TimerPage extends StatelessWidget {
  final int duration;
  const TimerPage({Key? key, required this.duration}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: TimerView(duration: duration),
    );
  }
}

class TimerView extends StatefulWidget {
  final int duration;
  const TimerView({Key? key, required this.duration}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  late ValueNotifier<double> valueNotifier;
  late int timerDuration;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(0.0);
    initTimer(widget.duration);
  }

  void initTimer(int _duration) {
    setState(() {
      timerDuration = _duration;
      context.read<TimerBloc>().setDuration(_duration);
      context.read<TimerBloc>().add(TimerStarted(duration: _duration));
      valueNotifier = ValueNotifier(100.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SimpleCircularProgressBar(
          size: 100,
          progressColors: [Colors.orange, Colors.red],
          progressStrokeWidth: 20,
          backStrokeWidth: 10,
          valueNotifier: valueNotifier,
          mergeMode: true,
          animationDuration: timerDuration,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 100.0),
          child: Center(child: TimerText()),
        ),
      ],
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final hoursStr =
        ((duration / 3600) % 24).floor().toString().padLeft(2, '0');
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      '$hoursStr:$minutesStr:$secondsStr',
      style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    child: const Icon(Icons.play_arrow),
                    onPressed: () {},
                  ),
                ],
              TimerRunInProgress() => [
                  FloatingActionButton(
                    child: const Icon(Icons.pause),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerPaused()),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerRunPause() => [
                  FloatingActionButton(
                    child: const Icon(Icons.play_arrow),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerResumed()),
                  ),
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ],
              TimerRunComplete() => [
                  FloatingActionButton(
                    child: const Icon(Icons.replay),
                    onPressed: () =>
                        context.read<TimerBloc>().add(const TimerReset()),
                  ),
                ]
            }
          ],
        );
      },
    );
  }
}
