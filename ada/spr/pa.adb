with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

package body pa is
	procedure countdown(n:in integer) is
	begin
		if n < 1 then
			raise numeric_error;
		end if;
		for i in 1..n loop
			put(i'img);
		end loop;
	end countdown;
end pa;
