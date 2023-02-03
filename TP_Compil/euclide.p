var a;
input a;
var b;
input b;
var t;
if (a < b) then {
    t = a;
    a = b;
    b = t;
}
print a;
print b;
while (b != 0) {
    t = b;
    b = a % b;
    a = t;
}
print a;