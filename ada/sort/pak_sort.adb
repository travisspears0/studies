-- pak_sort.adb

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Float_Random ;

-- Zadanie:
-- dopisać treści procedur

package body Pak_Sort is

procedure Put_Wektor(W: Wektor; Kom: String := "") is
begin
	put_line(kom);
	for i in w'range loop
		put_line(w(i)'img);
	end loop;
	new_line;
end Put_Wektor;		

procedure Losuj_Wektor(W: in out Wektor; Max: Float := 100.0) is
	gen : generator;
begin
	reset(gen,integer(max));
	for i in W'range loop
		W(i) := integer(random(gen)*1000.0);
	end loop;
end Losuj_Wektor; 

-- sortowanie bąbelkowe wektora W
procedure Sortuj_BB(W: in out Wektor) is 
begin
	for i in 1..(w'length-1) loop
		for j in 1..(w'length-1) loop
			if w(j)>w(j+1) then
				w(j) := w(j)+w(j+1);
				w(j+1) := w(j)-w(j+1);
				w(j) := w(j)-w(j+1);
			end if;
		end loop;
	end loop;
end Sortuj_BB;

procedure Scalaj2(W1, W2: Wektor; W: in out Wektor) is
-- scala posortowane wektory W1, W2 do W
	i,i1,i2: integer := 1;	
begin
	loop
		if i > w'length then exit; end if;
--		if i1 > w1'length and then i2 > w2'length then exit; end if;
		if i1 > w1'length then
			w(i) := w2(i2);
			i2 := i2+1;
		elsif i2 > w2'length then
			w(i) := w1(i1);
			i1 := i1+1;
		end if;
		if i1 <= w1'length and then i2 <= w2'length then
			if w1(i1) > w2(i2) then
				w(i) := w2(i2);
				i2 := i2+1;
			else
				w(i) := w1(i1);
				i1 := i1+1;
			end if;
		end if;
		i := i+1;
	end loop;
end Scalaj2;		  

end Pak_Sort;

