function Img = wspolczynnik_krzaltu_obliczanie2(Img)

[YY, XX] = size(Img);
Img_Wsp = obliczWspolczynniki(Img);

for y = 1:YY
   for x = 1:XX
       piksel = Img(y,x);
       if (piksel ~= 0 && ~(Img_Wsp(piksel,1) > 0.50 && Img_Wsp(piksel,5) < 0.010 && Img_Wsp(piksel,2) < 0.9))
            Img(y,x) = 0;
       end
   end
end

end

