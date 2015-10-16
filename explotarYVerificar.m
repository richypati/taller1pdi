function [ puntos ] = explotarYVerificar( movimientoEnMask, handles)
%EXPLOTARYVERIFICAR Summary of this function goes here
    objetosEnMask =getappdata(0,'objetosEnMask');
    puntos=0;
    bien='bien.png';
    mal='mal.png';

    for i=1:4
        posicion = movimientoEnMask{:,i};
        objeto = objetosEnMask{:,i};
        if (strcmp(posicion,'si'))
            if(strcmp(objeto,'bomba'))
                puntos=-1;
                mostrarAciertoOError(i,mal,handles);
                return
            elseif(strcmp(objeto,'globo'))
                puntos=puntos+1;
                aciertos = getappdata(0,'aciertos') + puntos;
                setappdata(0,'aciertos',aciertos);
                objetosEnMask{:,i}='ninguno';
                setappdata(0,'objetosEnMask',objetosEnMask)
                mostrarAciertoOError(i,bien,handles);
            end
        end
    end

    aciertos = getappdata(0,'aciertos');
    nGlobos = getappdata(0,'nGlobos');
    if (aciertos==nGlobos)
       set(handles.txtMsj,'String','Bien Hecho!! Sigue explotando globos e.e');
       pause(2);
       ponerYDibujarObjetos(handles); 
    end
end

function mostrarAciertoOError(i, cambio, handles)
    switch i
        case 1
            axes(handles.oSI);
        case 2
            axes(handles.oSD);
        case 3
            axes(handles.oII);
        case 4
            axes(handles.oID);
    end
    imshow(cambio);
end