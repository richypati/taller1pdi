function [ s ] = obtenerMasks(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    %% Cargando mascaras
    si=imread('mask_si.bmp'); % Superior Izquierda
    sd=imread('mask_sd.bmp'); % Superior Derecha
    ii=imread('mask_ii.bmp'); % Inferior Izquierda
    id=imread('mask_id.bmp'); % Inferior Derecha

    %% Redimensionando imagen
    si=uint8(si);
    sd=uint8(sd);
    ii=uint8(ii);
    id=uint8(id);

    % Para PC Ricardo
    si=imresize(si,[480,640]);
    sd=imresize(sd,[480,640]);
    ii=imresize(ii,[480,640]);
    id=imresize(id,[480,640]);

    % Para Mac JuanPa
    % si=imresize(si,[720,1280]);
    % sd=imresize(sd,[720,1280]);
    % ii=imresize(ii,[720,1280]);
    % id=imresize(id,[720,1280]);

    s={si,sd,ii,id};
    
end

