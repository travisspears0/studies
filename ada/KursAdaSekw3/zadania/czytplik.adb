-- wyjatki1.adb

with Ada.Text_IO;
use Ada.Text_IO;

procedure Wyjatki1 is
  Pl : File_Type;
  Nazwa: String(1..100) := (others => ' ');	
  Dlugosc : Integer := 0;
begin
  loop
	Put_Line("Podaj nazwe pliku do otwarcia: ");
	Get_Line(Nazwa, Dlugosc);
    begin 
	 	if dlugosc=0 then
			put_line("nie podano nazwy pliku, koniec");
	 		return;
 		end if;
  	  Put_Line("Otwieram plik: " & Nazwa(1..Dlugosc));
	  	Open(Pl, In_File, Nazwa(1..Dlugosc));
	  loop
		  exit when end_of_file(Pl);
	  	  put_line(get_line(Pl));
	  end loop;
	  exit;
	exception
	  when Name_Error => Put_Line("Bledna nazwa pliku <" & Nazwa(1..Dlugosc) & "> !");
	end;  
  end loop;
  
  Put_Line("Zamykam plik");
  Close(Pl);
end Wyjatki1;