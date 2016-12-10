with ada.text_io, ada.numerics.discrete_random,dworzec;
use ada.text_io;

procedure main is

	cities: constant integer := 4;

	subtype rndcitytype is integer range 1..cities;
	subtype rndwaittype is integer range 1..3;

        package d is new dworzec(cities);
	--
	task action_receiver is
		entry get_action(action:character);
		entry quit;
	end action_receiver; 
	task body action_receiver is
		current_action: character := ' ';
		package rndpackagewait is new ada.numerics.discrete_random(rndwaittype);
		package rndpackagecity is new ada.numerics.discrete_random(rndcitytype);
		use rndpackagewait, rndpackagecity;
		rndw: rndpackagewait.generator;
		rndc: rndpackagecity.generator;
	begin
		reset(rndw);
		reset(rndc);
		d.print_actions;
		loop
			select
				accept get_action(action: character) do
					current_action := action;
				end get_action;
			or
				delay 0.2;
				if current_action /= ' ' then
					case current_action is
						when 'a' => d.take_slot(duration(2+random(rndw)), random(rndc));
						when 's' => d.print_state;
						when '?' => d.print_actions;
						when others => put_line("unknown action "& current_action &", ignored");
					end case;
					current_action := ' ';
				end if;
			or
				accept quit; exit;
			end select;
		end loop;
	end action_receiver;
	
	action: character := ' ';

begin
	loop
		get(action);
		action_receiver.get_action(action);
		if action = 'c' then exit; end if;
		
	end loop;
	action_receiver.quit;
	put_line("closing station");
end main;
