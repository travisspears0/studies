with ada.text_io;
use ada.text_io;

procedure zadanie3 is

	type world is range 1..10;

	procedure fixworld(w:world) is
		c:character := ' ';
		state: integer := 0;
		task t is
			entry f;
		end t;
		task body t is
		begin
			select
				accept f;
				put("fixed");
				state := 1;
			or
				delay 1.0;
				state := 2;
				put_line("hasn't fixed it");
			end select;
		end;
	begin
		put_line("should i fix the world?");
		delay 2.0;
		if state = 0 then t.f; end if;
	end;

begin
	fixworld(5);
end zadanie3;










