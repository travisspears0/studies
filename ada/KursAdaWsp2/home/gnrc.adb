with ada.text_io, buf;
use ada.text_io;

procedure gnrc is
	package pgi is new buf(5,integer);
	package pgc is new buf(5,character);

	x:integer;
	
	task putter;
	task popper;

	task body putter is
		i:integer := 1;
		b:boolean;
		begin
			loop
				pgi.push(i,b);
				if(b=false) then  delay 0.5; end if;
			end loop;
	end putter;

	task body popper is
		i:integer;
		b:boolean;
	begin
		loop
			pgi.pop(i,b);
			if(b=false) then delay 0.3; end if;
		end loop;
	end popper;
	
	

begin
	put("");
end;
