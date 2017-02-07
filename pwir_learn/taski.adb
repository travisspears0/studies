with ada.text_io, ada.calendar;
use ada.text_io, ada.calendar;

procedure taski is

	d: constant duration := 0.5;

	go: boolean := true;
	task t is entry e; end t;
	task body t is
	begin
		loop
			select
				accept e; put(".");delay d;
			or terminate;
			end select;
		end loop;
	end;
	c: character;

	task lt;
	task body lt is
	begin
		while go=true loop
			t.e;
		end loop;
	end;
begin
	get(c);
	go := false;
	put_line("OVER");
end taski;










