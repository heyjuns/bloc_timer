import 'package:bloc_timer/timer/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (previous, current) =>
          previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...switch (state) {
              TimerInitial() => [
                  FloatingActionButton(
                    onPressed: () {
                      context
                          .read<TimerBloc>()
                          .add(TimerStarted(duration: state.duration));
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                ],
              TimerRunInProgress() => [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerBloc>().add(const TimerPaused());
                    },
                    child: const Icon(Icons.pause),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerBloc>().add(const TimerReset());
                    },
                    child: const Icon(Icons.replay),
                  ),
                ],
              TimerRunPause() => [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerBloc>().add(const TimerResumed());
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerBloc>().add(const TimerReset());
                    },
                    child: const Icon(Icons.replay),
                  ),
                ],
              TimerRunComplete() => [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<TimerBloc>().add(const TimerReset());
                    },
                    child: const Icon(Icons.replay),
                  ),
                ]
            }
          ],
        );
      },
    );
  }
}
