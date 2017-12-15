function varargout = odev2_kutle_merkezi(varargin)
% ODEV2_KUTLE_MERKEZI MATLAB code for odev2_kutle_merkezi.fig
%      ODEV2_KUTLE_MERKEZI, by itself, creates a new ODEV2_KUTLE_MERKEZI or raises the existing
%      singleton*.
%
%      H = ODEV2_KUTLE_MERKEZI returns the handle to a new ODEV2_KUTLE_MERKEZI or the handle to
%      the existing singleton*.
%
%      ODEV2_KUTLE_MERKEZI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ODEV2_KUTLE_MERKEZI.M with the given input arguments.
%
%      ODEV2_KUTLE_MERKEZI('Property','Value',...) creates a new ODEV2_KUTLE_MERKEZI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before odev2_kutle_merkezi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to odev2_kutle_merkezi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help odev2_kutle_merkezi

% Last Modified by GUIDE v2.5 06-Apr-2015 14:07:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @odev2_kutle_merkezi_OpeningFcn, ...
                   'gui_OutputFcn',  @odev2_kutle_merkezi_OutputFcn, ...
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


% --- Executes just before odev2_kutle_merkezi is made visible.
function odev2_kutle_merkezi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to odev2_kutle_merkezi (see VARARGIN)

% Choose default command line output for odev2_kutle_merkezi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes odev2_kutle_merkezi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = odev2_kutle_merkezi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in baslat_pushbutton.
function baslat_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to baslat_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('jump.txt');
 set(handles.veriler_listbox,'String','Verileri Buradan Ýnceleyebilirsiniz:');

for i=1:40
    
j=i*6;

%head+trunk
data =jump(j-5:j-5,1);
data2=jump(j-4:j-4,1);
datay =jump(j-5:j-5,2);
datay2=jump(j-4:j-4,2);
headcx = data+0.5921*(data2- data);
headcy=datay+0.5921*(datay2- datay);


plot(headcx,headcy,'y*');
hold on;
grid on;



%thigh
datat =jump(j-4:j-4,1);
datat2=jump(j-3:j-3,1);
dataty =jump(j-4:j-4,2);
dataty2=jump(j-3:j-3,2);
thighcx = datat+0.3719*(datat2- datat);
thighcy=dataty+0.3719*(dataty2- dataty);

plot(thighcx,thighcy,'k*');
hold on;

%leg
datah =jump(j-3:j-3,1);
datah2=jump(j-2:j-2,1);
datahy =jump(j-3:j-3,2);
datahy2=jump(j-2:j-2,2);
legcx = datah+0.3705*(datah2- datah);
legcy=datahy+0.3705*(datahy2- datahy);

plot(legcx,legcy,'c*');
hold on;

%foot1

datal =jump(j-2:j-2,1);
datal2=jump(j-1:j-1,1);
dataly =jump(j-2:j-2,2);
dataly2=jump(j-1:j-1,2);
foot1cx = datal+0.4622*(datal2- datal);
foot1cy=dataly+0.4622*(dataly2- dataly);

plot(foot1cx,foot1cy,'m*');

hold on;


%foot2

dataf =jump(j-1:j-1,1);
dataf2=jump(j:j,1);
datafy =jump(j-1:j-1,2);
datafy2=jump(j:j,2);
foot2cx = dataf+0.4485*(dataf2- dataf);
foot2cy=datafy+0.4485*(datafy2- datafy);
plot(foot2cx,foot2cy,'g*');

hold on;


%center of mass
cox=( 6.4*headcx+3.6*thighcx+1.6*legcx+0.6*foot1cx+0.6*foot2cx)/12.8;
coy=( 6.4*headcy+3.6*thighcy+1.6*legcy+0.6*foot1cy+0.6*foot2cy)/12.8;
set (handles.x_text,'String',cox);
set (handles.y_text,'String',coy);


plot(cox,coy,'ro');
   %w = waitforbuttonpress;
   tum_veriler = get(handles.veriler_listbox,'String');
   yeni_satir = [' Trunk:',int2str(headcx),' ',int2str(headcy),' c.g:',int2str(thighcx),' ',int2str(thighcy),' Leg:',int2str(legcx),' ',int2str(legcy),' Lower Leg:',int2str(foot2cx),' ',int2str(foot2cy),' Foot:',int2str(foot1cx),' ',int2str(foot1cy),' Merkez:',int2str(cox),' ',int2str(coy)];
  
   if isempty(tum_veriler)
 tum_veriler = yeni_satir; 
elseif ~iscell(tum_veriler)
 tum_veriler = {tum_veriler yeni_satir};
else
 tum_veriler = {tum_veriler{:} yeni_satir};
   end
set(handles.veriler_listbox,'String',tum_veriler);
end
hold off;


% --- Executes on selection change in veriler_listbox.
function veriler_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to veriler_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns veriler_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from veriler_listbox


% --- Executes during object creation, after setting all properties.
function veriler_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to veriler_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
