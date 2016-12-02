with ada.text_io;
use ada.text_io;

procedure pts is
	--type t is access integer;
	a: aliased integer := 1;
	i: integer := 2;
	--ta: t := new integer;
begin
	put_line(a'img&"/"&i'img);
	i:=a;
	put_line(a'img&"/"&i'img);
	--ta.all := 9;
	--put_line(""& ta.all'img);
end pts;
