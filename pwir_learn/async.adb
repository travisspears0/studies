with ada.text_io;
use ada.text_io;

procedure async is

	task type t;
	task body t is
		i:integer:=0;
	begin
		loop
			put_line("task loop " & i'img);
			if i>6 then exit;end if;
			i:= i+1;
			delay 0.1 * i;
		end loop;
	end;

	type tt is access t;
	ta: array(1..3) of tt;
begin
	for i in ta'range loop
		ta(i) := new t;
	end loop;
	put_line("end main");
end async;










