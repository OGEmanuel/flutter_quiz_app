import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';
// import 'package:quiz_app/styled_text.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

// class StartQuiz extends StatefulWidget {
//   const StartQuiz({super.key});

//   @override
//   State<StartQuiz> createState() {
//     return _StartQuizState();
//   }
// }

// class _StartQuizState extends State<StartQuiz> {
//   void startQuiz() {
//     setState(() {
//       //
//     });
//   }

//   @override
//   Widget build(context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(
//           'assets/images/quiz-logo.png',
//           width: 300,
//         ),
//         const SizedBox(
//           height: 50,
//         ),
//         const StyledText('Learn Flutter the fun way!'),
//         const SizedBox(
//           height: 50,
//         ),
//         ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.deepPurple,
//             shape: const ContinuousRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.zero),
//             ),
//           ),
//           child: const Text(
//             'Start Quiz',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
