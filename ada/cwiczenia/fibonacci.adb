with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure fibonacci is
	n:integer:=0;
	function fib(i:integer) return integer is (if i<2 then i else fib(i-1)+fib(i-2));
begin
	put_line("ktory element ciagu obliczyc?");
	get(n);
	if(n<0) then raise numeric_error; end if;
	put(n'img & " element ciagu wynosi: ");
	put(fib(n)'img);
end fibonacci;
