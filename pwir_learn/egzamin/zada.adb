with ada.text_io;
use ada.text_io;

procedure zada is
	type world is range 1..5;

	procedure fixworld(w:world) is
	begin
		delay 2.1;
	end;

	task wait is
		entry wa;
	end wait;
	
	task body wait is
	begin
		fixworld(2);
		select
			accept wa;
		or terminate;
		end select;
	end wait;
begin
	select
		wait.wa;
		put_line("fixed it!");
	or
		delay 2.0;
		put_line("didn't fix it!");
	end select;
	put_line("over");
end zada;
