  function tiefe(t:integer;A:tRefBinBaum):integer;
    
    var 
    x:integer;
    y:integer;
  
  begin 
    if (A = nil) then 
      tiefe := t-1
    else 
    begin
      A^.wert := t;
      x := tiefe(t+1,A^.li);
      y := tiefe(t+1,A^.re);
      if (x < y) then 
        tiefe := y
      else 
        tiefe := x;
    end
  end;