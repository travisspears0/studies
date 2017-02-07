with ada.text_io;
use ada.text_io;

procedure inwersja is
	type PIC is array (POSITIVE range <>, POSITIVE range <>) of INTEGER;

	procedure print(p: in pic; r: in integer; c: in integer) is
	begin
		for i in 1..r loop
			for j in 1..c loop
				put(p(i,j)'img & ",");
			end loop;
			put_line("");
		end loop;
	end;

	pic1: pic:=((1,2,3),(2,3,4),(3,4,5),(9,8,7));
begin
	print(pic1,4,3);
	put("");
end inwersja;
