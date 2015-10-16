function [ objetos ] = ponerYDibujarObjetos( handles )
%PONEROBJETOS Summary of this function goes here
%   Detailed explanation goes here

    nGlobos=0;
    % 1: globo, 2: bomba
    objetos={'','','',''};
    for i=1:4
        r = randi(2);
        if (r==1)
            o='globo';
            nGlobos=nGlobos+1;
        else
            o='bomba';
        end
        objetos{:,i}=o;
    end
    
    % Guardando en variables globales
    setappdata(0,'nGlobos',nGlobos);
    setappdata(0,'aciertos',0);
    setappdata(0,'objetosEnMask',objetos);
    setappdata(0,'oSI',objetos{:,1});
    setappdata(0,'oSD',objetos{:,2});
    setappdata(0,'oII',objetos{:,3});
    setappdata(0,'oID',objetos{:,4});
    
    axes(handles.oSI);
    oSI=getappdata(0,'oSI');
    imshow(strcat(oSI,'.png'));
    
    axes(handles.oSD);
    oSD=getappdata(0,'oSD');
    imshow(strcat(oSD,'.png'));
    
    axes(handles.oII);
    oII=getappdata(0,'oII');
    imshow(strcat(oII,'.png'));
    
    axes(handles.oID);
    oID=getappdata(0,'oID');
    imshow(strcat(oID,'.png'));   

end