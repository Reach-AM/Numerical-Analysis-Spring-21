close all; clear all; clc; format long;

f = @(t,y) -2 * y + 4 * t;
y = @(t) (3 - 2 * 0 + 1) * exp( - 2 * t) + 2 * t -1;
I = [0,1];
y0 = 3;

% a)
[t1, y1] = eulerExplicito(f,y0,I,10);

tablaDeValores = table([0:10]',y1',y(t1)','VariableNames',{'k','wk','real'});
disp(tablaDeValores)

% b)
error = abs(y(1) - y1(11));
disp('Error global en t=1')
disp(error)

h = @(k) 0.1 * 2 .^ (-k);
k = [0 1 2 3 4 5];
hk = h(k);
[t00, y00] = eulerExplicito(f,y0,I,1/h(0));
[t11, y11] = eulerExplicito(f,y0,I,1/h(1));
[t22, y22] = eulerExplicito(f,y0,I,1/h(2));
[t33, y33] = eulerExplicito(f,y0,I,1/h(3));
[t44, y44] = eulerExplicito(f,y0,I,1/h(4));
[t55, y55] = eulerExplicito(f,y0,I,1/h(5));



errorGlobal(1) = abs(y00(end) - y(1));
errorGlobal(2) = abs(y11(end) - y(1));
errorGlobal(3) = abs(y22(end) - y(1));
errorGlobal(4) = abs(y33(end) - y(1));
errorGlobal(5) = abs(y44(end) - y(1));
errorGlobal(6) = abs(y55(end) - y(1));

plot(log(hk),log(errorGlobal));


EL0 = ErrorLocal(t00, y00);
EL1 = ErrorLocal(t11, y11);
EL2 = ErrorLocal(t22, y22);
EL3 = ErrorLocal(t33, y33);
EL4 = ErrorLocal(t44, y44);
EL5 = ErrorLocal(t55, y55);

MaxEL = [max(EL0);max(EL1);max(EL2);max(EL3);max(EL4);max(EL5)];

eoc = zeros(1,length(MaxEL)-1);
for i = 2 : length(MaxEL)
    eoc(i-1) = log(MaxEL(i)/MaxEL(i-1))/log(hk(i)/hk(i-1));
end

tablaDeErrores = table([1:5]',hk(2:end)',MaxEL(2:end),eoc','VariableNames',{'k','hk','Máximo de los errores locales','eoc'});
disp(tablaDeErrores)