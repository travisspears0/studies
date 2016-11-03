with pak_sort,Ada.Text_IO, Ada.Float_Text_IO;
use pak_sort,Ada.Text_IO, Ada.Float_Text_IO;

procedure scal is
	w:wektor(1..4) := (others => 0);
	w1,w2:wektor(1..2) := (others => 0);
begin
	w1(1) := 3;
	w1(2) := 5;
	w2(1) := 2;
	w2(2) := 4;
	put_wektor(w1);
	put_wektor(w2);
	scalaj2(w1,w2,w);
	put_wektor(w);
end scal;
