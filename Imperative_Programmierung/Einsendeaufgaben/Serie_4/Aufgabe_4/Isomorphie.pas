program Aufgabe(input, output);

  type
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               wert:integer;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;

  var
  baumA:tRefBinBaum;
  baumB:tRefBinBaum;
  
  function check(A:tRefBinBaum; B:tRefBinBaum):boolean;
  
  {entscheidet, ob die Bäume A und B isomorph sind}
  begin
    {Rekursionsabbruch, wenn mindestens ein Baum leer ist.}
    if (A = nil) or (B = nil) then
      check := A=B 
    {Rekursionsschritt, vergleiche die Wurzeln und die zwei Teilbäume die an den Wurzeln hängen.}    
    else
      check := (A^.wert = B^.wert) and (check(A^.links, B^.links) and check(A^.rechts, B^.rechts) or check(A^.links, B^.rechts) and check(A^.rechts, B^.links));
  end;
  
  procedure LiesBaum(var A:tRefBinBaum);
  
    var
    x:integer;
  
  begin
    readln(x);
    if (x>0) then
    begin
      new(A);
      A^.wert := x;
      LiesBaum(A^.links);
      LiesBaum(A^.rechts);
    end
    else
      A := nil 
  end;

begin {Einlesen und Testen}
  new(baumA);
  LiesBaum(baumA);
  new(baumB);
  LiesBaum(baumB);
  writeln(check(baumA,baumB));
end.
