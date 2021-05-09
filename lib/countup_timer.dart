import 'package:carparking_project/main.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/services.dart';

class CountUpTimerPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => CountUpTimerPage(),
      ),
    );
  }

  var name;
  CountUpTimerPage({this.name});

  @override
  _State createState() => _State();
}

class _State extends State<CountUpTimerPage> {
  final _isHours = true;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  final _scrollController = ScrollController();

  int _counter = 0;
  int coin = 20;

  void _incrementCounter() {
    setState(() {
      _counter = _counter + coin;
    });
  }

  @override
  void initState() {
    super.initState();

    _stopWatchTimer.rawTime.listen((value) =>
        print('rawTime $value ${StopWatchTimer.getDisplayTime(value)}'));
    _stopWatchTimer.minuteTime.listen((value) => print('minuteTime $value'));
    _stopWatchTimer.secondTime.listen((value) => print('secondTime $value'));
    _stopWatchTimer.records.listen((value) => print('records $value'));
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('CountUp Sample'),
      // ),
      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          widget.name,
                          style: const TextStyle(
                              fontSize: 70,
                              fontFamily: 'Helvetica',
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: StreamBuilder<int>(
                      stream: _stopWatchTimer.rawTime,
                      initialData: _stopWatchTimer.rawTime.valueWrapper?.value,
                      builder: (context, snap) {
                        final value = snap.data!;
                        final displayTime = StopWatchTimer.getDisplayTime(value,
                            hours: _isHours);
                        return Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                displayTime,
                                style: const TextStyle(
                                    fontSize: 72,
                                    fontFamily: 'Helvetica',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  '$_counter',
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Image(
                                image: AssetImage('assets/images/coin.png'),
                                width: 50,
                              ),
                            ],
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Colors.yellow[600],
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.start);
                            },
                            child: const Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Colors.yellow[600],
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop);
                            },
                            child: const Text(
                              'Stop',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: RaisedButton(
                            padding: const EdgeInsets.all(4),
                            color: Colors.yellow[600],
                            shape: const StadiumBorder(),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.reset);
                            },
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: RaisedButton.icon(
                      onPressed: () {
                        setState(() {
                          _counter = _counter + coin;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      label: Text(
                        'Pay',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      icon: Icon(
                        Icons.payment,
                        color: Colors.black,
                      ),
                      textColor: Colors.black,
                      color: Colors.yellow[600],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    height: 40.0,
                    width: double.infinity,
                    child: RaisedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      label: Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                      icon: Icon(
                        Icons.backspace,
                        color: Colors.black,
                      ),
                      textColor: Colors.white,
                      color: Colors.white,
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 4),
                  //         child: RaisedButton(
                  //           padding: const EdgeInsets.all(4),
                  //           color: Colors.pinkAccent,
                  //           shape: const StadiumBorder(),
                  //           onPressed: () async {
                  //             _stopWatchTimer.setPresetHoursTime(1);
                  //           },
                  //           child: const Text(
                  //             'Set Hours',
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 4),
                  //         child: RaisedButton(
                  //           padding: const EdgeInsets.all(4),
                  //           color: Colors.pinkAccent,
                  //           shape: const StadiumBorder(),
                  //           onPressed: () async {
                  //             _stopWatchTimer.setPresetMinuteTime(59);
                  //           },
                  //           child: const Text(
                  //             'Set Minute',
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 4),
                  //         child: RaisedButton(
                  //           padding: const EdgeInsets.all(4),
                  //           color: Colors.pinkAccent,
                  //           shape: const StadiumBorder(),
                  //           onPressed: () async {
                  //             _stopWatchTimer.setPresetSecondTime(59);
                  //           },
                  //           child: const Text(
                  //             'Set Second',
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 4),
                  //   child: RaisedButton(
                  //     padding: const EdgeInsets.all(4),
                  //     color: Colors.pinkAccent,
                  //     shape: const StadiumBorder(),
                  //     onPressed: () async {
                  //       _stopWatchTimer.setPresetTime(mSec: 3599 * 1000);
                  //     },
                  //     child: const Text(
                  //       'Set PresetTime',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
