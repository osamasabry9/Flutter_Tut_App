abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutput {}

abstract class BaseViewModelInputs {
  void start();
  void dispose();
}

abstract class BaseViewModelOutput {}
