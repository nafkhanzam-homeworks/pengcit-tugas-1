function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 18-Feb-2022 02:12:41

% Begin initialization code - DO NOT EDIT
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)


fun = @(~,e)set(handles.text7,'String', append('a: ', num2str(e.AffectedObject.Value,3)));
addlistener(handles.slider1, 'Value', 'PostSet',fun);
set(handles.text7, 'Visible', 'off');
set(handles.slider1, 'Visible', 'off');
fun = @(~,e)set(handles.text8,'String', append('b: ', num2str(e.AffectedObject.Value,3)));
addlistener(handles.slider2, 'Value', 'PostSet',fun);
set(handles.text8, 'Visible', 'off');
set(handles.slider2, 'Visible', 'off');

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upload_btn.
function upload_btn_Callback(hObject, eventdata, handles)
% hObject    handle to upload_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[rawName, rawPath] = uigetfile(["*.jpg"; "*.jpeg"; "*.png"], "Select Image");
fullName = [rawPath rawName];
set(handles.upload_path, 'String', fullName);

if ~isempty(fullName)
    set(handles.radiobutton1, 'Visible', 'on');
    set(handles.radiobutton2, 'Visible', 'on');
    set(handles.radiobutton3, 'Visible', 'on');
    set(handles.radiobutton4, 'Visible', 'on');
end

im = imread(fullName);
axes(handles.uploaded_img);
imshow(im);
[row, column] = size(im);
img_size = strcat(int2str(row), ' x  ', int2str(column), ' pixels');
set(handles.img_size, 'String', img_size);
set(handles.uploaded_img,'xtick',[],'ytick',[]);




function upload_path_Callback(hObject, eventdata, handles)
% hObject    handle to upload_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of upload_path as text
%        str2double(get(hObject,'String')) returns contents of upload_path as a double


% --- Executes during object creation, after setting all properties.
function upload_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to upload_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.opt = 1;
set(handles.radiobutton1, 'Value', 1);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);
set(handles.text7, 'Visible', 'off');
set(handles.slider1, 'Visible', 'off');
set(handles.text8, 'Visible', 'off');
set(handles.slider2, 'Visible', 'off');
set(handles.upload_target_btn, 'Visible', 'off');
axesHandlesToChildObjects = findobj(gca, 'Type', 'image');
if ~isempty(axesHandlesToChildObjects)
  delete(axesHandlesToChildObjects);
end
set(handles.apply_btn, 'Visible', 'on');
if (~isempty(handles.target_img))
    set(handles.apply_btn, 'Visible', 'on');
end

guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.opt = 2;
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 1);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);
set(handles.text7, 'Visible', 'on');
set(handles.slider1, 'Visible', 'on');
set(handles.text8, 'Visible', 'on');
set(handles.slider2, 'Visible', 'on');
set(handles.upload_target_btn, 'Visible', 'off');
axesHandlesToChildObjects = findobj(gca, 'Type', 'image');
if ~isempty(axesHandlesToChildObjects)
  delete(axesHandlesToChildObjects);
end
set(handles.apply_btn, 'Visible', 'on');
if (~isempty(handles.target_img))
    set(handles.apply_btn, 'Visible', 'on');
end
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.opt = 3;
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 1);
set(handles.radiobutton4, 'Value', 0);
set(handles.text7, 'Visible', 'off');
set(handles.slider1, 'Visible', 'off');
set(handles.text8, 'Visible', 'off');
set(handles.slider2, 'Visible', 'off');
set(handles.upload_target_btn, 'Visible', 'off');
axesHandlesToChildObjects = findobj(gca, 'Type', 'image');
if ~isempty(axesHandlesToChildObjects)
  delete(axesHandlesToChildObjects);
end
set(handles.apply_btn, 'Visible', 'on');
if (~isempty(handles.target_img))
    set(handles.apply_btn, 'Visible', 'on');
end
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.opt = 4;
set(handles.radiobutton1, 'Value', 0);
set(handles.radiobutton2, 'Value', 0);
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 1);
set(handles.text7, 'Visible', 'off');
set(handles.slider1, 'Visible', 'off');
set(handles.text8, 'Visible', 'off');
set(handles.slider2, 'Visible', 'off');
set(handles.upload_target_btn, 'Visible', 'on');

guidata(hObject, handles);
if (~isempty(get(handles.target_img, 'children')))
    set(handles.apply_btn, 'Visible', 'on');
else
    set(handles.apply_btn, 'Visible', 'off');
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in apply_btn.
function apply_btn_Callback(hObject, eventdata, handles)
    im = imread(get(handles.upload_path, 'String'));
    if (get(handles.radiobutton1, 'Value') == 1)
        figure;myhist(im);
        figure;imshow(im);
    elseif (get(handles.radiobutton2, 'Value') == 1)
        a = get(handles.slider1, 'Value');
        b = get(handles.slider2, 'Value');
        enhanced_im = enhance_contrast(im, a, b);
        figure;myhist(im);
        figure;imshow(im);
        figure;myhist(enhanced_im);
        figure;imshow(enhanced_im);
    elseif (get(handles.radiobutton3, 'Value') == 1)
        histeq_im = myhisteq(im);
        figure;myhist(im);
        figure;imshow(im);
        figure;myhist(histeq_im);
        figure;imshow(histeq_im);
    elseif (get(handles.radiobutton4, 'Value') == 1)
        target = imread(handles.target_path);
        histspec_im = myhistspec(im, target);
        figure;myhist(im);
        figure;imshow(im);
        figure;myhist(target);
        figure;imshow(target);
        figure;myhist(histspec_im);
        figure;imshow(histspec_im);
    end
% hObject    handle to apply_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in save_btn.
function save_btn_Callback(hObject, eventdata, handles)
% hObject    handle to save_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function img_size_Callback(hObject, eventdata, handles)
% hObject    handle to img_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of img_size as text
%        str2double(get(hObject,'String')) returns contents of img_size as a double


% --- Executes during object creation, after setting all properties.
function img_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to img_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in upload_target_btn.
function upload_target_btn_Callback(hObject, eventdata, handles)
% hObject    handle to upload_target_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[rawName, rawPath] = uigetfile(["*.jpg"; "*.jpeg"; "*.png"], "Select Target Image");
fullName = [rawPath rawName];

im = imread(fullName);
handles.target_path = fullName;
axes(handles.target_img);
imshow(im);
set(handles.target_img,'xtick',[],'ytick',[]);
if (~isempty(get(handles.target_img, 'children')))
    set(handles.apply_btn, 'Visible', 'on');
end
guidata(hObject, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
