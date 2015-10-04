function [ objetos ] = ponerYDibujarObjetos( )
%PONEROBJETOS Summary of this function goes here
%   Detailed explanation goes here

    % 1: globo, 2: bomba
    objetos={'','','',''};
    for i=1:4
        r = randi(2);
        if (r==1)
            o='globo';
        else
            o='bomba';
        end
        objetos{:,i}=o;
    end
end

