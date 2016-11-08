with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure tests is
	i:integer := 0;
	task ta is
		entry start;
		entry stop;
		entry count;
	end ta;
	
	task body ta is
	begin
		loop
			select
				accept start do
					put_line("start");
				end start;
			or
				accept count do
					put_line("count..." & i'img);
					i := i+1;
				end count;
			or
				accept stop;
					exit;
			end select;
		end loop;
	end ta;
begin
	ta.start;
	for i in 1..10 loop
		ta.count;
		delay 0.1;
	end loop;
	ta.stop;
	put_line("i=" & i'img);
end;
