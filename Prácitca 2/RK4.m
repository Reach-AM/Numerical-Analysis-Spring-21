function [t, y] = RK4(f, ci, I, M)
%RK4   Algoritmo de Runge-Kutta 4 para M dimensiones
%
% Entrada:
%   f @(t, x)    tiene que depender explicitamente del tiempo
%   ci    y(0)
%   I    intervalo
%   M    número de puntos
%
% Salida:
%   t    Vector de tiempo 
%   y    Vector de resultados
%
% *nota:
%   h = (I(2) - I(1))/M

    h = (I(2) - I(1))/M;
    h2 = h/2;
    h6 = h/6;
    
    t = linspace(I(1), I(2), M+1);
    t2 = t + h2;

    y(:,1) = ci;

    for i = 1:M
        k1 = f(t(i), y(:,i));
        k2 = f(t2(i), y(:,i)+h2*k1);
        k3 = f(t2(i), y(:,i)+h2*k2);
        k4 = f(t(i+1), y(:,i)+h*k3);
        
        y(:,i+1) = y(:,i) + h6*(k1+2*(k2+k3)+k4);
    end
end