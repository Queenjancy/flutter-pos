import 'package:bloc/bloc.dart';

// We can extend `BlocDelegate` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("==============================================");
    print("CURRENT STATE: ${transition.currentState}");
    print("EVENT: ${transition.event}");
    print("NEXT STATE: ${transition.nextState}");
    print("==============================================\n\n");
  }
}
