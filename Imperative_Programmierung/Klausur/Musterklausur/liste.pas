{$R+} 
{$B+} 

program liste(input, output);
{editiert eine Liste natürlicher Zahlen}
  type	
  tRefListe = ^tListe;
  tListe = record
             zahl:integer;
             next:tRefListe
           end;
           
  var
  position:integer;
  zahl:integer;
  befehl:string;
  eingabeListe:tRefListe;

  procedure add(inIndex:integer; inZahl:integer; var ioListe:tRefListe);
  {fügt eine Zahl inZahl an Position inIndex hinzu}
    var
    i:integer;
    akt:tRefListe;
    neu:tRefListe;
    
  begin 
    if (ioListe = nil) then
    begin
      new(ioListe);
      ioListe^.zahl := inZahl;
      ioListe^.next := nil
    end  
    else 
    begin  
      new(neu); 
      neu^.zahl := inZahl;
      neu^.next := nil;
      if inIndex = 1 then
      begin
        neu^.next := ioListe;
        ioListe := neu  
      end
      else
      begin
        i := 1;
        akt := ioListe;
        while (i < inIndex - 1) and (akt^.next <> nil) do
        begin
          akt := akt^.next;
          i := i + 1  
        end;
        neu^.next := akt^.next;
        akt^.next := neu
      end
    end
  end;
  
  procedure remove(inIndex:integer; var ioListe:tRefListe);
  {entfernt die Zahl an Position inIndex}
    var
    i:integer;
    akt:tRefListe;
    trash:tRefListe;
    
  begin 
    if (ioListe <> nil) then
    begin
      if inIndex = 1 then
      begin
        trash := ioListe;
        ioListe := ioListe^.next;
        dispose(trash)
      end
      else
      begin
        i := 1;
        akt := ioListe;
        while (i < inIndex - 1) and (akt^.next <> nil) do
        begin
          akt := akt^.next;
          i := i + 1 
        end;
        if akt^.next <> nil then
        begin
          trash := akt^.next;
          akt^.next := akt^.next^.next;
          dispose(trash)
        end
      end
    end
  end; 

  function wert(inListe:tRefListe; inIndex:integer):integer;
  {liefert die Zahl an Position inIndex}
    var
    i:integer;
    lauf:tRefListe;
    
  begin 
    i := 1;
    lauf := inListe;
    while (i <> inIndex) and (lauf <> nil) do
    begin
      lauf := lauf^.next;
      i := i + 1  
    end;
	if lauf <> nil then
	  wert := lauf^.zahl
	else
	  wert := 0;
  end; 

  procedure print(inListe:tRefListe);
  {schreibt die Liste auf die Standardausgabe}  
    var
    lauf:tRefListe;
    
  begin
    lauf := inListe;
    while lauf <> nil do
    begin 
      write(lauf^.zahl);
      write(' ');
      lauf := lauf^.next;
    end;
    writeln('');
  end;
  
  function minpos(inListe:tRefListe):integer;
  {liefert die Position einer kleinsten Zahl der Liste}
    var
    i:integer;
    min:integer; 
    index:integer;
    lauf:tRefListe;
    
  begin
    lauf := inListe;
    index := 0;
    if lauf <> nil then
    begin
      index := 1;
      i:= 1;
      min := lauf^.zahl
    end;
    while lauf <> nil do
    begin
      if lauf^.zahl < min then
      begin
        min := lauf^.zahl;
        index := i;
      end;
      i := i + 1;
      lauf := lauf^.next;
    end;
    minpos := index
  end;
  
  procedure sort(var ioListe:tRefListe);
  {liefert eine sortierte Liste mit den gleichen Zahlen}
    var
    liste:tRefListe;
    i:integer;
    lange:integer;
  
  begin
    liste := nil;
    lange :=1; 
    while ioListe <> nil do
    begin
      i:= minpos(ioListe);
      add(lange,wert(ioListe,i),liste);
      remove(i,ioListe);
      lange := lange + 1 
    end;
    ioListe := liste
  end;
  
begin
  eingabeListe := nil;
  write('(add,remove,print,minpos,wert,sort,x,q) -> ');
  readln(befehl);
  while (befehl <> 'q') do
  begin
    if (befehl = 'add') then
    begin
      write('Add an Position ');
      readln(position);
      write('Die Zahl ');
      readln(zahl);
      add(position,zahl,eingabeListe);
    end;    
    if (befehl = 'remove') then
    begin
      write('Remove Position ');
      readln(position);
      remove(position,eingabeListe);
    end;
    if (befehl = 'print') then
    begin
      writeln('Liste ');
      print(eingabeListe)
    end;
    if (befehl = 'minpos') then
    begin
      write('Minimum an Position ');
      writeln(minpos(eingabeListe))
    end;
    if (befehl = 'wert') then
    begin
      write('Wert an Position ');
      readln(position);
      writeln(wert(eingabeListe,position))
    end;
    if (befehl = 'sort') then
      sort(eingabeListe);
    if (befehl = 'x') then
      while eingabeListe <> nil do
        remove(1,eingabeListe); 
    write('(add,remove,print,minpos,wert,sort,x,q) -> ');
    readln(befehl)
  end
end.
