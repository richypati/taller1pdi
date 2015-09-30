% Limpiando
clear all;close all;clc;

%% Cargando mascaras
si=imread('mask_si.bmp'); % Superior Izquierda
sd=imread('mask_sd.bmp'); % Superior Derecha
ii=imread('mask_ii.bmp'); % Inferior Izquierda
id=imread('mask_id.bmp'); % Inferior Derecha

%% Cargando imagen
g=imread('globo.png');
w=imread('bomba.png');
figure(1); imshow(w)
%% Cargando video

%Para Windows
%cam=videoinput('winvideo',1,'RGB24_640x480');

%Para Mac
cam=videoinput('macvideo',1,'YCbCr422_1280x720');

%% Redimensionando imagen
si=uint8(si);
sd=uint8(sd);
ii=uint8(ii);
id=uint8(id);

si=imresize(si,[480,640]);
sd=imresize(sd,[480,640]);
ii=imresize(ii,[480,640]);
id=imresize(id,[480,640]);

%Para Mac
% si=imresize(si,[720,1280]);
% sd=imresize(sd,[720,1280]);
% ii=imresize(ii,[720,1280]);
% id=imresize(id,[720,1280]);
%% Procesando imagen
while(true)
        w=getsnapshot(cam);
        w=rgb2gray(w);
        
        % Fusión de la captura y las mask
        fsi=si.*w;
        fsd=sd.*w;
        fii=ii.*w;
        fid=id.*w;

        % Checksum
        ssi=sum(fsi(:));
        ssd=sum(fsd(:));
        sii=sum(fii(:));
        sid=sum(fid(:));
        
        figure(1);imshow(fsd);
        title(['valor=',num2str(ssd)]);
        
%         hold onclc
%         [xb,yb]=size(w);
%         [xg,yg]=size(g);
%         image(0,0,g)
%         hold on
%         image(yb-xg,0,g)
%         hold on
%         image(0,xb-xg,g)
%         hold on
%         image(yb-xg,xb-xg,g)
%         if (f>3900000)
%             
%         else
%             figure(1);imshow(getsnapshot(cam))
%             title('MOVIMIENTO!!!');
%         end
        pause(0.05)
end