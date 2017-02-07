with ada.text_io;
use ada.text_io;

procedure paracount is

	n: float := 0.0;

	task type licz;

	task body licz is
	begin
		for i in 1..100 loop
			n := n+0.001;
			delay 0.01;
		end loop;
		put_line(n'img);
	end licz;
	
	c:character;
	type licz_pt is access licz;
	lpt: licz_pt;
begin
	loop
		get(c);
		if c = 'q' then exit; end if;
		lpt := new licz;
	end loop;
end paracount;
