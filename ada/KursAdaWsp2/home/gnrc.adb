with ada.text_io, buf;
use ada.text_io;

procedure gnrc is

	size: integer := 4;

	package pgi is new buf(size,integer);
	--package pgc is new buf(5,character);

	task putter;
	task popper;

	puttergo: boolean := true;
	poppergo: boolean := true;

	task body putter is
	i:integer := 1;
	begin
		while(puttergo) loop
			pgi.push(i);
			delay 0.1;
		end loop;
	end putter;

	task body popper is
		i:integer;
	begin
		while(poppergo) loop
			pgi.pop(i);
			delay 0.2;
		end loop;
	end popper;
	
	

begin
	delay 1.0;
	puttergo := false;
	delay (0.2)*(pgi.getCount+1);	--tu dziala ok
	--delay (0.2)*(pgi.getCount+2);	--w tym przypadku zawiesza sie w oczekiwaniu na pgi.pop
	--czy da sie przerwac oczekiwanie w protected?
	poppergo := false;
end;
