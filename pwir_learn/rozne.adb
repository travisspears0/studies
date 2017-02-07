with ada.text_io,ada.integer_text_io;
use ada.text_io,ada.integer_text_io;

procedure rozne is

	function f(i:integer) return integer is
	begin
		if(i=0) then raise numeric_error; end if;
		if(i>10) then raise program_error; end if;
		if i>6 then return 2;
		elsif i>3 then return 1;
		else return 0; end if;
	end;

	function zero return integer is (0);

	type rgb is (red,green,blue);

	type r is record
		x,y: integer := 0;
	end record;
	re: r;

	arr: array(1..10) of integer := (others => 0);
	rgbarr : array(1..5) of rgb;
	x: integer;
	ok: boolean := true;
begin
	rgbarr := (1..3=>blue, 4..rgbarr'length => red);
	re.x := 2;
	--re.y := 8;
	put_line("record " & re.x'img & re.y'img);

	arr := (1..4=>3,9=>9,others=>1);
	for i in arr'range loop
		put(arr(i)'img);
	end loop;
	
	put_line("");
	for i in 1..rgbarr'length loop
		put(rgbarr(i)'img & " ");
	end loop;
	
	while ok = true loop
		put_line("number? (avoid "& zero'img &"!)");
		get(x);
		--put_line(f(character'pos(c)-48)'img);
		put_line(f(x)'img);
	end loop;
	exception
		when numeric_error => 
			put_line("x<0, error");
			ok:=false;
		when others =>
			put_line("unknown error");
			ok:=false;

	put_line("OVER");
end rozne;










