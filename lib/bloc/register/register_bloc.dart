import 'package:rxdart/rxdart.dart';

enum RegisterState { IDLE, LOADING, ERROR }

class SignUpBlocState {

  SignUpBlocState(this.state, {this.errorMessage});

  RegisterState state;
  String errorMessage;
}

class RegisterBloc {
  final BehaviorSubject<SignUpBlocState> _stateController =
      BehaviorSubject<SignUpBlocState>.seeded(SignUpBlocState(RegisterState.IDLE));

  Stream<SignUpBlocState> get outState => _stateController.stream; 

  void dispose() {
    _stateController.close();
  }
}
