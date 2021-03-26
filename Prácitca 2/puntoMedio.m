function [t,y] = puntoMedio(f,ci,I,M)
%puntoMedio Algoritmo de Punto Medio para M dimensiones
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
    
    t = linspace(I(1), I(2), M+1);
    y = zeros(size(t));
    y(1) = ci;

    for i=1:length(t)
        t(i + 1) = t(i) + h;
        w = y(i) + h2 * f(t(i),y(i));
        y(i + 1) = y(i) + h * f(t(i) + h2,w);
    end
    t = t(1:end-1);
    y = y(1:end-1);
end

