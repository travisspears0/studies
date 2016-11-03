function Img = wspolczynnik_krzaltu_obliczanie1(Img)

[YY, XX] = size(Img);
Img_Wsp = obliczWspolczynniki(Img);

for y = 1:YY
   for x = 1:XX
       piksel = Img(y,x);
       if (piksel ~= 0 && ~(Img_Wsp(piksel,2) > 0.33 && Img_Wsp(piksel,2) < 0.66))
            Img(y,x) = 0;
       end
   end
end

end

