
//wor, trior : Wired outputs OR together (models ECL)
module test_wor();
wor a;
reg b, c;

assign a = b;
assign a = c;

initial begin
  $monitor("%g a = %b b = %b c = %b", $time, a, b, c);

  #1 b = 0;   // 0 or x => x
  #1 c = 0;   // 0 or 0 => 0
  #1 b = 1;   // 1 or 0 => 1
  #1 b = 0;   // 0 or 0 => 0
  #1 c = 1;   // 0 or 1 => 1
  #1 b = 1;   // 1 or 1 => 1
  #1 b = 0;   // 0 or 1 => 1
  #1 $finish;

end
endmodule
/*
0 a = x b = x c = x
1 a = x b = 0 c = x
2 a = 0 b = 0 c = 0
3 a = 1 b = 1 c = 0
4 a = 0 b = 0 c = 0
5 a = 1 b = 0 c = 1
6 a = 1 b = 1 c = 1
7 a = 1 b = 0 c = 1
*/
