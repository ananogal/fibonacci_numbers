Fibonacci := Object clone do (
	getNumberAtIndex := method(index, 
		for(i, 1, index, 
			if( i == 1, 
				1 , 
				if(i == 2, 1, (self getNumberAtIndex(i-1) + self getNumberAtIndex(i-2)))
			)
		)
	)

	getNumberAtIndexWithStart := method(index, start,
		for(i, start, index, 
			if( i == start, 
				start, 
				if(i == start+1, 1, (self getNumberAtIndexWithStart(i-1, start) + self getNumberAtIndexWithStart(i-2, start)))
			)
		)
	)
)

#Tests
Test := Object clone
Test assert.eql := method(actual, expected, if(actual == expected, "Green" println, "Red" println))


Test assert.eql(Fibonacci getNumberAtIndex(1), 1)
Test assert.eql(Fibonacci getNumberAtIndex(2), 1)
Test assert.eql(Fibonacci getNumberAtIndex(3), 2)
Test assert.eql(Fibonacci getNumberAtIndex(4), 3)
Test assert.eql(Fibonacci getNumberAtIndex(5), 5)


Test assert.eql(Fibonacci getNumberAtIndexWithStart(1, 1), 1)
Test assert.eql(Fibonacci getNumberAtIndexWithStart(0, 0), 0)
Test assert.eql(Fibonacci getNumberAtIndexWithStart(1, 0), 1)
Test assert.eql(Fibonacci getNumberAtIndexWithStart(2, 0), 1)
Test assert.eql(Fibonacci getNumberAtIndexWithStart(3, 0), 2)


