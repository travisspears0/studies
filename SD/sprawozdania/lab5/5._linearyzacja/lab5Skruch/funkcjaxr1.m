function yp = funkcjaxr1(t, y) %system zlinearyzowany dla zerowego pkt równowagi xr1 = (0,0) 
%przydzielenie pamiêci:
yp = zeros(size(y));
yp(1) = y(2);
yp(2) = -2*y(1)-y(2);