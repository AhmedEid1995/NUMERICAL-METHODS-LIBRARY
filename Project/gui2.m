function varargout = gui2(varargin)

global i;
% GUI2 MATLAB code for gui2.fig
%      GUI2, by itself, creates a new GUI2 or raises the existing
%      singleton*.
%
%      H = GUI2 returns the handle to a new GUI2 or the handle to
%      the existing singleton*.
%
%      GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2.M with the given input arguments.
%
%      GUI2('Property','Value',...) creates a new GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui2

% Last Modified by GUIDE v2.5 06-May-2016 23:14:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui2_OutputFcn, ...
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


% --- Executes just before gui2 is made visible.
function gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui2 (see VARARGIN)

% Choose default command line output for gui2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global i;
i=1;
% UIWAIT makes gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function getX_Callback(hObject, eventdata, handles)
% hObject    handle to getX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of getX as text
%        str2double(get(hObject,'String')) returns contents of getX as a double


% --- Executes during object creation, after setting all properties.
function getX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to getX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function getFX_Callback(hObject, eventdata, handles)
% hObject    handle to getFX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of getFX as text
%        str2double(get(hObject,'String')) returns contents of getFX as a double


% --- Executes during object creation, after setting all properties.
function getFX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to getFX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in enterPoint.
function enterPoint_Callback(hObject, eventdata, handles)
% hObject    handle to enterPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global i;
global Table;
Table(i,1)=str2num(get(handles.getX ,'String'));
Table(i,2)=str2num(get(handles.getFX , 'String'));
i = i+1;



function numberOfPoint_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfPoint as text
%        str2double(get(hObject,'String')) returns contents of numberOfPoint as a double


% --- Executes during object creation, after setting all properties.
function numberOfPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in numberPoint.
function numberPoint_Callback(hObject, eventdata, handles)
% hObject    handle to numberPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Table;
Table=zeros(str2num(get(handles.numberOfPoint ,'String')),2);
set(handles.numberOfPoint , 'Enable','off');
set(handles.numberPoint , 'Enable','off');



function equationAnswer_Callback(hObject, eventdata, handles)
% hObject    handle to equationAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equationAnswer as text
%        str2double(get(hObject,'String')) returns contents of equationAnswer as a double


% --- Executes during object creation, after setting all properties.
function equationAnswer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equationAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timeAnswer_Callback(hObject, eventdata, handles)
% hObject    handle to timeAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeAnswer as text
%        str2double(get(hObject,'String')) returns contents of timeAnswer as a double


% --- Executes during object creation, after setting all properties.
function timeAnswer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeAnswer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method = get(handles.method,'SelectedObject');
method2 = get(method,'String')

global Table;
targetX = str2num(get(handles.targetX , 'String'));
order =  str2num(get(handles.order, 'String'));
switch method2
  case char('Newton')
      answer = Newton_N_Devision(Table,handles);
      set(handles.equationAnswer , 'String' , answer(targetX));
  case char('Lagrange')
      answer = Lagrange(order, Table,handles);
      set(handles.equationAnswer , 'String' , answer(targetX));
end



function targetX_Callback(hObject, eventdata, handles)
% hObject    handle to targetX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of targetX as text
%        str2double(get(hObject,'String')) returns contents of targetX as a double


% --- Executes during object creation, after setting all properties.
function targetX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to targetX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function order_Callback(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of order as text
%        str2double(get(hObject,'String')) returns contents of order as a double


% --- Executes during object creation, after setting all properties.
function order_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in fileLagrange.
function fileLagrange_Callback(hObject, eventdata, handles)
% hObject    handle to fileLagrange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileID = fopen('lag.txt','r');
%formatSpec = '%s';
%numberPoint = fscanf(fileID,formatSpec);
numberPoint = fgets(fileID)
numberPoint = str2num(numberPoint)
table=zeros(numberPoint,2);
for  i=1:numberPoint
     table(i,1)= str2num(fgets(fileID))
     table(i,2)= str2num(fgets(fileID))
end
targetX = str2num(fgets(fileID))
order = str2num(fgets(fileID))
answer = Lagrange(order, table,handles );
set(handles.equationAnswer , 'String' , answer(targetX));



% --- Executes on button press in fileNewton.
function fileNewton_Callback(hObject, eventdata, handles)
% hObject    handle to fileNewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileID = fopen('new.txt','r');
%formatSpec = '%s';
%numberPoint = fscanf(fileID,formatSpec);
numberPoint = fgets(fileID)
numberPoint = str2num(numberPoint)
table=zeros(numberPoint,2);
for  i=1:numberPoint
     table(i,1)= str2num(fgets(fileID))
     table(i,2)= str2num(fgets(fileID))
end
targetX = str2num(fgets(fileID))
answer = Newton_N_Devision(table,handles);
set(handles.equationAnswer , 'String' , answer(targetX));
