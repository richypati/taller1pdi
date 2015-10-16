%% Cargando video
cam=getappdata(0,'cam');

s=obtenerMasks();

puntos=0;
%% Procesando imagen
while(true)
        % Obteniendo imagen desde la camara
        w=getsnapshot(cam);

        movimientoEnMask=detectaMovimientoEnMask(w, s);        
        punto=explotarYVerificar(movimientoEnMask, handles);
        if (punto==-1)
            msj=strcat('Boooooom, tu puntaje fue: ',int2str(puntos));
            set(handles.txtMsj,'String',msj);
            stoppreview(cam);
            set(handles.btnStart,'Enable','on');
            return;
        elseif (punto==0)
            msj='Pon algo rojo e.e';            
            set(handles.txtMsj,'String',msj);
        else
            msj='wiiiiiii :D';
            set(handles.txtMsj,'String',msj);
            puntos=puntos+punto;
            pause(1);
        end
        set(handles.txtPuntos,'String',int2str(puntos));
        setappdata(0,'puntos',puntos);
        pause(0.05)
end
