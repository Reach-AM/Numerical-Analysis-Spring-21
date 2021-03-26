function [t, y] = RK3(f, ci, I, M)
%RK3   Algoritmo de Runge-Kutta 3 para M dimensiones
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
    h4 = h/4;
    h6 = h/6;
    
    t = linspace(I(1), I(2), M+1);

    y(:,1) = ci;

    for i = 1:M
        k1 = f(t(i), y(:,i));
        k2 = f(t(i) + h, y(:,i) + h*k1);
        k3 = f(t(i) + h2, y(:,i) + h4*k1 + h4*k2);

        y(:,i+1) = y(:,i) + h6*(k1+k2+4*k3);
    end
end
