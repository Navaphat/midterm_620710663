class PigCalculator {
  var _length;
  var _girth;
  PigCalculator(var length, var girth) {
    this._length = length*0.01;
    this._girth = girth*0.01;
  }

  double cal() {
    return _girth*_girth*_length*69.3;
  }

  double calPlus() {
    return ((cal()*3)/100) + cal();
  }

  double calMinus() {
    return cal() - ((cal()*3)/100);
  }

  double plusPrice() {
    return calPlus()*112.50;
  }

  double minusPrice() {
    return calMinus()*112.50;
  }
}