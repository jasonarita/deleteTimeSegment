function varargout = gui_erplabDeleteTimeSegments(varargin)
% gui_erplabDeleteTimeSegments MATLAB code for gui_erplabDeleteTimeSegments.fig
%      gui_erplabDeleteTimeSegments, by itself, creates a new gui_erplabDeleteTimeSegments or raises the existing
%      singleton*.
%
%      H = gui_erplabDeleteTimeSegments returns the handle to a new gui_erplabDeleteTimeSegments or the handle to
%      the existing singleton*.
%
%      gui_erplabDeleteTimeSegments('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in gui_erplabDeleteTimeSegments.M with the given input arguments.
%
%      gui_erplabDeleteTimeSegments('Property','Value',...) creates a new gui_erplabDeleteTimeSegments or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_erplabDeleteTimeSegments_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_erplabDeleteTimeSegments_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_erplabDeleteTimeSegments

% Last Modified by GUIDE v2.5 19-Aug-2016 15:49:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_erplabDeleteTimeSegments_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_erplabDeleteTimeSegments_OutputFcn, ...
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

% --- Executes just before gui_erplabDeleteTimeSegments is made visible.
function gui_erplabDeleteTimeSegments_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_erplabDeleteTimeSegments (see VARARGIN)

% Choose default command line output for gui_erplabDeleteTimeSegments
handles.output = hObject;



handles.maxDistanceMS               = 0;
handles.startEventCodeBufferMS      = 0;
handles.endEventCodeBufferMS        = 0;
handles.ignoreEventCodes            = [];
handles.displayEEG                  = false;
 
set(handles.editbox_maxDistanceMS...
    , 'String', num2str(handles.maxDistanceMS));
set(handles.editbox_startEventCodeBufferMS ...
    , 'String', num2str(handles.startEventCodeBufferMS));
set(handles.editbox_endEventCodeBufferMS ...
    , 'String', handles.endEventCodeBufferMS);
set(handles.editbox_ignoreEventCodes, ...
    'String', num2str(handles.ignoreEventCodes));


% Set 
set(handles.gui_chassis, ...       % Name & version
    'Name', ['ERPLAB ' geterplabversion() '   -   EXTRACT BINEPOCHS GUI']);
handles = painterplab(handles);   % Color GUI
handles = setfonterplab(handles); % Set font size





% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes gui_erplabDeleteTimeSegments wait for user response (see UIRESUME)
uiwait(handles.gui_chassis);


% --- Outputs from this function are returned to the command line.
function varargout = gui_erplabDeleteTimeSegments_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% The figure can be deleted now
delete(handles.gui_chassis);
pause(0.5)




% --- Executes on button press in pushbutton_deleteTimeSegment.
function pushbutton_deleteTimeSegment_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
% hObject    handle to pushbutton_deleteTimeSegment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% mass = handles.metricdata.density * handles.metricdata.volume;
% set(handles.mass, 'String', mass);

% Command-line feedback to user
display('Deleting time segments...');


% Save the input variables to output
handles.output = {                      ...
    handles.maxDistanceMS,              ...
    handles.startEventCodeBufferMS,     ...
    handles.endEventCodeBufferMS,       ...
    handles.ignoreEventCodes,           ...
    handles.displayEEG           }; 

% Update handles structure
guidata(hObject, handles);
uiresume(handles.gui_chassis);

% --- Executes on button press in pushbutton_cancel.
function pushbutton_cancel_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Command-line feedback to user
disp('User selected Cancel')

% Clear all input variables
handles.output = []; 

% Update handles structure
guidata(hObject, handles);
uiresume(handles.gui_chassis);



% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset) %#ok<*INUSD>
% If the metricdata field is present and the pushbutton_cancel flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to pushbutton_cancel the data.



% Update handles structure
guidata(handles.gui_chassis, handles);




function editbox_maxDistanceMS_Callback(hObject, eventdata, handles)
% hObject    handle to editbox_maxDistanceMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbox_maxDistanceMS as text
%        str2double(get(hObject,'String')) returns contents of editbox_maxDistanceMS as a double

% Use `str2num` (vs `str2double`) to handle both string arrray input and
% single string/character input

% returns contents of editbox_maxDistanceMS as a double
handles.maxDistanceMS = str2double(get(hObject,'String')); 

% Save the new replace channels value
guidata(hObject,handles)


function editbox_startEventCodeBufferMS_Callback(hObject, eventdata, handles)
% hObject    handle to editbox_startEventCodeBufferMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbox_startEventCodeBufferMS as text
%        str2double(get(hObject,'String')) returns contents of editbox_startEventCodeBufferMS as a double

% returns contents of editbox_maxDistanceMS as a double
handles.startEventCodeBufferMS = str2double(get(hObject,'String')); 

% Save the new value
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function editbox_startEventCodeBufferMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbox_startEventCodeBufferMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbox_endEventCodeBufferMS_Callback(hObject, eventdata, handles)
% hObject    handle to editbox_endEventCodeBufferMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbox_endEventCodeBufferMS as text
%        str2double(get(hObject,'String')) returns contents of editbox_endEventCodeBufferMS as a double

% returns contents of editbox_EndEventCodeBufferMS as a double
handles.endEventCodeBufferMS = str2double(get(hObject,'String')); 

% Save the new value
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function editbox_endEventCodeBufferMS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbox_endEventCodeBufferMS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbox_ignoreEventCodes_Callback(hObject, eventdata, handles)
% hObject    handle to editbox_ignoreEventCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Strip any non-numeric token and replace w/ whitespace (' ')
editString               = regexprep(get(hObject,'String'), '[\D]', ' ');
handles.ignoreEventCodes = str2num(editString);  %#ok<ST2NM>

% Display corrected eventcode string back to GUI
set(handles.editbox_ignoreEventCodes, 'String', editString);

% Save the new replace channels value
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function editbox_ignoreEventCodes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbox_ignoreEventCodes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox_displayEEG.
function checkbox_displayEEG_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_displayEEG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_displayEEG
% returns contents of editbox_EndEventCodeBufferMS as a double
handles.displayEEG = get(hObject,'Value'); 

% Save the new value
guidata(hObject,handles)
