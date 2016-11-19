with ada.text_io;
use ada.text_io;

package body buf is 

	elements: array(1..size) of eltype;	

	procedure push(x: eltype) is
	begin
		put("");
	end push;

	procedure pop(x: out eltype) is
	begin
		put("");
	end pop;
end buf;
