with ada.text_io;
use ada.text_io;

procedure tasking is
	task type t is
	--	entry setid(idd: in integer);
		entry count(n: in integer);
	end t;

	task body t is
	id:integer:=-1;
	i:integer:=0;
	begin
	--	select
	--		accept setid(idd: in integer) do
	--			id:=idd;
	--			put_line("id set to " & id'img);
	--		end setid;
	--	or
			accept count(n: in integer) do
				--if(id<0) then raise numeric_error; end if;
				i := n;
				put_line("");
				loop
					put_line("["& id'img &"]counting: " & i'img);
					i:=i-1;
					if(i<0) then exit; end if;
					delay 0.2;
				end loop;
			end count;
	--	end select;
        end t;
	

	ts : t;
	tss:array(1..5) of t;
begin
	put("...");
	--ts.setid(1);
	--ts.count(5);
	for i in tss'range loop
		--tss(i).setid(i);
		tss(i).count(5);
	end loop;
end tasking;
