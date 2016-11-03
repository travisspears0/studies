with ada.text_io, ada.integer_text_io;
use ada.text_io, ada.integer_text_io;

procedure types is
	subtype n is integer range 0..integer'last;
	type ty is array(0..9) of integer;--range 0..9;
	t1: ty;
	type grades is (a,b,c,d,e,f);
	g: grades := a;
	type person is record
		age: integer;
	end record;
	s: string(1..10) := (others=>' ');
begin
	for i in t1'range loop
		t1(i) := i*3;
		put_line("("& i'img &")" & t1(i)'img);
		if i > 6 then exit; end if;
	end loop;
	get(s(1..5));
end types;
