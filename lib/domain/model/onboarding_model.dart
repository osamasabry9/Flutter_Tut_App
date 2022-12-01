class SliderObject {
  String title;
  String suTitle;
  String image;

  SliderObject(
    this.title,
    this.suTitle,
    this.image,
  );
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numOfSlides,
    required this.currentIndex,
  });
}