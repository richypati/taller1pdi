function [ mask ] = detectaMovimientoEnMask( umbral, checksum )
%DETECTAMOVIMIENTOENMASK Funcion que permite verificar si hay movimiento en
%alguna de las mask
    
    % Umbral para decidir si hay cambio de movimiento en cada mask
    MAX_SSI=umbral{:,1};
    MAX_SSD=umbral{:,2};
    MAX_SII=umbral{:,3};
    MAX_SID=umbral{:,4};

    ssi=checksum{:,1};
    ssd=checksum{:,2};
    sii=checksum{:,3};
    sid=checksum{:,4};
    
    maskSSI='no';
    maskSSD='no';
    maskSII='no';
    maskSID='no';
    
    if(ssi<MAX_SSI)
        maskSSI='si';
    end
    if (ssd<MAX_SSD)
        maskSSD='si';
    end
    if (sii<MAX_SII)
        maskSII='si';
    end
    if (sid<MAX_SID)
        maskSID='si';
    end
    
    mask={maskSSI,maskSSD,maskSII,maskSID};
end