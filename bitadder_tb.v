`include "bitadder.v"
module bitadd_tb ();

reg a, b, cin;
wire sum, cout;

initial begin
    $monitor ("%g\t %b  %b  %b  %b  %b", $time, a, b, cin, sum, cout);
    a = 0;
    b = 0;
    cin = 0;
    #1 cin = 1; // 001
    #2 cin = 0; // 010
       b = 1;
    #3 cin = 1; // 011
    #4  a = 1; // 100
        b = 0;
        cin = 0;
    #5 a = 1; // 101
       b = 0;
       cin = 1;
    #6 b = 1; // 110
       cin = 0;
    #7 cin = 1; // 111

end

bitadder badder (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

endmodule
