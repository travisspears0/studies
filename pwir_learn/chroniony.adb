with ada.text_io;
use ada.text_io;

procedure chroniony is

	protected p is
		entry e(d: duration;i:in out integer);
	private
		b: boolean := true;
	end p;
	protected body p is
		entry e(d: duration;i:in out integer) when b=true is
		begin
			b:=false;
			i:=i+1;
			delay d;
			b:=true;
		end e;
	end p;
	go:boolean := true;
	task type a;
	task body a is
		x:integer := 0;
	begin
		while go=true loop
			delay 0.2;
			put_line("a " & x'img );
			p.e(0.5,x);
		end loop;
	end a;
	arr: array(1..5) of a;
	c:character;
begin
	get(c);
	go:=false;
	put_line("OVER");
end chroniony;










