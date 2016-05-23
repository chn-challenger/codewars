function sumMul(n,m){
  if (m <= 0) return "INVALID";
  var i = n;
  var result = 0;
  while (i < m) {
    result = result + i;
    i = i + n;
  }
  return result;
}
