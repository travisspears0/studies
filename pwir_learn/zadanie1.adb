with ada.text_io;
use ada.text_io;

procedure zadanie1 is
	task type tsk is
		entry msg(message: string);
	end tsk;
	task body tsk is
	begin
		select
			accept msg(message:String) do
				put_line(message);
			end msg;
		end select;
	end;

	tsks: array(1..100) of tsk;
begin
	for i in tsks'range loop
		tsks(i).msg("task " & i'img);
	end loop;
end zadanie1;
