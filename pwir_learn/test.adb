with ada.text_io;
use ada.text_io;

procedure test is
	function f(i: in out integer) return integer is
	begin
		i:= i+1;
		return 0;
	end f;
	a: integer := 6;
begin
--	a := f(a);
	put(f(a)'img &","& a'img);
end test;
