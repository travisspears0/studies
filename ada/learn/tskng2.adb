with ada.text_io;
use ada.text_io;

procedure tskng2 is
	go: boolean := true;
	task t;
	task body t is
	begin
		while(go) loop
			put_line(".");
			delay 0.1;
		end loop;
	end;
begin
	delay 1.0;
	go:= false;
end tskng2;
