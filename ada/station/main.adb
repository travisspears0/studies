with Ada.Containers.Vectors, Ada.Command_Line, Ada.Exceptions, Ada.Text_IO, Ada.Strings.Unbounded, Sockets, station;
use Ada.Command_Line, Ada.Exceptions, Ada.Text_IO, Ada.Strings.Unbounded, Sockets;

--	COMMUNICATION
--		
--		SERVER
--			[id ssss] - sending unique id generated to single client, e.g. id 4, id 167 
--			[s 1:ssss 2:ssss 3:ssss...n:ssss] - 	sending station state of n slots where ssss stands for user id 
--								if it's free it passes 0 if it's taken it passess the id in ssss e.g.
--						s 1:45 2:3 3:101 4:8 5:0
--						s 1:0 2:2016 3:0
--			[t nn ssss] - sent when a slot nn has been taken by the driver with id ssss e.g. t 4 1, t 1 126
--			[f nn] - sent when slot nn has been freed
--			[nt] - sent to single user when they failed to take a slot
--		CLIENT
--			[p] - trying to park for
--			[l] - leaving station

procedure main is

	--types
	subtype id_string is string(1..4);

	--variables and constants
	slots: constant integer := 2;
	--the server will be logging state on the console every second or not
	log: constant boolean := false;
	taken_ids: array(1..9999) of boolean := (others => false);				--atomic

	package st is new station(slots);

	--returns first available uniqe id
	function get_id return integer is
	begin
		for i in taken_ids'range loop
			if taken_ids(i) = false then return i; end if;
		end loop;
		return -1;
	end get_id;

	package Client_Vectors is new Ada.Containers.Vectors
		(Element_Type => Socket_FD, Index_Type => Positive);
	All_Clients : Client_Vectors.Vector;
 
	procedure Write (S : String) is
		procedure Output (Position : Client_Vectors.Cursor) is
			Sock : Socket_FD := Client_Vectors.Element (Position);
		begin
			Put_Line (Sock, S);
		end Output;
	begin
		All_Clients.Iterate (Output'Access);
	end Write;

	task type Client_Task is
		entry Start (FD : Socket_FD);
	end Client_Task;

	task body Client_Task is
		Sock    : Socket_FD;
		Sock_ID : Positive;
		id: integer;
	begin
		select
			accept Start (FD : Socket_FD) do
				Sock := FD;
			end Start;
		or
			terminate;
		end select;

		All_Clients.Append (Sock);
		Sock_ID := All_Clients.Find_Index (Sock);
		id := get_id;
		if(id = -1) then raise connection_closed; end if;
		taken_ids(id) := true;
		put_line(sock, "id" & id'img);
		put_line("new user" & id'img);
		--sending state
		put_line(sock, to_string(st.get_state));

		loop
			declare
				Input : String := Get_Line (Sock);
				--time: integer := 0;
				slot_taken: integer;
			begin
				if input(1) = 'p' then
					--user tries to take a slot
					--time := integer'value((1=>input(3)))*10+integer'value((1=>input(4)));
					--put_line(id'img & " trying to take slot for period of " & time'img);
					slot_taken := st.take_slot(id);
					if(slot_taken /= -1) then
						write("t" & slot_taken'img & id'img);
						put_line(id'img & " parked on slot " & slot_taken'img);
					else
						put_line(sock, "nt");
						put_line(id'img & " failed to park");
					end if;
				elsif input(1) = 'l' then
					--user is leaving the station
					if(st.leave(id) = true) then
						write(to_string(st.get_state));
						put_line(id'img & " leaving station");
					end if;
				else
					put_line("unknown command " & input);
				end if;
				--Write (Input);
			end;
		end loop;
		exception
			when Connection_Closed =>
				Shutdown (Sock, Both);
				All_Clients.Delete (Sock_ID);
				if(id /= -1) then taken_ids(id) := false; end if;
                                if(st.leave(id) = true) then
                                	write(to_string(st.get_state));
                                	put_line(id'img & " leaving station");
                                end if;
				put_line("user" & id'img & " left");
	end Client_Task;
 
	Accepting_Socket : Socket_FD;
	Incoming_Socket  : Socket_FD;
 
	type Client_Access is access Client_Task;
	Dummy : Client_Access;

	port: constant positive := 2703;

	task type print_state;
	task body print_state is
		i:float:=0.001;
	begin
		loop
			put_line(to_string(st.get_state));
			delay 1.0;
			i := i+0.001;
		end loop;
	end print_state;

	type print_state_access is access all print_state;
	ps : print_state_access;

	begin
		Socket (Accepting_Socket, PF_INET, SOCK_STREAM);
		setsockopt (Accepting_Socket, SOL_SOCKET, SO_REUSEADDR, 1);
		Bind (Accepting_Socket, port);
		listen (Accepting_Socket);						--do osobnego zadania i z klawiatury abort

		if(log = true) then
			ps := new print_state;
		end if;

		loop
			Accept_Socket (Accepting_Socket, Incoming_Socket);
			dummy := new Client_Task;
		Dummy.Start (Incoming_Socket);
		end loop;
end main;
