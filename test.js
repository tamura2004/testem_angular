// Generated by CoffeeScript 1.6.2
(function() {
  describe('underscore.js', function() {
    var alice, bob, bob_dash, chris;

    alice = {
      name: "alice",
      age: 17
    };
    bob = {
      name: "bob",
      age: 18
    };
    bob_dash = {
      name: "bob",
      age: 18
    };
    chris = {
      name: "chris",
      age: 18
    };
    describe('_', function() {
      return it('_ が関数として定義されている', function() {
        return expect(typeof _).toBe("function");
      });
    });
    describe('#map', function() {
      return it('配列を長さを変えずに変換する', function() {
        return expect(_.map([1, 2, 3], function(e) {
          return e * 2;
        })).toEqual([2, 4, 6]);
      });
    });
    describe('#find', function() {
      it('条件に合致するものを１件選択する（配列）', function() {
        return expect(_.find([2, 5, 8, 42, 12], function(e) {
          return e > 5;
        })).toBe(8);
      });
      return it('条件に合致するものを１件選択する（オブジェクト）', function() {
        return expect(_.find([alice, bob, chris], function(e) {
          return e.age === 17;
        })).toBe(alice);
      });
    });
    describe('#filter', function() {
      it('条件に合致するものをすべて選択する（配列）', function() {
        return expect(_.filter([2, 5, 8, 42, 12], function(e) {
          return e > 5;
        })).toEqual([8, 42, 12]);
      });
      return it('条件に合致するものをすべて選択する（オブジェクト）', function() {
        return expect(_.filter([alice, bob, chris], function(e) {
          return e.age === 18;
        })).toEqual([bob, chris]);
      });
    });
    describe('#contains', function() {
      it('条件に合致するものの有無を調べる（配列）', function() {
        expect(_.contains([2, 5, 8, 42, 12], 5)).toBe(true);
        return expect(_.contains([2, 5, 8, 42, 12], 7)).toBe(false);
      });
      return it('条件に合致するもの有無を調べる（オブジェクト）', function() {
        expect(_.contains([alice, bob, chris], bob)).toBe(true);
        return expect(_.contains([alice, bob, chris], bob_dash)).toBe(false);
      });
    });
    describe('#groupBy', function() {
      return it('条件によりグループ分けする', function() {
        return expect(_.groupBy([alice, bob, chris], function(e) {
          return e.age;
        })).toEqual({
          "17": [alice],
          "18": [bob, chris]
        });
      });
    });
    describe('#countBy', function() {
      return it('条件により集計する', function() {
        return expect(_.countBy([alice, bob, chris], function(e) {
          return e.age;
        })).toEqual({
          "17": 1,
          "18": 2
        });
      });
    });
    describe('#sortBy', function() {
      return it('条件により並べ替える', function() {
        return expect(_.sortBy([chris, alice, bob], "name")).toEqual([alice, bob, chris]);
      });
    });
    describe('#union', function() {
      return it('和集合を作成する', function() {
        expect(_.union([1, 3, 5], [3, 5, 7])).toEqual([1, 3, 5, 7]);
        expect(_.union([alice, bob], [bob, chris])).toEqual([alice, bob, chris]);
        return expect(_.union([alice, bob_dash], [bob, chris])).not.toEqual([alice, bob, chris]);
      });
    });
    describe('#intersection', function() {
      return it('共通集合を作成する', function() {
        expect(_.intersection([1, 3, 5], [3, 5, 7])).toEqual([3, 5]);
        expect(_.intersection([alice, bob], [bob, chris])).toEqual([bob]);
        return expect(_.intersection([alice, bob_dash], [bob, chris])).toEqual([]);
      });
    });
    describe('#difference', function() {
      return it('差集合を作成する', function() {
        expect(_.difference([1, 2, 3], [2, 3])).toEqual([1]);
        return expect(_.difference([alice, bob, chris], [bob, chris])).toEqual([alice]);
      });
    });
    describe('#uniq', function() {
      return it('ユニークなものだけ集める', function() {
        expect(_.uniq([1, 1, 2, 1, 2, 2, 3, 3, 2, 3, 2, 2])).toEqual([1, 2, 3]);
        return expect(_.uniq([alice, bob, alice, chris, bob, chris])).toEqual([alice, bob, chris]);
      });
    });
    describe('#keys', function() {
      return it('オブジェクトのキーを求める', function() {
        return expect(_.keys(bob)).toEqual(["name", "age"]);
      });
    });
    describe('#values', function() {
      return it('オブジェクトの値を求める', function() {
        return expect(_.values(bob)).toEqual(["bob", 18]);
      });
    });
    describe('#invert', function() {
      return it('keyとvalueを逆にする', function() {
        return expect(_.invert(bob)).toEqual({
          "bob": "name",
          "18": "age"
        });
      });
    });
    describe('#has', function() {
      return it('キーの有無を調べる', function() {
        return expect(_.has(bob, "name")).toBe(true);
      });
    });
    describe('#isEmpty', function() {
      return it('要素が空かどうか調べる', function() {
        expect(_.isEmpty([])).toBe(true);
        expect(_.isEmpty({})).toBe(true);
        expect(_.isEmpty([1])).toBe(false);
        return expect(_.isEmpty({
          a: 1
        })).toBe(false);
      });
    });
    describe('#isString', function() {
      return it('文字列かどうか調べる', function() {
        expect(_.isString("")).toBe(true);
        expect(_.isString("hoge")).toBe(true);
        expect(_.isString(0)).toBe(false);
        return expect(_.isString({})).toBe(false);
      });
    });
    describe('#isNull', function() {
      return it('nullかどうか調べる', function() {
        expect(_.isNull(null)).toBe(true);
        expect(_.isNull(false)).toBe(false);
        expect(_.isNull("")).toBe(false);
        return expect(_.isNull({})).toBe(false);
      });
    });
    describe('#isNumber', function() {
      return it('数字かどうか調べる', function() {
        expect(_.isNumber(1)).toBe(true);
        expect(_.isNumber(-10000)).toBe(true);
        expect(_.isNumber(0.9999)).toBe(true);
        expect(_.isNumber(NaN)).toBe(true);
        expect(_.isNumber("100")).toBe(false);
        return expect(_.isNumber({})).toBe(false);
      });
    });
    describe('#range', function() {
      return it('数列を生成する', function() {
        expect(_.range(1, 11)).toEqual([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        expect(_.range(11)).toEqual([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        return expect(_.range(1, 11, 2)).toEqual([1, 3, 5, 7, 9]);
      });
    });
    describe('#random', function() {
      return it('乱数を生成する', function() {
        return expect(_.isNumber(_.random(10))).toBe(true);
      });
    });
    describe('#escape', function() {
      return it('特殊文字をエスケープする', function() {
        return expect(_.escape("<html>")).toBe("&lt;html&gt;");
      });
    });
    describe('#times', function() {
      return it('指定回数分、関数実行を繰り返す', function() {
        var count, inc;

        count = 0;
        inc = function() {
          return count += 1;
        };
        _.times(10, inc);
        return expect(count).toBe(10);
      });
    });
    describe('#chain,#value', function() {
      return it('メソッドチェイン形式での書き方を可能にする', function() {
        var names;

        names = _.chain([alice, bob, chris]).filter(function(e) {
          return e.age === 18;
        }).map(function(e) {
          return e.name;
        }).value();
        return expect(names).toEqual(["bob", "chris"]);
      });
    });
    return describe('#template', function() {
      return it('テンプレート機能', function() {
        return expect(_.template("name:<%- name %> <%- 2 * 2 %>", bob)).toBe("name:bob 4");
      });
    });
  });

  describe('YourCtrl', function() {
    var names, scope;

    scope = null;
    names = null;
    beforeEach(function() {
      module('YourApp');
      inject(function($rootScope, $controller) {
        var ctrl;

        scope = $rootScope.$new();
        return ctrl = $controller('YourCtrl', {
          $scope: scope
        });
      });
      return names = scope.names;
    });
    describe('#myStorage', function() {
      return it('set/getで読み書きできる', function() {
        scope.myStorage.set(100);
        return expect(scope.myStorage.get()).toBe(100);
      });
    });
    return describe('#names', function() {
      return it('should be 長さ3の配列', function() {
        return expect(names.length).toBe(3);
      });
    });
  });

  describe('MyCtrl', function() {
    var calender, fizzbuzz, scope;

    scope = null;
    fizzbuzz = null;
    calender = null;
    beforeEach(function() {
      module('MyApp');
      inject(function($rootScope, $controller) {
        var ctrl;

        scope = $rootScope.$new();
        return ctrl = $controller('MyCtrl', {
          $scope: scope
        });
      });
      fizzbuzz = scope.fizzbuzz;
      return calender = scope.calender;
    });
    describe('#myStorage', function() {
      return it('yourAppでセットした内容を読み取れる。', function() {
        return expect(scope.myStorage.get()).toBe(100);
      });
    });
    describe('#calender', function() {
      return it('should be array of 6 x 7', function() {
        expect(calender.length).toBe(6);
        return expect(calender[0].length).toBe(7);
      });
    });
    return describe('#fizzbuzz', function() {
      it('３の倍数で"fizz"を返す', function() {
        expect(fizzbuzz(-6)).toBe("fizz");
        expect(fizzbuzz(-3)).toBe("fizz");
        expect(fizzbuzz(3)).toBe("fizz");
        expect(fizzbuzz(6)).toBe("fizz");
        expect(fizzbuzz(9)).toBe("fizz");
        return expect(fizzbuzz(12)).toBe("fizz");
      });
      it('５の倍数で"buzz"を返す', function() {
        expect(fizzbuzz(-10)).toBe("buzz");
        expect(fizzbuzz(-5)).toBe("buzz");
        expect(fizzbuzz(5)).toBe("buzz");
        return expect(fizzbuzz(10)).toBe("buzz");
      });
      it('３と５の公倍数であれば"fizzbuzz"を返す', function() {
        expect(fizzbuzz(-15)).toBe("fizzbuzz");
        expect(fizzbuzz(0)).toBe("fizzbuzz");
        expect(fizzbuzz(15)).toBe("fizzbuzz");
        expect(fizzbuzz(30)).toBe("fizzbuzz");
        return expect(fizzbuzz(45)).toBe("fizzbuzz");
      });
      return it('３の倍数でも５の倍数でもなければ数字をnumber型で返す', function() {
        expect(fizzbuzz(1)).toBe(1);
        expect(fizzbuzz(2)).toBe(2);
        expect(fizzbuzz(4)).toBe(4);
        expect(fizzbuzz(7)).toBe(7);
        expect(fizzbuzz(101)).toBe(101);
        return expect(fizzbuzz(-101)).toBe(-101);
      });
    });
  });

}).call(this);
