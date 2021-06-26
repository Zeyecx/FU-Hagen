program Aufgabe(input, output);

  type 
  tRefPolynom = ^tPolynom; 
  tPolynom = record
               koeffizient:integer;
               grad:integer;
               next:tRefPolynom
             end;

  var
  A,B:tRefPolynom;
  p,q,i:integer;
  
 function wert(inA:tRefPolynom;i:integer):integer;
  {wertet das Polynom inA an der Stelle i aus}
    var
    monom:tRefPolynom;
    result,produkt,grad:integer;

  begin
    monom := inA;
    result := 0;
    while (monom <> nil) do
    begin
      produkt := monom^.koeffizient;
      for grad:=1 to monom^.grad do
        produkt := produkt * i;
      result := result + produkt;
      monom := monom^.next;
    end;
    wert := result
  end;
    {Polynom einlesen und die Funktion wert testen}
begin  
  readln(p);
  if (p >= 0) then 
  begin 
    readln(q);
    new(A);
    A^.koeffizient := q;
    A^.grad := p;
    A^.next := nil
  end;
  B:=A;
  while (p >= 0) do
  begin
    readln(p);
    if (p >= 0) then
    begin 
      readln(q);
      new(B^.next);
      B := B^.next;
      B^.koeffizient := q;
      B^.grad := p;
      B^.next := nil
    end;
  end;
  readln(i);
  writeln(wert(A,i))
end.