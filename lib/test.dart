void main() {
  // nested list, 2-dimensional list
  var myList1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];
  print(myList1.length);

  var myList3 = [
    for (var subList in myList1)
      for (var i in subList)
        if (i % 2 == 0)
          i,
    for (var subList in myList1)
      for (var i in subList)
        if (i % 2 != 0)
          i,
  ];

  print(myList3.length);
  print(myList3);
}
