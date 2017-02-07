with ada.text_io, ada.calendar;
use ada.text_io, ada.calendar;

procedure delays is

	d: constant duration := 0.5;

	task a;
	task b;
	task t is entry e; entry q; end t;

	go: boolean := true;

	task body t is
	begin
		loop
			select
				accept e; delay d*0.9;
			or
				accept q; exit;
			end select;
		end loop;
	end;

	task body a is
	begin
		while go=true loop
			delay d;
			put_line(" a");
			t.e;
		end loop;
	end a;

	task body b is
		next : time := clock;
	begin
		while go=true loop
			delay until next;
			put_line("b");
			t.e;
			next := next+d;
		end loop;
	end b;
	c: character;
begin
	get(c);
	go := false;
	t.q;
	put_line("OVER");
end delays;










