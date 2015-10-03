function [ umbral ] = obtenerEscenario(s)
%OBTENERESCENARIO Summary of this function goes here
%   Detailed explanation goes here
    cam=videoinput('winvideo',1,'RGB24_640x480');
    w=getsnapshot(cam);
    w=rgb2gray(w);

    % Fusión de la captura y las mask
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