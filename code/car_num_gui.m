function varargout = car_num_gui(varargin)
% CAR_NUM_GUI MATLAB code for car_num_gui.fig
%      CAR_NUM_GUI, by itself, creates a new CAR_NUM_GUI or raises the existing
%      singleton*.
%
%      H = CAR_NUM_GUI returns the handle to a new CAR_NUM_GUI or the handle to
%      the existing singleton*.
%
%      CAR_NUM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAR_NUM_GUI.M with the given input arguments.
%
%      CAR_NUM_GUI('Property','Value',...) creates a new CAR_NUM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before car_num_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to car_num_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help car_num_gui

% Last Modified by GUIDE v2.5 23-Jul-2021 07:32:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @car_num_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @car_num_gui_OutputFcn, ...
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


% --- Executes just before car_num_gui is made visible.
function car_num_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to car_num_gui (see VARARGIN)

% Choose default command line output for car_num_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes car_num_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = car_num_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global im_read
global file 
[file,path]=uigetfile();
img_name=fullfile(path,file);
im_read=imread(img_name);
axes(handles.axes1);
imshow(im_read);
title('original image');
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global im_read
global file 
[im_c1,letter]=car_number_plate(file,im_read);
axes(handles.axes2);
imshow(im_c1);
title('cropped image');
set(handles.edit1,'string',letter);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
text=string(fileread('E:\L-2 T-1\eee-212\code\image pr\project car num plate detector_with_file_read\project car num plate detector\code\car_number.txt'));
setappdata(0,'text',text);
sub_gui;

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
