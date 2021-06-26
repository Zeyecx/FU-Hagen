type
tRefListe = ^tListe;
tListe = record
           wert : integer;
           next : tRefListe
         end;

function c(inA : tRefListe; inB : tRefListe) : boolean;
begin
  while ((inA <> nil) and (inB <> nil)) do
  begin
    inA := inA^.next;
    inB := inB^.next
  end;
  c := ((inA = nil) and (inB = nil))
end;

function m(inA : tRefListe; inB : tRefListe) : integer;
  var
  e:integer;
begin
  e := 0;
  while (inA <> nil) do
  begin
    e := e + inA^.wert * inB^.wert;
    inA := inA^.next;
    inB := inB^.next
  end;
  m := e
end;

function f(inA : tRefListe; inB : tRefListe) : integer;
begin
  if c(inA,inB) then
    f := m(inA,inB)
  else
    f := 0
end;