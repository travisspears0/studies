with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure sito is

	n: constant integer := 103;
	checks_number: constant integer := n/2+1;
	primes: array(1..N) of boolean := (others => true);

	task check is
		entry e(x:integer);
		entry over;
	end check;

	task body check is
		num: integer;
		i: integer;
	begin
		loop
			select
				accept e(x:integer) do
					num := x;
				end e;
				i:= num*2;
				loop
					if(i > n) then exit; end if;
					primes(i) := false;
					i := i+num;
				end loop;
			or
				accept over;exit;
			end select;
		end loop;
	end check;

	current: integer := 2;
	i: integer;
begin
	put_line("obliczam sito z zakresu 1-" & n'img & " with "& checks_number'img &" checks");
	while current <= checks_number loop
		check.e(current);
		current := current+1;
	end loop;
	check.over;
	i:=1;
	for i in primes'range loop
		if(primes(i) = true) then
			put_line(i'img);
		end if;
	end loop;

end sito;
