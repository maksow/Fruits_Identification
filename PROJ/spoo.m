function varargout = spoo(varargin)
% SPOO MATLAB code for spoo.fig
%      SPOO, by itself, creates a new SPOO or raises the existing
%      singleton*.
%
%      H = SPOO returns the handle to a new SPOO or the handle to
%      the existing singleton*.
%
%      SPOO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPOO.M with the given input arguments.
%
%      SPOO('Property','Value',...) creates a new SPOO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spoo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spoo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spoo

% Last Modified by GUIDE v2.5 15-Aug-2013 20:29:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spoo_OpeningFcn, ...
                   'gui_OutputFcn',  @spoo_OutputFcn, ...
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

% --- Executes just before spoo is made visible.
function spoo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spoo (see VARARGIN)

% Choose default command line output for spoo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using spoo.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes spoo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spoo_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;

% str1 = get(hObject.edit1,'String');
% str2 = get(hObject.edit2,'String');

str1 = get(handles.edit1,'String');
str2 = get(handles.edit2,'String');

strfinal=strcat(str1,str2);
a1=imread(strfinal);
imshow(a1);

% axes(handles.axes5);
% cla;
% a2=im2bw(a1);
% imshow(a2)
% 
% axes(handles.axes3);
% cla;
% a3=edge(a2);
% imshow(a3)




%popup_sel_index = get(handles.popupmenu1, 'Value');
% switch popup_sel_index
%     case 1
%        a1=imread('apple.jpg')
%        imshow(a1);
%     case 2
%         plot(sin(1:0.01:25.99));
%     case 3
%         bar(1:.5:10);
%     case 4
%         plot(membrane);
%     case 5
%         surf(peaks);
% end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
%function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
% function popupmenu1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to popupmenu1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: popupmenu controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%      set(hObject,'BackgroundColor','white');
% end

%%set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str1 = get(handles.edit1,'String');
str2 = get(handles.edit2,'String');

strfinal=strcat(str1,str2);
% a1=imread(strfinal);
% imshow(a1);a
% 
a1=imread(strfinal);
axes(handles.axes5);
cla;
a2=im2bw(a1);
imshow(a2)

axes(handles.axes3);
cla;
a3=edge(a2);
imshow(a3)

%%%%%%%%%%%%%classify
finp=spoofun(str1,str2);
%% change the M12 stuff depending on the changes in DB :)
ftraindb=xlsread('DATABASE.xls','DATABASE','B2:M232');
ftgtdb=xlsread('DATABASE.xls','DATABASE','O2:O232');
%%ftgt=ind2vec(ftgtdb);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by NPRTOOL
%
% This script assumes these variables are defined:
%
% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);


% Set up Division of Data for Training, Validation, Testing
%% change these values if things are not turning good !
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

ftraindb=repmat(ftraindb,100,1);
ftgtdb=repmat(ftgtdb,100,1);
% Train the Network
[net,tr] = train(net,ftraindb',ftgtdb');

% Test the Network
outputs = net(ftraindb');
errors = gsubtract(ftgtdb',outputs);
performance = perform(net,ftgtdb',outputs);
y1=sim(net,finp');
%%y1=net(finp');
%%format long G
%%display(finp)
%%display(finp)
%%display(y1)
y1=round(y1);
% s1=strcat('FRUIT class--->',num2str(y1));
% display(s1);
%%display(dispstr)
%%g1={'APPLE','BANANA','CAPSCIUM','GREEN APPLE','LEMON','ORANGE','PINEAPPLE','REDCAPSCIUM','STRAWBERRY','WATERMELON','MANGO','TOMATO','BLUEBERRY','MUSKMELON','BRINJAL'};
g1={'APPLE','BANANA','CAPSCIUM','GREEN APPLE','LEMON','ORANGE','PINEAPPLE','REDCAPSCIUM','STRAWBERRY','WATERMELON','MANGO','TOMATO','BLUEBERRY','MUSKMELON','BRINJAL','APPLE1','APPLE2','APPLE3'};

%% apple fin
%%lemon fine
%%strawberry fine

g2=cellstr(g1);

str1x='Detected Fruit----->';
str2x=g2{y1};
%%str2x={str2x};
strfinal_detect=strcat(str1,lower(str2x),'.jpg');
x1=strfinal_detect;
%%%display(whos(x1))



axes(handles.axes7);
cla;
res1=imread(x1);
imshow(res1)
%%view(net)
% 
% % Plots
% % Uncomment these lines to enable various plots.
% figure, plotperform(tr)
% figure, plottrainstate(tr)
% figure, plotconfusion(tgt,outputs)
% figure, ploterrhist(errors)






function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
