
myApp = angular.module 'MyApp', ['YourApp']

myApp.controller 'MyCtrl', ['$scope', 'inc', ($scope, inc) ->

	$scope.fizzbuzz = (n) ->
		f = (m,s) -> if n % m then "" else s
		f(3,"fizz") + f(5,"buzz") or n

	$scope.calender = [
		[1,1,1,1,1,1,1]
		[1,1,1,1,1,1,1]
		[1,1,1,1,1,1,1]
		[1,1,1,1,1,1,1]
		[1,1,1,1,1,1,1]
		[1,1,1,1,1,1,1]
	]

	$scope.inc = inc
]

yourApp = angular.module 'YourApp', []

yourApp.controller 'YourCtrl', ['$scope', 'inc', ($scope, inc) ->

	$scope.names = ["富士通","IBM","NTTD"]
	$scope.inc = inc	
]

count = 0
yourApp.factory 'inc', ->
	class Hoge
		set: (n) -> count = n
		get: -> count
	new Hoge()

