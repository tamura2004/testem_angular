# test angular controller by testem.

describe 'YourCtrl', ->
	scope = null
	names = null

	beforeEach ->
		module 'YourApp'
		inject ($rootScope, $controller) ->
			scope = $rootScope.$new()
			ctrl = $controller 'YourCtrl',$scope: scope
		names = scope.names
	
	describe '#inc', ->
		it 'should be inc num.', ->
			scope.inc.set(100)
			expect(scope.inc.get()).toBe 100
	

	describe '#names', ->
		it 'should be 長さ3の配列', ->
			expect(names.length).toBe 3

describe 'MyCtrl', ->
	scope = null
	fizzbuzz = null
	calender = null

	beforeEach ->
		module 'MyApp'
		inject ($rootScope, $controller) ->
			scope = $rootScope.$new()
			ctrl = $controller 'MyCtrl',$scope: scope

		fizzbuzz = scope.fizzbuzz
		calender = scope.calender


	describe '#inc', ->
	
		it 'should be 3?', ->
			expect(scope.inc.get()).toBe 100


	describe '#calender', ->
	
		it 'should be array of 6 x 7', ->
			expect(calender.length).toBe 6
			expect(calender[0].length).toBe 7
	

	describe '#fizzbuzz', ->

		it '３の倍数で"fizz"を返す', ->
			expect(fizzbuzz(-6)).toBe "fizz"
			expect(fizzbuzz(-3)).toBe "fizz"
			expect(fizzbuzz(3)).toBe "fizz"
			expect(fizzbuzz(6)).toBe "fizz"
			expect(fizzbuzz(9)).toBe "fizz"
			expect(fizzbuzz(12)).toBe "fizz"

		it '５の倍数で"buzz"を返す', ->
			expect(fizzbuzz(-10)).toBe "buzz"
			expect(fizzbuzz(-5)).toBe "buzz"
			expect(fizzbuzz(5)).toBe "buzz"
			expect(fizzbuzz(10)).toBe "buzz"

		it '３と５の公倍数であれば"fizzbuzz"を返す', ->
			expect(fizzbuzz(-15)).toBe "fizzbuzz"
			expect(fizzbuzz(0)).toBe "fizzbuzz"
			expect(fizzbuzz(15)).toBe "fizzbuzz"
			expect(fizzbuzz(30)).toBe "fizzbuzz"
			expect(fizzbuzz(45)).toBe "fizzbuzz"
		
		it '３の倍数でも５の倍数でもなければ数字をnumber型で返す', ->
			expect(fizzbuzz(1)).toBe 1
			expect(fizzbuzz(2)).toBe 2
			expect(fizzbuzz(4)).toBe 4
			expect(fizzbuzz(7)).toBe 7
			expect(fizzbuzz(101)).toBe 101
			expect(fizzbuzz(-101)).toBe -101



	