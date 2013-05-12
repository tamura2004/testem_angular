# test angular controller by testem.

describe 'underscore.js', ->

	alice = {name:"alice", age:17}
	bob =  {name:"bob", age:18}
	bob_dash =  {name:"bob", age:18}
	chris = {name:"chris", age:18}

	describe '_', ->
		it '_ が関数として定義されている', ->
			expect(typeof _).toBe "function"

	describe '#map', ->
		it '配列を長さを変えずに変換する', ->
			expect(_.map [1,2,3], (e) -> e*2).toEqual [2,4,6]

	describe '#find', ->
		it '条件に合致するものを１件選択する', ->
			expect(_.find [2,5,8,42,12], (e) -> e > 5).toBe 8
			expect(_.find [alice,bob,chris], (e) -> e.age is 17).toBe alice

	describe '#filter', ->
		it '条件に合致するものをすべて選択する', ->
			expect(_.filter [2,5,8,42,12], (e) -> e > 5).toEqual [8,42,12]
			expect(_.filter [alice,bob,chris], (e) -> e.age is 18).toEqual [bob,chris]

	describe '#contains', ->
		it '条件に合致するものの有無を調べる', ->
			expect(_.contains [2,5,8,42,12], 5).toBe true
			expect(_.contains [2,5,8,42,12], 7).toBe false
			expect(_.contains [alice,bob,chris], bob).toBe true
			expect(_.contains [alice,bob,chris], bob_dash).toBe false

	describe '#groupBy', ->
		it '条件によりグループ分けする', ->
			expect(_.groupBy [alice,bob,chris], (e) -> e.age).toEqual {"17":[alice],"18":[bob,chris]}
	
	describe '#countBy', ->
		it '条件により集計する', ->
			expect(_.countBy [alice,bob,chris], (e) -> e.age).toEqual {"17":1,"18":2}

	describe '#sortBy', ->
		it '条件により並べ替える', ->
			expect(_.sortBy [chris,alice,bob],"name").toEqual [alice,bob,chris]
	
	describe '#union', ->
		it '和集合を作成する', ->
			expect(_.union [1,3,5], [3,5,7]).toEqual [1,3,5,7]
			expect(_.union [alice,bob],[bob,chris]).toEqual [alice,bob,chris]
			expect(_.union [alice,bob_dash],[bob,chris]).not.toEqual [alice,bob,chris]

			# === で比較しているため、bob === bob_dashは成立しない
	
	describe '#intersection', ->
		it '共通集合を作成する', ->
			expect(_.intersection [1,3,5],[3,5,7]).toEqual [3,5]
			expect(_.intersection [alice,bob],[bob,chris]).toEqual [bob]
			expect(_.intersection [alice,bob_dash],[bob,chris]).toEqual []

	describe '#difference', ->
		it '差集合を作成する', ->
			expect(_.difference [1,2,3],[2,3]).toEqual [1]
			expect(_.difference [alice,bob,chris],[bob,chris]).toEqual [alice]

	describe '#uniq', ->
		it 'ユニークなものだけ集める', ->
			expect(_.uniq [1,1,2,1,2,2,3,3,2,3,2,2]).toEqual [1,2,3]
			expect(_.uniq [alice,bob,alice,chris,bob,chris]).toEqual [alice,bob,chris]

	describe '#keys', ->
		it 'オブジェクトのキーを求める', ->
			expect(_.keys bob).toEqual ["name","age"]
	
	describe '#values', ->
		it 'オブジェクトの値を求める', ->
			expect(_.values bob).toEqual ["bob",18]

	describe '#invert', ->
		it 'keyとvalueを逆にする', ->
			expect(_.invert bob).toEqual {"bob":"name", "18":"age"}

	describe '#has', ->
		it 'キーの有無を調べる', ->
			expect(_.has bob, "name").toBe true

	describe '#isEmpty', ->
		it '要素が空かどうか調べる', ->
			expect(_.isEmpty []).toBe true
			expect(_.isEmpty {}).toBe true
			expect(_.isEmpty [1]).toBe false
			expect(_.isEmpty {a:1}).toBe false
	
	describe '#isString', ->
		it '文字列かどうか調べる', ->
			expect(_.isString "").toBe true
			expect(_.isString "hoge").toBe true
			expect(_.isString 0).toBe false
			expect(_.isString {}).toBe false

	describe '#isNull', ->
		it 'nullかどうか調べる', ->
			expect(_.isNull null).toBe true
			expect(_.isNull false).toBe false
			expect(_.isNull "").toBe false
			expect(_.isNull {}).toBe false

	describe '#isNumber', ->
		it '数字かどうか調べる', ->
			expect(_.isNumber 1).toBe true
			expect(_.isNumber -10000).toBe true
			expect(_.isNumber 0.9999).toBe true
			expect(_.isNumber NaN).toBe true
			expect(_.isNumber "100").toBe false
			expect(_.isNumber {}).toBe false

	describe '#range', ->
		it '数列を生成する', ->
			expect(_.range 1,11).toEqual [1..10]
			expect(_.range 11).toEqual [0..10]
			expect(_.range 1,11,2).toEqual [1,3,5,7,9]

	describe '#random', ->
		it '乱数を生成する', ->
			expect(_.isNumber(_.random 10)).toBe true

	describe '#escape', ->
		it '特殊文字をエスケープする', ->
			expect(_.escape "<html>").toBe "&lt;html&gt;"
	
	describe '#times', ->
		it '指定回数分、関数実行を繰り返す', ->
			count = 0
			inc = -> count += 1
			_.times 10, inc
			expect(count).toBe 10

	describe '#chain,#value', ->
		it 'メソッドチェイン形式での書き方を可能にする', ->
			names = _.chain([alice,bob,chris])
				.filter((e) -> e.age is 18)
				.map((e) -> e.name)
				.value()
			expect(names).toEqual ["bob","chris"]

	describe '#template', ->
		it 'テンプレート機能', ->
			expect(_.template "name:<%- name %> <%- 2 * 2 %>", bob).toBe "name:bob 4"
	
	
	
	
	
	
	
	
	
	
	
		
				
	

describe 'YourCtrl', ->
	scope = null
	names = null

	beforeEach ->
		module 'YourApp'
		inject ($rootScope, $controller) ->
			scope = $rootScope.$new()
			ctrl = $controller 'YourCtrl',$scope: scope
		names = scope.names
	
	describe '#myStorage', ->
		it 'set/getで読み書きできる', ->
			scope.myStorage.set(100)
			expect(scope.myStorage.get()).toBe 100
	

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


	describe '#myStorage', ->
	
		it 'yourAppでセットした内容を読み取れる。', ->
			expect(scope.myStorage.get()).toBe 100


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



	