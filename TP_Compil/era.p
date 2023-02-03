var table[100] = 1;
var i = 0;
while (i < 100) {
    if (table[i]) {
        var j = i;
        while (j < 100) {
            table[j] = 0;
            j = j + (i+2);
        }
        print j;
    }
}