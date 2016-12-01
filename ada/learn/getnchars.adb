with ada.text_io;
use ada.text_io;

procedure getnchars is
	size: constant integer := 5;
	type chart is array(1..size) of character;

	procedure printchart(arr: chart) is
	begin
		for i in 1..size loop
                        if(arr(i)=' ') then
                                exit;   
                        end if; 
                        put(arr(i));
                end loop;
                put_line("");
	end;

	sign: character;
	counter: integer := 0;
	data: chart := (others => ' ');
	datacache: chart := (others => ' ');
begin
	loop
		get(sign);
		if(sign = '*') then
			if(counter >= 1) then
				data(counter) := ' ';
				counter := counter-1;
			end if;
		elsif(counter < size) then
			counter := counter+1;
			data(counter) := sign;
		end if;
		if(data/=datacache) then
			printchart(data);
		end if;
		datacache := data;
	end loop;
end getnchars;
