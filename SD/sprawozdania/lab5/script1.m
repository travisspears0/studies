%setup
clearvars;
close all;
clc;
%
eps = .1;
fxtArr = [];
xtArr = [];
for i=1:50
    xtArr(i) = i/10;
    fxtArr(i) = f1(xtArr(i),eps);
end

figure;
plot(xtArr,fxtArr);


