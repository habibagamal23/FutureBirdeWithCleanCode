class Slider {
  final String title;
  final String subTitle;
  final String image;
  Slider(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  Slider sliderObject;
  int numOfSlider;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlider, this.currentIndex);
}
