  procedure setLevelOrder(inBaum:tRefBinBaum);
  var
  lauf :tRefBinBaum;
  listenEnde :tRefBinBaum;
  begin
    lauf := inBaum;
    listenEnde := inBaum;
    while (lauf <> nil) do
    begin
      if (lauf^.li <> nil) then
      begin
        listenEnde^.next := lauf^.li;
        listenEnde := listenEnde^.next;
      end;
      if (lauf^.re <> nil) then
      begin
        listenEnde^.next := lauf^.re;
        listenEnde := listenEnde^.next;
      end;
      lauf := lauf^.next
    end;
  end;

  procedure levelOrder(inBaum:tRefBinBaum);
  begin
    if (inBaum <> nil) then
    begin
      writeln(inBaum^.wert);
      levelOrder(inBaum^.next)
    end
  end;
 