function test() {
    var n = 4399;

    function add() {
        n++;
        console.log(n);
    }
    return {
        n: n,
        add: add
    };
}

var result = test();
var result2 = test();
result.add();
result.add();
console.log(result.n);
result2.add();

var name = "The Window";

var object = {
    name: "My Object",

    getNameFunc: function () {
        return function () {
            return this.name;
        };

    }

};

console.log(object.getNameFunc()());