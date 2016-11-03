-- losd4

with Ada.Text_IO, Ada.Numerics.Discrete_Random;
use Ada.Text_IO;

procedure Losd4 is
  
  subtype Siema is Integer range 1..3;
  package Los_Liczby is new Ada.Numerics.Discrete_Random(Siema);
  use Los_Liczby;
  
  Wart : Integer := 0;
  Gen: Generator; -- z pakietu Los_Znak 
begin
  Reset(Gen);
  for I in 1..20 loop
    Wart := Random(Gen);
    Put_Line("Wylosowalem: >" & Wart'Img & "<");
  end loop;
end Losd4; 