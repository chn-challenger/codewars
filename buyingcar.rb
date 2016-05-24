def nbMonths(startPriceOld, startPriceNew, savingperMonth, percentLossByMonth)
	i = 0
	price_to_change = startPriceNew - startPriceOld
	saved_amount = 0
	while saved_amount <= price_to_change
		i += 1
		percentLossByMonth = i%2 == 0 ? percentLossByMonth + 0.5 : percentLossByMonth
		saved_amount = savingperMonth*i
		price_to_change = price_to_change.to_f*(1- percentLossByMonth/100)
	end
	leftover_amount = (saved_amount.to_f - price_to_change.to_f).to_i
	return [i,leftover_amount]
end

puts nbMonths(6000, 39000, 2000, 1.5)
# puts nbMonths(6000, 39000, 2000, 1.5)
