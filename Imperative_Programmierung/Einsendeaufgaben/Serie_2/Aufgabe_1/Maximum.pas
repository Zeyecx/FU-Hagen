program Maximum (input, output);
{ bestimmt das Maximum fuer eine einzugebende Zahlenfolge von
  integer-Zahlen, die bei Eingabe einer Null abbricht }
  var
  Zahl, 
  Max : integer;
begin
  writeln ('Bitte geben Sie eine Folge ganzer Zahlen ein. ');
  writeln ('Schliessen Sie die Eingabe mit einer 0 ab.');
  readln (Zahl);
  if Zahl = 0 then
    writeln ('Leere Eingabefolge!')
  else
  begin
    Max := Zahl;
    while Zahl <> 0 do
    begin
      if Zahl > Max then
        Max := Zahl;
      readln (Zahl)
    end;
    writeln;
    writeln ('Das Maximum lautet ', Max, '.')
  end { else }
end. { Maximum }