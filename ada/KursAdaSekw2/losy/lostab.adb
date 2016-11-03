-- lostab

with Ada.Text_IO, Ada.Numerics.Float_Random;
use Ada.Text_IO, Ada.Numerics.Float_Random;

procedure LosTab is
  index: Integer := 0;
  Wart, Suma, x : Float := 0.0;
  R   : constant Positive := 12;
  Tab : array(1..R) of Float := (others => 0.0);
  Gen : Generator; -- z pakietu Ada.Numerics.Float_Random 
begin
  Reset(Gen);
  -- losowanie elementow z zapisem do tablicy
  for i in 1..R loop 
	x := random(gen);
	index := i;
	if i > 1 then
	 	for j in 1..i-1 loop
			if tab(j)>x then 
				index:= j;
				exit;
			end if;
		end loop;
		for j in reverse index..i-1 loop
			tab(j+1) := tab(j);
		end loop;
	end if;
	tab(index) := x;
  end loop;
  for  I in Tab'Range loop
    Put_Line("Tab(" & I'Img & ")=" & Tab(I)'Img);-- & " last=" & tab(Tab'last)'img);
  end loop;

end LosTab;    
