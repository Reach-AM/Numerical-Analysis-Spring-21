close all; clear all; clc; format long;

%Funciones
f = @(t,y) y - t .^ 2 +1;
y = @(t) - 1 / 2 * exp(t) + (t + 1) .^ 2;
%Parametros
y0 = 0.5;
I = [0,2];
h = [50, 100, 200];
hk = [1/h(1), 1/h(2), 1/h(3)];
%REAL
Real = y(I(2));

%Euler Explícito
[eulerT50,eulerY50] = eulerExplicito(f,y0,I,I(2)*h(1));
[eulerT100,eulerY100] = eulerExplicito(f,y0,I,I(2)*h(2));
[eulerT200,eulerY200] = eulerExplicito(f,y0,I,I(2)*h(3));
%Orden de Euler
EEuler(1) = abs(eulerY50(end)-Real);
EEuler(2) = abs(eulerY100(end)-Real);
EEuler(3) = abs(eulerY200(end)-Real);

%Trapecio Explícito
[trapecioT50,trapecioY50] = trapecioExplicito(f,y0,I,I(2)*h(1));
[trapecioT100,trapecioY100] = trapecioExplicito(f,y0,I,I(2)*h(2));
[trapecioT200,trapecioY200] = trapecioExplicito(f,y0,I,I(2)*h(3));
%Orden de Trapecio
ETrapecio(1) = abs(trapecioY50(end)-Real);
ETrapecio(2) = abs(trapecioY100(end)-Real);
ETrapecio(3) = abs(trapecioY200(end)-Real);

%Punto Medio
[pmT50,pmY50] = puntoMedio(f,y0,I,I(2)*h(1));
[pmT100,pmY100] = puntoMedio(f,y0,I,I(2)*h(2));
[pmT200,pmY200] = puntoMedio(f,y0,I,I(2)*h(3));
%Orden de Punto Medio
EPM(1) = abs(pmY50(end)-Real);
EPM(2) = abs(pmY100(end)-Real);
EPM(3) = abs(pmY200(end)-Real);

%RK4
[rk4T50,rk4Y50] = RK4(f,y0,I,I(2)*h(1));
[rk4T100,rk4Y100] = RK4(f,y0,I,I(2)*h(2));
[rk4T200,rk4Y200] = RK4(f,y0,I,I(2)*h(3));
%Orden de Punto Medio
ERK4(1) = abs(rk4Y50(end)-Real);
ERK4(2) = abs(rk4Y100(end)-Real);
ERK4(3) = abs(rk4Y200(end)-Real);

% %Gráficas log(Error)-log(h)
% F1 = figure('Name','log(Error)-log(h)','NumberTitle','off');
% hold on
% daspect([1 1 1])
% axis([-10 0 -25 -0])
% grid on
% plot(log(hk),log(EEuler),'Color',[.5 .2 1],'LineWidth',2.5);
% plot(log(hk),log(ETrapecio),'Color',[1 0 0],'LineWidth',2.5);
% plot(log(hk),log(EPM),'Color',[.9 .5 .1],'LineWidth',2.5);
% plot(log(hk),log(ERK4),'Color',[0 0 1],'LineWidth',2.5);
% legend({'Euler','Punto Medio','Trapecio','RK4'},'Location','northwest')

%Gráficas log(Error)-log(h) (x4)
tiledlayout(2,2)

ax1 = nexttile;
plot(log(hk),log(EEuler),'Color',[.5 .2 1],'LineWidth',2.5);
title(ax1,'Euler')
grid on
axis([-5.5 -3.5 -4.5 -2.5])

ax2 = nexttile;
plot(log(hk),log(ETrapecio),'Color',[1 0 0],'LineWidth',2.5);
title(ax2,'Trapecio')
axis([-5.5 -3.5 -10.5 -6.5])
grid on

ax3 = nexttile;
plot(log(hk),log(EPM),'Color',[.9 .5 .1],'LineWidth',2.5);
title(ax3,'Punto Medio')
axis([-5.5 -3.5 -12.2 -8.2])
grid on

ax4 = nexttile;
plot(log(hk),log(ERK4),'Color',[0 0 1],'LineWidth',2.5);
title(ax4,'Runge-Kutta 4')
axis([-5.5 -3.5 -25 -17])
grid on