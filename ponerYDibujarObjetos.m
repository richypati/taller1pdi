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
    
    setappdata(0,'oSI',objetos{:,1});
    setappdata(0,'oSD',objetos{:,2});
    setappdata(0,'oII',objetos{:,3});
    setappdata(0,'oID',objetos{:,4});
end