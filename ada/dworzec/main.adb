with ada.text_io, ada.numerics.discrete_random,dworzec;
use ada.text_io;

procedure main is

	subtype rndtype is integer range 1..3;

        type cities is (
                a,b,c,e);
                --alwiernia,
                --andrychow,
                --chrzanow,
                --dobczyce,
                --gorlice,
                --muszyna,
                --myslenice,
                --niepolomice,
                --tymbark,
                --zakopane,
                --rytro,
                --rabka,
                --jordanow,
                --tarnow);

        package d is new dworzec(2);
	--
	task action_receiver is
		entry get_action(action:character);
		entry quit;
	end action_receiver; 
	task body action_receiver is
		current_action: character := ' ';
		package rndpackage is new ada.numerics.discrete_random(rndtype);
		use rndpackage;
		rnd: generator;
	begin
		reset(rnd);
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
						when 'a' => d.take_slot(duration(2+random(rnd)));
						when 's' => d.print_state;
						when '?' => d.print_actions;
						when others => put_line("unknown action, ignored");
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
		if action = 'q' then exit; end if;
		
	end loop;
	action_receiver.quit;
	put_line("over!");
end main;
