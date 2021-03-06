// Generated by CoffeeScript 1.6.2
(function() {
  var count, myApp, yourApp;

  myApp = angular.module('MyApp', ['YourApp']);

  myApp.controller('MyCtrl', [
    '$scope', 'myStorage', function($scope, myStorage) {
      $scope.fizzbuzz = function(n) {
        var f;

        f = function(m, s) {
          if (n % m) {
            return "";
          } else {
            return s;
          }
        };
        return f(3, "fizz") + f(5, "buzz") || n;
      };
      $scope.calender = [[1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1]];
      return $scope.myStorage = myStorage;
    }
  ]);

  yourApp = angular.module('YourApp', []);

  yourApp.controller('YourCtrl', [
    '$scope', 'myStorage', function($scope, myStorage) {
      $scope.names = ["富士通", "IBM", "NTTD"];
      return $scope.myStorage = myStorage;
    }
  ]);

  count = 0;

  yourApp.factory('myStorage', function() {
    var Hoge;

    Hoge = (function() {
      function Hoge() {}

      Hoge.prototype.set = function(n) {
        return count = n;
      };

      Hoge.prototype.get = function() {
        return count;
      };

      return Hoge;

    })();
    return new Hoge();
  });

}).call(this);
