void main() {
  var myList = [1, 2, 3];

  // functional programming

  // เมธอด forEach() คือ Higher-order function
  //myList.forEach((item) => print(item));

  // result จะเท่ากับ [11, 12, 13]
  var result = myList.map((item) {
    return "a";
  }).toList();
  print(result);
}

/*void myFunc(int num) {
  print(num);
}*/
