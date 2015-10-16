function [ mask ] = detectaMovimientoEnMask( snap, masks )
%DETECTAMOVIMIENTOENMASK Funcion que permite verificar si hay movimiento en
%alguna de las mask
   
    maskSSI='no';
    maskSSD='no';
    maskSII='no';
    maskSID='no';

    % Validando con ROJO
   
    % Se podria voltea la imagen para que sea intuitivo el juego

    % Extrayendo capa roja
    snap = imsubtract(snap(:,:,1),rgb2gray(snap));
    
    % Disminuyendo ruido
    si = medfilt2(snap, [3,3]);
    
    % Binarizando (Hay que redefinir el umbral cada vez que se ejecuta)
    snap = im2bw(snap, 0.2);
    
    % Eliminando elementos pequenos (Redefinir el tamano minimo)
    snap = bwareaopen(snap, 300);
    
    snap=uint8(snap);
    
    % fusionar con mascaras
    si=masks{:,1};
    sd=masks{:,2};
    ii=masks{:,3};
    id=masks{:,4};
    
    fsi = si.*snap;
    fsd = sd.*snap;
    fii = ii.*snap;
    fid = id.*snap;
    
    % Hay que sacar sumas de si, sd, ii, id
    % Si esas sumas es mayor a TAL NUMERO (ENSAYAR PRIMERO CONCERO) entonces hay movimiento en esa
    % mascara
    % Checksum
    ssi=sum(fsi(:));
    ssd=sum(fsd(:));
    sii=sum(fii(:));
    sid=sum(fid(:));
    
    if (ssi>0)
        maskSSI='si';
    end
    if (ssd>0)
        maskSSD='si';
    end   
    if (sii>0)
        maskSII='si';
    end   
    if (sid>0)
        maskSID='si';
    end   
    
    mask={maskSSI,maskSSD,maskSII,maskSID};
%     if (strcmp(maskSSI,'si') || strcmp(maskSSD,'si') || strcmp(maskSII,'si') || strcmp(maskSID,'si'))
%         mask
%     end
end