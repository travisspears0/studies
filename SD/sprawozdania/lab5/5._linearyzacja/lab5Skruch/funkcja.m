function yp = funkcja(t, y)
%przydzielenie pamiêci:
yp = zeros(size(y));
yp(1) = y(2);
yp(2) = -2*y(1)-3*y(1)^2-y(2);
