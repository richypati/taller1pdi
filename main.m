function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 05-Oct-2015 19:21:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)
    
% Choose default command line output for main
handles.output = hObject;

% Mostrando Camara
    axes(handles.maincamera);
    global cam;
    global himage;
    cam=getCam();
    % Para PC Ricardo
    himage=image(zeros(480,640,3),'parent',handles.maincamera);
    % Para MAC JuanPa
    %himage=image(zeros(720,1280,3),'parent',handles.maincamera);
    preview(cam,himage);
    ponerYDibujarObjetos();

% Mostrando Objetos
    axes(handles.oSI);
    oSI=getappdata(0,'oSI');
    imshow(strcat(oSI,'.png'));

    axes(handles.oSD);
    oSD=getappdata(0,'oSD');
    imshow(strcat(oSD,'.png'));

    axes(handles.oII);
    oII=getappdata(0,'oII');
    imshow(strcat(oII,'.png'));

    axes(handles.oID);
    oID=getappdata(0,'oID');
    imshow(strcat(oID,'.png'));

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnStaticSnapshot.
function btnStaticSnapshot_Callback(hObject, eventdata, handles)
% hObject    handle to btnStaticSnapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.btnStaticSnapshot,'Enable','off');
global cam;
global himage;
% Se detiene la camara para poder tomar la foto
stoppreview(cam);
umbral=obtenerEscenario();
setappdata(0,'umbral',umbral);
% Se vuelve a mostrar la camara
preview(cam,himage);
set(handles.btnStaticSnapshot,'Enable','on');

% --- Executes on button press in btnStart.
function btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global cam;
setappdata(0,'cam',cam);
run fingerBomb


% --- Executes on button press in btnMovingSnapshot.
function btnMovingSnapshot_Callback(hObject, eventdata, handles)
% hObject    handle to btnMovingSnapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.btnMovingSnapshot,'Enable','off');
global cam;
global himage;
% Se detiene la camara para poder tomar la foto
stoppreview(cam);
movimiento=obtenerEscenario();
setappdata(0,'movimiento',movimiento);
% Se vuelve a mostrar la camara
preview(cam,himage);
set(handles.btnMovingSnapshot,'Enable','on');