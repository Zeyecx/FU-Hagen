type	
tRefKante = ^tKante;
tKante = record
           von: integer;
           zu: integer;
           x:boolean; 
           next: tRefKante
         end;

procedure push(var ioG:tRefKante; inVon:integer; inZu:integer);
  var
  n:tRefKante;
begin 
  new(n);
  n^.von := inVon;
  n^.zu := inZu;
  n^.x := false;  
  n^.next := ioG;
  ioG := n
end;

function get(inG:tRefKante; inVon:integer):tRefKante;
  var
  n:tRefKante;
begin 
  get := nil;
  n := inG;
  while (n <> nil) do
  begin 
    if ((n^.von = inVon) and (not n^.x)) then
      get := n;
    n := n^.next;
  end;
end;
 
function wasPassiert(inG:tRefKante; inVon:integer; inZu:integer):tRefKante;
  var
  akt:integer;
  kante:tRefKante;
  B:tRefKante;
begin 
  akt := inVon;
  B := nil;
  while ((akt <> inZu) and (akt <> 0)) do 
  begin
    kante := get(inG,akt);
    if (kante <> nil) then
    begin
      push(B,kante^.von,kante^.zu);
      akt := kante^.zu;
      kante^.x := true
    end
    else
    begin
      if (B <> nil) then
        B := B^.next;
      if (B = nil) then 
        akt := 0
      else 
        akt := B^.zu
    end;
  end;
  wasPassiert := B
end;

procedure print(graph:tRefKante);
  var
  e,f : tRefKante; 
begin 
  e := graph;
  while (e^.next <> nil) do 
  begin
    e := e^.next;
  end;
  write('[',e^.von, ',', e^.zu,']');
  while (e <> graph) do
  begin
    f := graph;
    while (f^.next <> e) do 
    begin
      f := f^.next
    end; 	
    write('[',f^.von, ',', f^.zu,']');
    e := f 
  end;
end;