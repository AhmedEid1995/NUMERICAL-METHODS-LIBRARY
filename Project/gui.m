function varargout = gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

end

function gui_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

end

% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
end


function equation_editor_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function equation_editor_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in EnterMethod_button.
function EnterMethod_button_Callback(hObject, eventdata, handles)

method = get(handles.meth_panel,'SelectedObject');
method2 = get(method,'String');

switch method2
  case char('Defult')
  case char('Bisection')
      set(handles.fixed_point_panel,'Visible','off');
      set(handles.bisection_panel,'Visible','on');
  case char('false_pos')
      set(handles.bisection_panel,'Visible','on');
      set(handles.fixed_point_panel,'Visible','off');
  case char('fixed-point')
      set(handles.bisection_panel,'Visible','off');
      set(handles.fixed_point_panel,'Visible','on');
  case char('Newton-raph')
      set(handles.bisection_panel,'Visible','off');
      set(handles.fixed_point_panel,'Visible','on');
  case char('secant')
     set(handles.bisection_panel,'Visible','on');
      set(handles.fixed_point_panel,'Visible','off');
  case char('Bierge vita')
      set(handles.bisection_panel,'Visible','off');
      set(handles.fixed_point_panel,'Visible','on');
end
end


% --- Executes on button press in pow_button.
function pow_button_Callback(hObject, eventdata, handles)

string = get(handles.equation_editor, 'String');
string = strcat(string,'^');
set( handles.equation_editor,'String' ,string);
end

% --- Executes on button press in sin_button.
function sin_button_Callback(hObject, eventdata, handles)

string = get(handles.equation_editor, 'String');
string = strcat(string,'sin()');
set( handles.equation_editor,'String' ,string);
end

% --- Executes on button press in cos_button.
function cos_button_Callback(hObject, eventdata, handles)

string = get(handles.equation_editor, 'String');
string = strcat(string,'cos()');
set( handles.equation_editor,'String' ,string);
end

% --- Executes on button press in exp_button.
function exp_button_Callback(hObject, eventdata, handles)

expS = get(handles.equation_editor, 'String')
expS = strcat(expS,'exp()')
set( handles.equation_editor,'String' ,expS)
end

% --- Executes during object creation, after setting all properties.
function method_panel_CreateFcn(hObject, eventdata, handles)

end

% --- Executes on key press with focus on bisectoin_button and none of its controls.
function bisectoin_button_KeyPressFcn(hObject, eventdata, handles)

end

% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)

method = get(handles.meth_panel,'SelectedObject');
method2 = get(method,'String')

