function [ mask ] = detectaMovimientoEnMask( checksum )
%DETECTAMOVIMIENTOENMASK Funcion que permite verificar si hay movimiento en
%alguna de las mask
    
    % Umbral para decidir si hay cambio de movimiento en cada mask
    MAX_SSI=600000;
    MAX_SSD=600000;
    MAX_SII=600000;
    MAX_SID=600000;

    ssi=checksum(1);
    ssd=checksum(2);
    sii=checksum(3);
    sid=checksum(4);
    
    mask='no';
    
    if(ssi<MAX_SSI)
        mask='ssi';
    end
    if (ssd<MAX_SSD)
        mask='ssd';
    end
    if (sii<MAX_SII)
        mask='sii';
    end
    if (sid<MAX_SID)
        mask='sid';
    end
end