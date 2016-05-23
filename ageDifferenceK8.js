function differenceInAges(ages){
	var oldest = Math.max.apply(Math, ages);
	var youngest = Math.min.apply(Math, ages);
	var diff = oldest - youngest;
	return [youngest,oldest,diff];
}
