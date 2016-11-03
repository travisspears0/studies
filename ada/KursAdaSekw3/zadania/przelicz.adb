with Ada.Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO;

procedure przelicz is
	we: Float := 0.0;
	--f: Float := 0.0;
	wy: Float := 0.0;
	option: string:= " " ;
	function f2c(f:Float) return Float is
	begin
		return 5.0/9.0 * (f - 32.0);
	end f2c;
	function c2f(c:float) return float is (5.0/9.0 * c + 32.0);
begin
	put("co chcesz podac? [c/f]");
	get(option);
	while(option(1)'img /= "'f'" and option(1)'img /= "'c'") loop
		put_line("what...? " & option(1)'img);
		get(option);
	end loop;
	put_line("przeliczanie z " & option & "... podaj wartosc do przeliczenia:");
	get(we);
	if option(1)'img = "'f'" then 
		wy := f2c(we);
	else
		wy := c2f(we);
	end if;
	put("wynik = ");-- & wy'img);--4,2,0
	put(wy,4,2,0);
end przelicz;
