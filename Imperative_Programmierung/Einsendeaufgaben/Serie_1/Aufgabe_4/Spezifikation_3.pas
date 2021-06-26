program pythagoras(input,output);

  var 
  a,b,c : integer;
  x : boolean;

begin 
  readln(a);
  readln(b);
  readln(c); 
   
   //x := (a*a = (b*b + c*c)) or (b*b = (a*a + c*c)) or ((a*a + b*b) = c*c);
   
    x := false; 
  if (sqrt(sqr(a)+sqr(b)) = c) and (x = false) Then
    x:= true;


  if (sqrt(sqr(c)+sqr(b)) = a) and (x = false) Then
    x:= true;


 if (sqrt(sqr(c)+sqr(a)) = b) and (x = false) Then
    x:= true;
  writeln(x); 
end.