function arrayMadness(a,b) {
  console.log(a);
    console.log(b);
  var val_a = a.reduce((x,y)=>x+y*y,0);
  var val_b = b.reduce((x,y)=>x+y*y*y,0);
 return val_a > val_b;
}
