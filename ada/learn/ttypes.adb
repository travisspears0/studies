with ada.text_io, ada.strings.unbounded;
use ada.strings.unbounded;

procedure ttypes is
	use ada.text_io;

--types & subtypes
	type aget is range 1..99;
	type gendert is (male,female);

	type ms is delta 0.1 range 0.0..100.0;
	type mms is delta 0.01 range 0.0..100.0;
	
	type rate is range 1..10;
--record
	type person is record
		name: unbounded_string;
		gender: gendert;
		age: aget;
	end record;

--arrays
	matrix: array(1..5,1..5) of rate := (others => (others => 1));

--variables
	john: person := (to_unbounded_string("john"),male,22);

	timems: ms := 0.0;
	timemms: mms := 0.0;
begin
	
	put_line("hello " & to_string(john.name) & "," & john.age'img & " yrs old, he's " & john.gender'img);
	put_line("start");
	for i in 1..20 loop
		timems := timems + 0.15;
		timemms := timemms + 0.15;
		delay 0.01;
	end loop;
	put_line("stop with time" & timems'img & " and" & timemms'img);
end ttypes;
