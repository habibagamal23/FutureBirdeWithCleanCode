// input inclide any orders or action and sink becouse its have tha data
abstract class OnBoardinViewModelInPut {
  int getpreviseIndex();
  int getNextIndex();
  void onPageChanged(index);
// to include slider data
  Sink get inputSliderViewObject;
}
