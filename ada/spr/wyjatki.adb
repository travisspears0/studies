with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure wyjatki is
	function silnia(n:integer) return integer is (if n<=1 then 1 else n*silnia(n-1));
	function pow(a:integer;n:integer) return integer is
		result:integer := 1;
	begin
		if n < 0 then raise numeric_error; end if;
		for i in 1..n loop
			result := result*a;
		end loop;
		return result;
	end;
begin
	begin
		put_line(silnia(5)'img);
		put_line(pow(3,-2)'img);
	exception
		when numeric_error => put_line("potega nie moze byc mniejsza od zera");
	end;
end wyjatki;