func = get(handles.equation_editor,'String')
%y = inline(func);  % Inline function made from string 
%x = -50:.1:50;
%plot(x,y(x))
%hold
switch method2
  case char('Defult')
       answer = defult(func,handles);
      set(handles.answer, 'String' ,answer);
  case char('Bisection')
      xl = get(handles.bisection_xl,'String');
      xu = get(handles.bisection_xu,'String');
      imax = get(handles.bisection_imax,'String');
      esp = get(handles.bisection_esp,'String');
      xl = str2num(xl);
      xu = str2num(xu);
      imax = str2num(imax);
      esp = str2num(esp);
      answer = bisectionMethod(xl, xu, esp, imax,func,handles);
      set(handles.answer, 'String' ,answer);
      %send this parameters to functions
  case char('false_pos')
      xl = get(handles.bisection_xl,'String');
      xu = get(handles.bisection_xu,'String');
      imax = get(handles.bisection_imax,'String');
      esp = get(handles.bisection_esp,'String');
      xl = str2num(xl);
      xu = str2num(xu);
      imax = str2num(imax);
      esp = str2num(esp);
      answer =FalsePosition(xl, xu, esp, imax,func,handles);
      set(handles.answer, 'String' ,answer);
      %FalsePosition(xl, xu, esp, imax ,handles);
     %send this parameters to functions
  case char('fixed-point')
      x0 = get(handles.fixed_point_x0,'String');
      imax = get(handles.fixed_point_imax,'String');
      esp = get(handles.fixed_point_esp,'String');
      x0 = str2num(x0);
      imax = str2num(imax);
      esp = str2num(esp);
      answer = fixed_point( func , x0 , esp, imax ,handles);
      set(handles.answer, 'String' ,answer);
     %send this parameters to functions
  case char('Newton-raph')
     x0 = get(handles.fixed_point_x0,'String');
      imax = get(handles.fixed_point_imax,'String');
      esp = get(handles.fixed_point_esp,'String');
      x0 = str2num(x0)
      imax = str2num(imax)
      esp = str2num(esp)
       [answer,error] = Newton(func,imax,esp,x0,handles);
       answer2 = zeros(length(error), 2);
       answer2(:,1) = answer;
       answer2(:,2) = error;
       set(handles.table, 'Data' ,answer2 );
       %set(handles.answer, 'String' ,answer);
      %send this parameters to functions
  case char('secant')
       xl = get(handles.bisection_xl,'String');
      xu = get(handles.bisection_xu,'String');
      imax = get(handles.bisection_imax,'String');
      esp = get(handles.bisection_esp,'String');
      xl = str2num(xl);
      xu = str2num(xu);
      imax = str2num(imax);
      esp = str2num(esp);
       [answer ,error]= Secant( func,imax,esp,xu,xl,handles )
      answer2 = zeros(length(error), 2);
       answer2(:,1) = answer;
       answer2(:,2) = error;
       set(handles.table, 'Data' ,answer2 );
      %send this parameters to functions
  case char('Bierge vita')
      x0 = get(handles.fixed_point_x0,'String');
      imax = get(handles.fixed_point_imax,'String');
      esp = get(handles.fixed_point_esp,'String');
      x0 = str2num(x0);
      imax = str2num(imax);
      esp = str2num(esp);
      answer = birage_veta(x0, esp, imax, func, handles);
      set(handles.answer, 'String' ,answer);
end

end




function edit3_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function edit4_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function false_pos_xl_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function false_pos_xl_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function false_pos_xu_Callback(hObject, eventdata, handles)
% hObject    handle to false_pos_xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of false_pos_xu as text
%        str2double(get(hObject,'String')) returns contents of false_pos_xu as a double
end

% --- Executes during object creation, after setting all properties.
function false_pos_xu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to false_pos_xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function false_pos_imax_Callback(hObject, eventdata, handles)
% hObject    handle to false_pos_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of false_pos_imax as text
%        str2double(get(hObject,'String')) returns contents of false_pos_imax as a double
end

% --- Executes during object creation, after setting all properties.
function false_pos_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to false_pos_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function false_pos_esp_Callback(hObject, eventdata, handles)
% hObject    handle to false_pos_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of false_pos_esp as text
%        str2double(get(hObject,'String')) returns contents of false_pos_esp as a double
end

% --- Executes during object creation, after setting all properties.
function false_pos_esp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to false_pos_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function bisection_xl_Callback(hObject, eventdata, handles)
% hObject    handle to bisection_xl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bisection_xl as text
%        str2double(get(hObject,'String')) returns contents of bisection_xl as a double
end

% --- Executes during object creation, after setting all properties.
function bisection_xl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bisection_xl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function bisection_xu_Callback(hObject, eventdata, handles)
% hObject    handle to bisection_xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bisection_xu as text
%        str2double(get(hObject,'String')) returns contents of bisection_xu as a double
end

% --- Executes during object creation, after setting all properties.
function bisection_xu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bisection_xu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function bisection_imax_Callback(hObject, eventdata, handles)
% hObject    handle to bisection_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bisection_imax as text
%        str2double(get(hObject,'String')) returns contents of bisection_imax as a double
end

% --- Executes during object creation, after setting all properties.
function bisection_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bisection_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function bisection_esp_Callback(hObject, eventdata, handles)
% hObject    handle to bisection_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bisection_esp as text
%        str2double(get(hObject,'String')) returns contents of bisection_esp as a double
end

% --- Executes during object creation, after setting all properties.
function bisection_esp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bisection_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function fixed_point_esp_Callback(hObject, eventdata, handles)
% hObject    handle to fixed_point_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixed_point_esp as text
%        str2double(get(hObject,'String')) returns contents of fixed_point_esp as a double
end

% --- Executes during object creation, after setting all properties.
function fixed_point_esp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixed_point_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function fixed_point_imax_Callback(hObject, eventdata, handles)
% hObject    handle to fixed_point_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixed_point_imax as text
%        str2double(get(hObject,'String')) returns contents of fixed_point_imax as a double
end

