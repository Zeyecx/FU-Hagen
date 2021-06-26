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
function crek(inA:tRefListe;inB:tRefListe):boolean;
begin
  if ((inA = nil) or (inB = nil)) then
    crek := ((inA = nil) and (inB = nil))
  else
    crek := crek(inA^.next, inB^.next)
end;