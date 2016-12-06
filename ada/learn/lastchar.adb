with ada.text_io, ada.calendar;
use ada.text_io, ada.calendar;


procedure lastchar is
	timer_go: boolean := true;
	--main task
	task type ttype is
		entry getc(x:character);
		entry halt;
	end ttype;
	task body ttype is
		c: character := ' ';
	begin
		loop
			select
				accept getc(x:character) do
					c := x;
				end getc;
			or
				delay 1.0;
				if c/=' ' then
					put_line("accepted " & c'img);
					c:=' ';
				end if;
			or
				accept halt; exit;
			end select;
		end loop;
	end ttype;
	--timer
	task timer;
	task body timer is
		start_time:time;
		dur: duration;
	begin
		start_time := clock;
		loop
			if timer_go=false then exit; end if;
		end loop;
			dur := clock-start_time;
			put_line("fun lasted " & dur'img);
	end timer;

	--variables
	t: ttype;
	c: character := ' ';
begin
	loop
		get(c);
		if c='q' then exit; end if;
		t.getc(c);
	end loop;
	t.halt;
	timer_go:=false;
	put_line("over!");
end lastchar;
