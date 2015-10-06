% Limpiando
%clear all;close all;clc;

%% Cargando imagen
g=imread('globo.png');
b=imread('bomba.png');

%% Cargando video
cam=getappdata(0,'cam');

s=obtenerMasks();
si=s{:,1};
sd=s{:,2};
ii=s{:,3};
id=s{:,4};

objetosEnMask=ponerYDibujarObjetos();
setappdata(0,'objetosEnMask',objetosEnMask);

puntos=0;
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
        movSI=movimientoEnMask{:,1};
        movSD=movimientoEnMask{:,2};
        movII=movimientoEnMask{:,3};
        movID=movimientoEnMask{:,4};
        
        if (~strcmp(movSI,'no') && ~strcmp(movSD,'no') && ~strcmp(movII,'no') && ~strcmp(movID,'no'))
            punto=explotarYVerificar(objetosEnMask,movimientoEnMask);
            if (punto==-1)
                msj=strcat('perdiste n00b, tu puntaje fue: ',int2str(puntos));
                msj
            else
                puntos=puntos+punto;
            end
            %objetosEnMask=ponerYDibujarObjetos();
            setappdata(0,'objetosEnMask',objetosEnMask);
            setappdata(0,'puntos',puntos);
        end
        
        
        % DONE: Crear algoritmo para poner globos y bombas en las mascaras
        % WIP: Crear interfaz grafica para mostrar resultados (tanto
        % puntos como para mensaje de perdiad
        % WIP: Mostrar objetos en las esquinas sobre la imagen de la
        % camara.
        pause(0.05)
end
