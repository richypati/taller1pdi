function [ puntos ] = explotarYVerificar( objetosEnMask, movimientoEnMask)
%EXPLOTARYVERIFICAR Summary of this function goes here
    puntos=0;
    for i=1:4
        posicion = movimientoEnMask{:,i};
        objeto = objetosEnMask{:,i};
        if (strcmp(posicion,'si'))
            if(strcmp(objeto,'bomba'))
                puntos=-1;
                return
            else
                puntos=puntos+1;
            end
        end
    end       
            
end

