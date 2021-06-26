type 
tFeld = array [1..5] of integer; 

function WasPassiert(Feld : tFeld):integer;

  var 
  i : integer;

begin
  for i := 2 to 5 do 
    Feld[i] := Feld[i] + Feld[i-1]; 
  WasPassiert := Feld[5] 
end;