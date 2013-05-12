
myApp = angular.module 'MyApp', ['YourApp']

myApp.controller 'MyCtrl', ['$scope', 'myStorage', ($scope, myStorage) ->

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

	$scope.myStorage = myStorage
]

yourApp = angular.module 'YourApp', []

yourApp.controller 'YourCtrl', ['$scope', 'myStorage', ($scope, myStorage) ->

	$scope.names = ["富士通","IBM","NTTD"]
	$scope.myStorage = myStorage	
]


count = 0
yourApp.factory 'myStorage', ->
	class Hoge
		set: (n) -> count = n
		get: -> count
	new Hoge()

