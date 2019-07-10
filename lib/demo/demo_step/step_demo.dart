import 'package:flutter/material.dart';

class StepStudyDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StepStudyState();
  }
}

class StepStudyState extends State<StepStudyDemo> {
  int _currentStep = 0; //当前在第几步

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text("Step"),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: new Container(
          color: Colors.transparent,
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.black,
                    ),
                    child: new Stepper(
                        currentStep: _currentStep,
                        onStepTapped: (int value) {
                          setState(() {
                            _currentStep = value;
                          });
                        },
                        onStepContinue: () {
                          setState(() {
                            _currentStep < 2
                                ? _currentStep += 1
                                : _currentStep = 0;
                          });
                        },
                        onStepCancel: () {
                          setState(() {
                            _currentStep > 0
                                ? _currentStep -= 1
                                : _currentStep = 0;
                          });
                        },
                        steps: [
                          Step(
                            title: Text('Step'),
                            subtitle: Text('副标题'),
                            content: Text(
                                '内容：Magna exercitation duis non sint eu nostrud.'),
                            isActive: true,
                          ),
                          Step(
                            title: Text('Step'),
                            subtitle: Text('副标题'),
                            content: Text(
                                '内容：Magna exercitation duis non sint eu nostrud.'),
                            isActive: false,
                          ),
                          Step(
                            title: Text('Step'),
                            subtitle: Text('副标题'),
                            content: Text(
                                '内容：Magna exercitation duis non sint eu nostrud.'),
                            isActive: false,
                          ),
                        ]))
              ]),
        ));
  }
}
