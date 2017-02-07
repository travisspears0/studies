with ada.text_io, ada.calendar;
use ada.text_io, ada.calendar;

procedure bla is

procedure blabla is
begin
	put_line("blabla begin");
	delay 0.4;
	put_line("blabla end");
end blabla;

next: time;

begin
	next := clock;
	loop
		next := next + 0.5;
		blabla;
		delay until next;
	end loop;

end bla;
