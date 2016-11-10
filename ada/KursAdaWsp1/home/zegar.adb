with ada.text_io, ada.calendar;
use ada.text_io, ada.calendar;

procedure zegar is
	d: duration;
	task  t is
		entry zeruj;
		entry zegar;
		entry halt;
	end t;
	
	task body t is
		t: time;
	begin
		loop
			select
				accept zeruj do
					put_line("reset");
					t := clock;
				end zeruj;
			or
				accept zegar do
					d := clock - t;
					put_line(d'img);
				end zegar;
			or
				accept halt do
					put_line("halt");
					return;
				end halt;
				exit;
			end select;
		end loop;
	end t;
begin
	t.zeruj;
	for i in 1..10 loop
		if i mod 5 = 0 then
			t.zeruj;
		end if;
		delay 0.2;
		t.zegar;
	end loop;
	t.halt;
	put_line("result: " & d'img);
end zegar;
