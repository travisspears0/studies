with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure tests is
	c: constant integer := 10;
	x: integer := 0;
	arr: array(1..c) of integer := (others =>0);
begin
	put_line("pass x");
	get(x);
	case x is
		when 1 =>
			put_line("one is bad");
		when 2 =>
			put_line("2 is just one too less");
		when others =>
		for i in x..c loop
			put_line("loop " & i'img);
		end loop;
	end case;
	for i in arr'range loop arr(i):=i*2; end loop;
	put_line("array:");
	for i of arr loop
		put_line(i'img);
	end loop;
end tests;
