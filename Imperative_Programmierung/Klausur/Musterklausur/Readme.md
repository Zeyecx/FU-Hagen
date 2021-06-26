# Musterklausur (1 Punkt)
## Liste von natürlichen Zahlen
Bearbeiten Sie die folgende Aufgabe auf Ihrem Rechner und laden Sie Ihre .pas-Datei anschließend hoch. Als Hilfsmittel sind der Kurstext, alle Musterklausuren, Ihr PC, ein Editor und ein Pascal-Compiler zugelassen. Mit Absenden der Datei bestätigen Sie, dass Sie die Aufgabe eigenständig gelöst haben und damit einverstanden sind, dass wir unter anderem Plagiatssoftware verwenden dürfen, um dieses zu überprüfen.

## Die Prüfungsklausur ist unbenotet. Sie haben die Klausur bestanden, wenn
(A)   Ihr Programm kompiliert (wir korrigieren nur kompilierbare Programme), \
(B)   Ihr Programm alle Funktionen/Prozeduren der Aufgabenstellung korrekt implementiert, \
(C)   Ihr Programm diese Funktionen/Prozeduren wie beschrieben aufrufen kann und \
(D)   Ihr Programm die Muss-Regeln des Kurses einhält. \
Viel Erfolg!

 

## Aufgabe:
Schreiben Sie ein Programm mit Typendefinitionen für eine Liste von natürlichen Zahlen.
Hier ist ein Beispiel für eine Liste A und die Zahlen 1, 42 und 3.

 
```
A -> [zahl:1,next:] -> [zahl:42,next:] -> [zahl:3,next:] -> nil
```
 

Wir zählen die Element einer Liste von vorne nach hinten durch. Das erste Element der Liste hat die Position 1, das Zweite die Position 2 usw.

## Ihr Programm soll die folgenden Funktionen/Prozeduren besitzen:

- add fügt in eine Liste A ein neues Element mit Zahl x an Position p ein. Ist das nicht möglich, weil die Liste dafür zu kurz ist, wird das neue Element hinten angehängt.

- remove entfernt aus einer Liste A das Element an einer Position p. Ist das nicht möglich, weil die Position nicht existiert, wird nicht gelöscht.

- wert liefert aus einer Liste A die Zahl des Elements an Position p. Existiert dieses Element nicht, wird 0 zurückgegeben.

- print gibt eine Liste A auf der Standardausgabe aus.

- minpos liefert aus einer Liste A die Position eines Elements mit einer kleinsten Zahl. Ist die Liste leer wird 0 zurückgegeben.

- sort liefert für eine Liste A eine neue Liste zurück. Diese enthält die gleichen Zahlen wie A, nur ist sie aufsteigend sortiert. Die ursprüngliche Liste existiert nach dem Aufruf nicht mehr.

- Ihr Programm definiert eine leere Liste A und liest Benutzereingaben ein. Ist die Eingabe add, remove, wert, print, minpos oder sort, wird die entsprechende Funktionalität für die Liste A ausgeführt und auf eine neue Benutzereingabe gewartet. Ist die Eingabe x wird die Liste A geleert. Ist die Eingabe q wird das Programm beendet.