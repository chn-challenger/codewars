function arrayMadness(a,b) {
  console.log(a);
    console.log(b);
  var val_a = a.reduce((x,y)=>x+y*y,1);
  var val_b = b.reduce((x,y)=>x+y*y,1);
 return val_a > val_b;
}
