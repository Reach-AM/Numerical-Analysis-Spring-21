function [error] = ErrorLocal(y,w)
%ERRORLOCAL Función para calcular los errores locales de una aproximación
%   
% Entrada:
%   y    Vector de los valores reales de una funcion
%   w    Vector de los valores númericos de la aproximación
%
% Salida:
%   error    Vector de errores locales

    l = length(y);
    error = zeros(1,l-1);
    for i = 2 : l
        error(i-1) = abs(y(i) - w(i) + w(i-1) - y(i-1));
    end
end