% --- Executes during object creation, after setting all properties.
function fixed_point_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixed_point_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function fixed_point_x0_Callback(hObject, eventdata, handles)
% hObject    handle to fixed_point_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fixed_point_x0 as text
%        str2double(get(hObject,'String')) returns contents of fixed_point_x0 as a double
end

% --- Executes during object creation, after setting all properties.
function fixed_point_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fixed_point_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function newton_raph_xi_Callback(hObject, eventdata, handles)
% hObject    handle to newton_raph_xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newton_raph_xi as text
%        str2double(get(hObject,'String')) returns contents of newton_raph_xi as a double
end

% --- Executes during object creation, after setting all properties.
function newton_raph_xi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newton_raph_xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function newton_raph_imax_Callback(hObject, eventdata, handles)
% hObject    handle to newton_raph_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newton_raph_imax as text
%        str2double(get(hObject,'String')) returns contents of newton_raph_imax as a double
end

% --- Executes during object creation, after setting all properties.
function newton_raph_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newton_raph_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function newton_raph_esp_Callback(hObject, eventdata, handles)
% hObject    handle to newton_raph_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of newton_raph_esp as text
%        str2double(get(hObject,'String')) returns contents of newton_raph_esp as a double
end

% --- Executes during object creation, after setting all properties.
function newton_raph_esp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newton_raph_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function secant_xii_Callback(hObject, eventdata, handles)
% hObject    handle to secant_xii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secant_xii as text
%        str2double(get(hObject,'String')) returns contents of secant_xii as a double
end

% --- Executes during object creation, after setting all properties.
function secant_xii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secant_xii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function secant_xi_Callback(hObject, eventdata, handles)
% hObject    handle to secant_xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secant_xi as text
%        str2double(get(hObject,'String')) returns contents of secant_xi as a double
end

% --- Executes during object creation, after setting all properties.
function secant_xi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secant_xi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function secant_imax_Callback(hObject, eventdata, handles)
% hObject    handle to secant_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secant_imax as text
%        str2double(get(hObject,'String')) returns contents of secant_imax as a double
end

% --- Executes during object creation, after setting all properties.
function secant_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to secant_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function secant_esp_Callback(hObject, eventdata, handles)
% hObject    handle to secant_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of secant_esp as text
%        str2double(get(hObject,'String')) returns contents of secant_esp as a double
end

% --- Executes during object creation, after setting all properties.
function secant_esp_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in readFile.
function readFile_Callback(hObject, eventdata, handles)

fileID = fopen('eq.txt','r');
formatSpec = '%s';
A = fscanf(fileID,formatSpec);
set( handles.equation_editor,'String' ,A);
end



function bierge_vita_x0_Callback(hObject, eventdata, handles)
% hObject    handle to bierge_vita_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bierge_vita_x0 as text
%        str2double(get(hObject,'String')) returns contents of bierge_vita_x0 as a double
end

% --- Executes during object creation, after setting all properties.
function bierge_vita_x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bierge_vita_x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function bierge_vita_esp_Callback(hObject, eventdata, handles)
% hObject    handle to bierge_vita_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bierge_vita_esp as text
%        str2double(get(hObject,'String')) returns contents of bierge_vita_esp as a double
end

% --- Executes during object creation, after setting all properties.
function bierge_vita_esp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bierge_vita_esp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function bierge_vita_imax_Callback(hObject, eventdata, handles)
% hObject    handle to bierge_vita_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bierge_vita_imax as text
%        str2double(get(hObject,'String')) returns contents of bierge_vita_imax as a double
end

% --- Executes during object creation, after setting all properties.
function bierge_vita_imax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bierge_vita_imax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function answer_Callback(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of answer as text
%        str2double(get(hObject,'String')) returns contents of answer as a double
end

% --- Executes during object creation, after setting all properties.
function answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double
end

% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
func = get(handles.equation_editor,'String');
%axis([-10 10 -10 10]);
%answer = handles.axes1;
%axis(answer)
%y = inline(func)
%x = -50:.1:50;
%plot(x,y(x))
ezplot(func);zoom on
end
