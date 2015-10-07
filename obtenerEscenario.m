function [ umbral ] = obtenerEscenario()
%OBTENERESCENARIO Summary of this function goes here
%   Detailed explanation goes here
    cam=getCam();
    w=getsnapshot(cam);
    w=rgb2gray(w);

    % Fusión de la captura y las mask
    s=obtenerMasks();
    si=s{:,1};sd=s{:,2};ii=s{:,3};id=s{:,4};
    fsi=si.*w;
    fsd=sd.*w;
    fii=ii.*w;
    fid=id.*w;

    % Checksum
    ssi=sum(fsi(:));
    ssd=sum(fsd(:));
    sii=sum(fii(:));
    sid=sum(fid(:));
    
   umbral={ssi,ssd,sii,sid}; 
end