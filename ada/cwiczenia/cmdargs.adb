with ada.text_io, ada.integer_text_io, ada.command_line, gnat.os_lib;
use ada.text_io, ada.integer_text_io, ada.command_line, gnat.os_lib;

procedure cmdargs is
	success: boolean;
	args : argument_list(1..1);--argument_count-1);
	program: aliased string := argument(1);
	arg: aliased string := argument(2);
begin
	if argument_count < 1 then
		put_line("expected program name and arguments...");
		raise program_error;
	end if;
--	for i in 2..argument_count loop
--		arg := argument(i);
--		args(i-1) := arg'unchecked_access;
--	end loop;
	args(1) := arg'unchecked_access;
	spawn(program, args, success);
	put_line(success'img);
end;
