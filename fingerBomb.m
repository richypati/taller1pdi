% Limpiando
clear all;close all;clc;

%% Cargando imagen
g=imread('globo.png');
b=imread('bomba.png');

%% Cargando video
%Para PC Ricardo
cam=videoinput('winvideo',1,'RGB24_640x480');

%Para Mac JuanPa
%cam=videoinput('macvideo',1,'YCbCr422_1280x720');

s=obtenerMasks();
si=s{:,1};
sd=s{:,2};
ii=s{:,3};
id=s{:,4};

objetosEnMask=ponerYDibujarObjetos();
setappdata(0,'objetosEnMask',objetosEnMask);
%% Procesando imagen
while(true)
        w=getsnapshot(cam);
        w=rgb2gray(w);
        
        % Fusion de la captura y las mask
        fsi=si.*w;
        fsd=sd.*w;
        fii=ii.*w;
        fid=id.*w;

        % Checksum
        ssi=sum(fsi(:));
        ssd=sum(fsd(:));
        sii=sum(fii(:));
        sid=sum(fid(:));
        
        checksum={ssi,ssd,sii,sid};
 
        movimientoEnMask=detectaMovimientoEnMask(checksum);
        
        if (~strc(movimientoEnMask,'no'))
            puntos=puntos+explotarYVerificar(objetosEnMask,movimientoEnMask);
            objetosEnMask=ponerYDibujarObjetos();
            setappdata(0,'objetosEnMask',objetosEnMask);
        else
            pause(2);
        end
        
        
        % DONE: Crear algoritmo para poner globos y bombas en las mascaras
        % WIP: Crear interfaz grafica para mostrar resultados (tanto
        % puntos como para mensaje de perdiad
        % TODO: Mostrar objetos en las esquinas sobre la imagen de la
        % camara.
        
%        figure(1);imshow(fsd);
%        title(['valor=',num2str(ssd)]);
        
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
