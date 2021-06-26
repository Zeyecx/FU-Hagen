{Das ist kein Programm :) }
type
tMatrix = array [1..8, 1..8] of boolean;
tVektor = array [1..8] of boolean;

var
inMatrix : tMatrix;

function check (var inMatrix : tMatrix) : boolean;
   
  var
  s:boolean;
  a, b : tVektor;
  x, y, sum: integer;

begin 
  s := true;
  sum := 0;
  for x := 1 to 8 do
  begin
    a[x] := false;
    b[x] := false
  end;
    
 for x := 1 to 8 do
  begin
    for y := 1 to 8 do
      if inMatrix[y,x] then
      begin
        sum := sum + 1;
        if (a[y] or b[x]) then 
          s := false;
        a[y] := true;
        b[x] := true;
      end;
  end;
  check := s and (sum = 8)
end;