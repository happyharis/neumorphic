import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neumorphism_web/timer/neu_digital_clock.dart';
import 'package:neumorphism_web/timer/neu_hamburger_button.dart';
import 'package:neumorphism_web/timer/neu_reset_button.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timeService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timeService,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).viewPadding.top),
              SizedBox(height: 20),
              TimerTitle(),
              SizedBox(height: 60),
              NeuDigitalClock(),
              SizedBox(height: 20),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 25),
              NeuResetButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerTitle extends StatelessWidget {
  const TimerTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'Timer',
          style: Theme.of(context).textTheme.headline1,
        ),
        Spacer(),
        NeuHamburgerButton()
      ],
    );
  }
}

class TimerService extends ChangeNotifier {
  Stopwatch _watch;
  Timer _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  TimerService() {
    _watch = Stopwatch();
  }

  void _onTick(Timer timer) {
    _currentDuration = _watch.elapsed;

    // notify all listening widgets
    notifyListeners();
  }

  void start() {
    if (_timer != null) return;

    _timer = Timer.periodic(Duration(seconds: 1), _onTick);
    _watch.start();

    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void reset() {
    stop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }
}
