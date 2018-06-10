module bitadder (a, b, cin, sum, cout);

input wire a;
input wire b;
input wire cin;

output wire sum;
output wire cout;

// assign sum = (a & ~b & ~cin) | (~a & b & ~cin) | (~a & ~b & cin) | (a & b & cin);
// assign cout = (b & cin) | (a & cin) | (a & b);
assigne {cout, sum} = a + b + cin;

endmodule
