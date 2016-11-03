with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure dziesnadw is
	liczba: Integer :=0;
	i : Integer := 1;
	x: Integer:=0;
	wynik: String(1..20) := (others => ' ');
	str : string(1..20) := (others => ' ');
begin
	put("podaj liczbee");
	get(liczba);
	while(liczba > 0) loop
		x := liczba mod 2;
		put(x'img);
		str(i) := character'val(x+48);
		i := i+1;
		liczba := liczba/2;
	end loop;
	new_line;
	for j in str'range loop
		wynik (wynik'Last - j + str'First) := str (j);
		--put(str(j)'img);--to zrobic funkcyjnie czyli str od tylu odczytac
	end loop;
	for j in wynik'range loop
		if(wynik(j)'img /= "' '") then 
			put(wynik(j));
		end if;
		--put(wynik(j));
	end loop;
end dziesnadw;
