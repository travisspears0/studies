with ada.text_io;
use ada.text_io;

package body buf is 

	elements: array(1..size) of eltype;	
	count: integer := 0;

	procedure push(e: eltype; b: out boolean) is
	begin
		elements(count+1) := e;
		count := count+1;
		put_line("pushed ");
		b:=true;
		exception
			when constraint_error =>
				put_line("[push]out of range");
				b:=false;
	end push;

	procedure pop(e: out eltype; b: out boolean) is
	begin
		e := elements(count);
		count := count-1;
		put_line("popped ");
		b:=true;
		exception
			when constraint_error =>
				put_line("[pop]out of range");
				b := false;
	end pop;

end buf;
