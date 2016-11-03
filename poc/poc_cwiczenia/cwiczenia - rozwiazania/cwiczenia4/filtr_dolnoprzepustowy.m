function output = filtr_dolnoprzepustowy(Img,fspecial_type,conv2_shape)

output = uint8(conv2(Img,fspecial(fspecial_type),conv2_shape));


end

