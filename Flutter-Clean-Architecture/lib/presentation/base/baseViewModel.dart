abstract class BaseViewModel extends BaseViewModelOutPut
    with BaseViewModelInput {
  //shared variable and function that will be used and view model
 
}

abstract class BaseViewModelInput {}

abstract class BaseViewModelOutPut {
  void start();
  void dispose();
}
