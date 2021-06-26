program Verkauf (input, output);
  
  const
  GRUNDPREIS = 200.00;
  
  var
  Anzahl : integer;
  Preis : real;

begin
  writeln ('Bitte die Anzahl bestellter Waren eingeben:');
  readln (Anzahl);
  if Anzahl > 0 then
  begin
    Preis := Anzahl * GRUNDPREIS;
    if Anzahl > 10 then
      if Anzahl > 50 then
        Preis := Preis * 0.8
      else
        Preis := Preis * 0.9;
    writeln ('Der Preis betraegt ', Preis, ' EUR')
  end
  else
    writeln ('falsche Eingabe')
end.