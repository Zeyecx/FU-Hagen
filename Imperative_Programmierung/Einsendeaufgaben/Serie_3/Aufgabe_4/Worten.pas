program Aufgabe(input, output);

  type 
  tRefIndexListe = ^tIndexListe; 
  tIndexListe = record 
                  index:integer;
                  wert:String;
                  next:tRefIndexListe 
                end;

  var
  A,B:tRefIndexListe;
  p:integer;
  q:string;
  
  procedure add(var ioListe:tRefIndexListe; inIndex:integer; inWert:String);
      var
    akt:tRefIndexListe;
    n:tRefIndexListe;
    gefunden:boolean;

  begin 
    new(n); 
    n^.index := inIndex;
    n^.wert := inWert;
    
    if (ioListe = nil) then
    begin
      n^.next := nil;
      ioListe := n
    end  
    else 
      if (inIndex <= ioListe^.index) then
      begin
        n^.next := ioListe; 
        ioListe := n;
      end
      else
      begin
        akt := ioListe;
        gefunden := false;
        while ((akt^.next <> nil) and not gefunden) do
        begin
          if ((akt^.next^.index) >= inIndex) then
          begin
            n^.next := akt^.next;
            akt^.next := n; 
            gefunden := true
          end;	 
          akt:=akt^.next   
        end;
        if (not gefunden) then
        begin
          akt^.next := n;
          n^.next := nil
        end
      end;
    
    akt := ioListe;
    while (akt^.next <> nil) do
    begin
      if (akt^.index = akt^.next^.index) then
      begin
        akt^.next^.index := akt^.next^.index + 1;
      end;
      akt := akt^.next
    end
  end; 
  {Liste bauen und Prozedur add testen}
begin
  A := nil;  
  readln(p);
  if (p >= 0) then 
  begin 
    readln(q);
    new(A);
    A^.index := p;
    A^.wert := q;
    A^.next := nil
  end;
  B := A;
  while (p >= 0) do
  begin
    readln(p);
    if (p >= 0) then
    begin 
      readln(q);
      new(B^.next);
      B := B^.next;
      B^.index := p;
      B^.wert := q;
      B^.next  := nil
    end;
  end;
  readln(p);
  readln(q);

  add(A,p,q);
     
  while (A <> nil) do
  begin
    write('[',A^.index);
    write(',');
    write(A^.wert,']');
    A := A^.next;
  end
end.