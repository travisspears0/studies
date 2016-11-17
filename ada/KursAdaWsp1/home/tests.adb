with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure tests is
	task ta is
		entry start;
		entry stop;
		entry count(n:in out integer);
	end ta;
	
	task body ta is
	begin
		loop
			select
				accept start do
					put_line("start");
				end start;
			or
				accept count(n:in out integer) do
					n := n+1;
					put_line("count..." & n'img);
				end count;
			or
				accept stop;
					exit;
			end select;
		end loop;
	end ta;
	x:integer:=0;
begin
	ta.start;
	for i in 1..10 loop
		ta.count(x);
		x:=x-1;
		delay 0.1;
	end loop;
	ta.stop;
	put_line("x=" & x'img);
end;
