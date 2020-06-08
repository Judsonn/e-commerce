import 'package:e_comerce/models/register_model.dart';
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

  RegisterModel register = RegisterModel();

  void SignUp() async {
  _stateController.add(SignUpBlocState(RegisterState.LOADING));

    await Future.delayed(Duration(seconds: 3));
  _stateController.add(SignUpBlocState(RegisterState.IDLE));
  }

  void setName(String name){
    register.name = name;
  }
  void setEmail(String email){
    register.email = email.toLowerCase();
  }
  void setPassword(String password){
    register.password = password;
  }

  void dispose() {
    _stateController.close();
    
  }
}
