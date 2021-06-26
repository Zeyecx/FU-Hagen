program Transpose;
    const
  GROESSE = 5;
  
  type
  tMatrix = array [1..GROESSE,1..GROESSE] of integer;

  var
  A : tMatrix;
  tauschPuffer,
  i,
  j : integer;

begin
  for i := 1 to GROESSE do
    for j := 1 to GROESSE do
      readln (A[i,j]);

    
    for i := 1 to GROESSE-1 do
        for j := i+1 to GROESSE do
        begin
        tauschPuffer := A[i,j];
        A[i,j] := A[j,i];
        A[j,i] := tauschPuffer
        end
end.
