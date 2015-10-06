function [ mask ] = detectaMovimientoEnMask( checksum )
%DETECTAMOVIMIENTOENMASK Funcion que permite verificar si hay movimiento en
%alguna de las mask
    
    % Umbral para decidir si hay cambio de movimiento en cada mask
    umbral=getappdata(0,'umbral');
    MAX_SSI=umbral{:,1};
    MAX_SSD=umbral{:,2};
    MAX_SII=umbral{:,3};
    MAX_SID=umbral{:,4};

    ssi=checksum{:,1};
    ssd=checksum{:,2};
    sii=checksum{:,3};
    sid=checksum{:,4};
    
    msjMAX=strcat('MAX: ',int2str(MAX_SSI),'-',int2str(MAX_SSD),'-',int2str(MAX_SII),'-',int2str(MAX_SID));
    msjSS=strcat('SS',int2str(ssi),'-',int2str(ssd),'-',int2str(sii),'-',int2str(sid));
    
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