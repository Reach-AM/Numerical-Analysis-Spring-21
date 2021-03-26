close all; clear all; clc; format long;

f = @(t,y) -2 * y + 4 * t;
y = @(t) (3 - 2*0 + 1)*exp(-2*t) + 2*t - 1;
I = [0,1];
y0 = 3;

% Trapecio 1/10:
[tT10,yT10] = trapecioExplicito(f,y0,I,10);
ET10 = (abs(yT10-y(tT10)))';

% Trapecio 1/20
[tT20,yT20] = trapecioExplicito(f,y0,I,20);
ET20 = (abs(yT20-y(tT20)))';

% RK4 1/10
[tRK4,yRK4] = RK4(f,y0,I,10);
ERK4 = (abs(yRK4-y(tRK4)))';

tablaDeErrores = table([ET10(end);10],[ET20(end);20],[ERK4(end);10],...
    'VariableNames',{'Error Trapecio (h1)','Error Trapecio (h2)','Error RK4 (h1)'},...
    'RowNames',{'Error (global en t = 1)','número de estados'});

disp(tablaDeErrores)