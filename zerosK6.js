function countZeros(n) {
  var zero = 0;
  var i = 1;
  var j = Math.pow(10,i);
  while (n > j) {
    zero = zero + Math.floor(n/j);
    i++;
    j = Math.pow(10,i);
  }
  return zero;
}

//1 to 999   189
//1000 to 1999   400
