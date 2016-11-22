with ada.text_io;
use ada.text_io;

package body buf is 

	type eltypearr is array(integer range<>) of eltype;

	protected buf is
                entry wstaw(x: eltype);
                entry wez(x: out eltype);
		function getCount return integer;
                private
                        count:integer := 0;--info ile jest elementow
                        elements: eltypearr(1..size);
        end buf;
        
        protected body buf is
                entry wstaw(x: eltype) when count<elements'length is begin
                        put_line("    [buf]wstawianie " & count'img);
                        count := count+1;
                        elements(count) := x;
                end wstaw;
                entry wez(x: out eltype) when count>0 is begin
                        put_line("    [buf]branie " & count'img);
                        x := elements(count);
                        count := count-1;
                end wez;
		function getCount return integer is (count);
        end buf;

	procedure push(e: eltype) is
	begin
		buf.wstaw(e);
	end push;

	procedure pop(e: out eltype) is
	begin
		buf.wez(e);
	end pop;

	function getCount return integer is (buf.getCount);

end buf;
