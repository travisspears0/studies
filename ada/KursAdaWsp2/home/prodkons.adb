with ada.text_io;
use ada.text_io;

procedure prodkons is
	type eltype is array(integer range<>) of integer;
--buf
	protected buf is
		entry wstaw(x: integer);
		entry wez(x: out integer);
		private
			count:integer := 0;--info ile jest elementow
			elements: eltype(1..3);
	end buf;
	
	protected body buf is
		entry wstaw(x: integer) when count<elements'length is begin
			put_line("    [buf]wstawianie");
			count := count+1;
			elements(count) := x;
		end wstaw;
		entry wez(x: out integer) when count>0 is begin
			put_line("    [buf]branie");
			x := elements(count);
			elements(count) := 0;
			count := count-1;
		end wez;
	end buf;

--producent
	task prd;
	task body prd is
		n:integer:=1;
	begin
		for i in 1..5 loop
			--put_line("+[prd]produkcja... " & n'img);
			buf.wstaw(n);
			put_line("+[prd]wyprodukowano!" & n'img);
			n := n+1;
			delay 0.2;
		end loop;
	end prd;

--klient
	task klnt;
	task body klnt is
		x:integer;
	begin
		for i in 1..5 loop
			--put_line("-[klnt]kupowanie... " & n'img);
			buf.wez(x);
			put_line("-[klnt]kupiono!" & x'img);
			delay 1.2;
		end loop;
	end klnt;
	
	
begin
	put("");
end prodkons;