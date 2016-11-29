with ada.text_io;
use ada.text_io;

procedure gnrc is
	generic
		type t is private;
		initial_value: t;
	package p is
		procedure set(a: t);
		procedure get(a: out t);
	end p;
	package body p is
		val: t := initial_value;
		procedure set(a: t) is
		begin
			val := a;
		end set;
		procedure get(a: out t) is
		begin
			a := val;
		end get;
	end p;

	package pi is new p(integer,1);
	package pc is new p(character,'a');
	i: integer;
	c:character;
begin
	pi.set(12);
	pi.get(i);
	put_line("get: " & i'img);

	--pc.set('s');
	pc.get(c);
	put_line("get: " & c'img);
end gnrc;
