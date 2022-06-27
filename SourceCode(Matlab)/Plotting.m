function varargout = Plotting(varargin)
clc;
%PLOTTING M-file for Plotting.fig
%      PLOTTING, by itself, creates a new PLOTTING or raises the existing
%      singleton*.
%
%      H = PLOTTING returns the handle to a new PLOTTING or the handle to
%      the existing singleton*.
%
%      PLOTTING('Property','Value',...) creates a new PLOTTING using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Plotting_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PLOTTING('CALLBACK') and PLOTTING('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PLOTTING.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to chiudi Plotting

% Last Modified by GUIDE v2.5 12-Feb-2012 18:23:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Plotting_OpeningFcn, ...
                   'gui_OutputFcn',  @Plotting_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Plotting is made visible.
function Plotting_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Plotting
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Plotting wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Plotting_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in SpeCod.
function SpeCod_Callback(hObject, eventdata, handles)


% Hint: get(hObject,'Value') returns toggle state of SpeCod


% --- Executes on button press in SpeGen.
function SpeGen_Callback(hObject, eventdata, handles)



% --- Executes on button press in SpeReg.
function SpeReg_Callback(hObject, eventdata, handles)



function MinPeriod_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of MinPeriod as text
%        str2double(get(hObject,'String')) returns contents of MinPeriod as a double
%Serve per assegnare il valore minimo dell'intervallo dei periodi



% --- Executes during object creation, after setting all properties.
function MinPeriod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MinPeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





% --- Executes on button press in CodLim.
function CodLim_Callback(hObject, eventdata, handles)


% --- Executes on button press in Deviazione.
function Deviazione_Callback(hObject, eventdata, handles)


function MaxPeriod_Callback(hObject, eventdata, handles)
% hObject    handle to MaxPeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxPeriod as text
%        str2double(get(hObject,'String')) returns contents of MaxPeriod as a double


% --- Executes during object creation, after setting all properties.
function MaxPeriod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxPeriod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in List_dutt.
function List_dutt_Callback(hObject, eventdata, handles)
%Si assegna il valore della duttilità per lo spettro
%set(handles.controllo,'String',num2str(handles.mu));



% --- Executes during object creation, after setting all properties.
function List_dutt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to List_dutt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%PRATICAMENTE IL PROGRAMMA INIZIA QUI !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% --- Executes on button press in Plot_spectra.
function Plot_spectra_Callback(hObject, eventdata, handles)
%Inizia la procedura di plottaggio degli spettri

%FISSA I LIMIMI PER I PERIODI DA MOSTRARE DELLO SPETTRO--------------------
%--------------------------------------------------------------------------
%Assegna il valore inferiore e superiore del range dei periodi
handles.Tmin = get(handles.MinPeriod,'String');
handles.Tmin = str2num(handles.Tmin);
handles.Tmax = get(handles.MaxPeriod,'String');
handles.Tmax = str2num(handles.Tmax);

if handles.Tmin >= handles.Tmax
    errordlg('ERROR: MIN PERIOD VALUE > MAX PERIOD VALUE');
    pause;
    handles.Tmin = 0;
    handles.Tmax = 4; 
end

%SI DECIDE O MENO SE MOSTRARE LA DEVIAZIONE STANDARD ED I LIMITI SPETTRALI
%--------------------------------------------------------------------------
%Capisce se si vogliono oppure no i limiti dello spettro +-10% per acc. e
%spostamento e -19 + 21% per l'energia
if get(handles.CodLim,'Value') == get(handles.CodLim,'Max')
    handles.mostraLim = 'On ';
elseif get(handles.CodLim,'Value') == get(handles.CodLim,'Min')
    handles.mostraLim = 'Off';
end

%Decide se si vuol plottare la deviazione standard o meno quando si riposta
%lo spettro generato e/o registrato
if get(handles.Deviazione,'Value') == get(handles.CodLim,'Max')
    handles.mostraDev = 'On ';
elseif get(handles.Deviazione,'Value') == get(handles.CodLim,'Min')
    handles.mostraDev = 'Off';
end

%FISSA I PARAMETRI PER QUALI SPETTRIMOSTRARE-------------------------------
%--------------------------------------------------------------------------
% Decide se mostrare lo spettro della Normativa o di riferimento
if get(handles.SpeCod,'Value') == get(handles.SpeCod,'Max')
    handles.mostraCod = 'On ';
elseif get(handles.SpeCod,'Value') == get(handles.SpeCod,'Min')
    handles.mostraCod = 'Off';
end

% Decide se mostrare lo spettro degli accelerogrammi generati
if get(handles.SpeGen,'Value') == get(handles.SpeGen,'Max')
    handles.mostraGen = 'On ';
elseif get(handles.SpeGen,'Value') == get(handles.SpeGen,'Min')
    handles.mostraGen = 'Off';
end

% Decide se mostrare lo spettro degli accelerogrammi generati
if get(handles.SpeReg,'Value') == get(handles.SpeReg,'Max')
    handles.mostraReg = 'On ';
elseif get(handles.SpeReg,'Value') == get(handles.SpeReg,'Min')
    handles.mostraReg = 'Off';
end

%DOvrebbe fissare la lista della duttilità (FINIRE)
%lista = [];
%dutti(1)
%for i = 1:4%max(size(dutti))
%    agg = ['Prova ',num2str(dutti(i))];
%    lista = [lista;agg];
%end
%set(handles.List_dutt,'String',lista)
%set(handles.List_dutt,'String') == (handles.lista,'String')
%Fissa le duttilità per cui plottare gli spettri. In default le prende
%tutte dato che parte da "All" primo valore della listra
if get(handles.List_dutt,'Value') == 1
    handles.mu = 0;
elseif get(handles.List_dutt,'Value') == 2
    handles.mu = 1;
elseif get(handles.List_dutt,'Value') == 3
    handles.mu = 2;
elseif get(handles.List_dutt,'Value') == 4
    handles.mu = 3;
elseif get(handles.List_dutt,'Value') == 5
    handles.mu = 4;
elseif get(handles.List_dutt,'Value') == 6
    handles.mu = 5;
elseif get(handles.List_dutt,'Value') == 7
    handles.mu = 6;
elseif get(handles.List_dutt,'Value') == 8
    handles.mu = 7;
elseif get(handles.List_dutt,'Value') == 9
    handles.mu = 8;
elseif get(handles.List_dutt,'Value') == 10
    handles.mu = 9;
elseif get(handles.List_dutt,'Value') == 11
    handles.mu = 10;
elseif get(handles.List_dutt,'Value') == 12
    handles.mu = 11;
elseif get(handles.List_dutt,'Value') == 13
    handles.mu = 12;
elseif get(handles.List_dutt,'Value') == 14
    handles.mu = 13;
elseif get(handles.List_dutt,'Value') == 15
    handles.mu = 14;
elseif get(handles.List_dutt,'Value') == 16
    handles.mu = 15;
end

%Si sceglie se impostare o meno la griglia sul grafico
if get(handles.Griglia,'Value') == get(handles.Griglia,'Min')
    handles.gri = 'Off';
elseif get(handles.Griglia,'Value') == get(handles.Griglia,'Max')
    handles.gri = 'On ';
end

%SI DECIDE O MENO SE MOSTRARE LA SCALA LOGARITMICA IN X E/O Y
%--------------------------------------------------------------------------
%Fissa la scala di x e/o y in scala logaritimica o meno
%Lo abbiamo per l'asse X
if get(handles.logax,'Value') == get(handles.logax,'Max')
    handles.mostraLogx = 'On ';
elseif get(handles.logax,'Value') == get(handles.logax,'Min')
    handles.mostraLogx = 'Off';
end
%Lo abbiamo per l'asse Y
if get(handles.logay,'Value') == get(handles.logay,'Max')
    handles.mostraLogy = 'On ';
elseif get(handles.logay,'Value') == get(handles.logay,'Min')
    handles.mostraLogy = 'Off';
end

%Imposta i settaggi per il grafici a video ed in output
Setup_graphics;
Setup_program;
Load_file;     %Carica i file presenti dentro la cartella \Input
Compute;       %Dai dati letti si calcola, dallo spostamento, acc. energia
Save_num;      %Salva sulla cartella \Output i file con la media e la dev.st. per le diverse m assunte 
Plot_spe_disp;  %Plotta a video gli spettri determinati di spostamento (con le selezioni fatte prima)
Plot_spe_acce;  %Plotta a video gli spettri determinati di accelerazione (con le selezioni fatte prima)
Plot_spe_ener;  %Plotta a video gli spettri determinati di energia (con le selezioni fatte prima)
Plot_spe_AD;    %Plotta a video gli spettri determinati di accelerazione-spostamento (con le selezioni fatte prima)
Plot_spe_ED;    %Plotta a video gli spettri determinati di energia-spostamento (con le selezioni fatte prima)

if get(handles.salva,'Value') == get(handles.salva,'Max') 
    Save_spe_disp;  %Salva nel file gli spettri determinati di spostamento (con le selezioni fatte prima)
    Save_spe_acce;  %Salva nel file gli spettri determinati di accelerazione (con le selezioni fatte prima)
    Save_spe_ener;  %Salva nel file gli spettri determinati di energia (con le selezioni fatte prima)
    Save_spe_AD;    %Salva nel file gli spettri determinati di accelerazione-spostamento (con le selezioni fatte prima)
    Save_spe_ED;    %Salva nel file gli spettri determinati di energia-spostamento (con le selezioni fatte prima)
end
%Se selezionato, salva i grafici nel file di Outpu\Generated e Outpu\Registered

%Permette di posizionare il cursore ed avere il relativo valore
if get(handles.Indicatore,'Value') == get(handles.Indicatore,'Max')
    datacursormode on
elseif get(handles.Indicatore,'Value') == get(handles.Indicatore,'Min')
    datacursormode off
end


%Serve per tirare fuori da questa routine le variabili e usarle per altre funzioni
handles.dutti = dutti;
handles.Tr = Tr;
handles.Sr = Sr;
handles.Ar = Ar;
handles.Er = Er;
handles.Tgen = Tgen;
handles.mediaSgen = mediaSgen;
handles.mediaAgen = mediaAgen;
handles.mediaEgen = mediaEgen;
handles.Treg = Treg;
handles.mediaSreg = mediaSreg;
handles.mediaAreg = mediaAreg;
handles.mediaEreg = mediaEreg;
handles.colorecod = colorecod;
handles.coloregen = coloregen;
handles.colorereg = colorereg;

guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function Plot_spectra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plot_spectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function Plot_spectra_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to Plot_spectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over Plot_spectra.
function Plot_spectra_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to Plot_spectra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function controllo_Callback(hObject, eventdata, handles)
% hObject    handle to controllo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of controllo as text
%        str2double(get(hObject,'String')) returns contents of controllo as a double


% --- Executes during object creation, after setting all properties.
function controllo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to controllo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in Griglia.
function Griglia_Callback(hObject, eventdata, handles)
% hObject    handle to Griglia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Griglia


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in Indicatore.
function Indicatore_Callback(hObject, eventdata, handles)
% hObject    handle to Indicatore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Indicatore


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in aiuto.
function aiuto_Callback(hObject, eventdata, handles)
% hObject    handle to aiuto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open ('Manual\Manual_program.doc');


% --- Executes on button press in chiudi.
function chiudi_Callback(hObject, eventdata, handles)
% E' la routine per chiudere in programma definitivamente
quit;


% --- Executes on button press in salva.
function salva_Callback(hObject, eventdata, handles)
% hObject    handle to salva (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of salva


% --- Executes on key press with focus on aiuto and none of its controls.
function aiuto_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to aiuto (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Parameters_Callback(hObject, eventdata, handles)
% hObject    handle to Parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ingrandisci.
function ingrandisci_Callback(hObject, eventdata, handles)
% hObject    handle to ingrandisci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom on;

% --- Executes on button press in resetta.
function resetta_Callback(hObject, eventdata, handles)
% hObject    handle to resetta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom out;


% --- Executes on button press in logax.
function logax_Callback(hObject, eventdata, handles)
% hObject    handle to logax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logax


% --- Executes on button press in logay.
function logay_Callback(hObject, eventdata, handles)
% hObject    handle to logay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of logay


% --- Executes on button press in dcod.
function dcod_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dello spostamento(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili uste prima
Tr = handles.Tr;
Sr = handles.Sr;
Ar = handles.Ar;
Er = handles.Er;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tr))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tr'];
end
z = Sr';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorecod);
title('Code Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('Displacement (D)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in dgen.
function dgen_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dello spostamento(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili uste prima
Tgen = handles.Tgen;
mediaSgen = handles.mediaSgen;
mediaAgen = handles.mediaAgen;
mediaEgen = handles.mediaEgen;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tgen))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tgen'];
end
z = mediaSgen';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.coloregen);
title('Generated Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('Displacement (D)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in dreg.
function dreg_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dello spostamento(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili uste prima
Treg = handles.Treg;
mediaSreg = handles.mediaSreg;
mediaAreg = handles.mediaAreg;
mediaEreg = handles.mediaEreg;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Treg))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Treg'];
end
z = mediaSreg';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorereg);
title('Registered Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('Displacement (D)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in adcod.
function adcod_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili uste prima
Tr = handles.Tr;
Sr = handles.Sr;
Ar = handles.Ar;
Er = handles.Er;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tr))
    x = [x,dutti];
end
y = Sr';
z = Ar';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorecod);
title('Code PsAcceleration vs. Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsAcceleration (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;



% --- Executes on button press in adgen.
function adgen_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili uste prima
Tgen = handles.Tgen;
mediaSgen = handles.mediaSgen;
mediaAgen = handles.mediaAgen;
mediaEgen = handles.mediaEgen;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tgen))
    x = [x,dutti];
end
y = mediaSgen';
z = mediaAgen';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.coloregen);
title('Generated PsAcceleration vs. Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsAcceleration (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in adreg.
function adreg_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili uste prima
Treg = handles.Treg;
mediaSreg = handles.mediaSreg;
mediaAreg = handles.mediaAreg;
mediaEreg = handles.mediaEreg;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Treg))
    x = [x,dutti];
end
y = mediaSreg';
z = mediaAreg';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorereg);
title('Registered PsAcceleration vs. Displacement Spectra','FontName','Cambria','FontSize',20) 
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsAcceleration (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;

% --- Executes on button press in acod.
function acod_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili usate prima
Tr = handles.Tr;
Sr = handles.Sr;
Ar = handles.Ar;
Er = handles.Er;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tr))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tr'];
end
z = Ar';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorecod);
title('Code PsAcceleration Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsAccelerazion (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in agen.
function agen_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili usate prima
Tgen = handles.Tgen;
mediaSgen = handles.mediaSgen;
mediaAgen = handles.mediaAgen;
mediaEgen = handles.mediaEgen;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tgen))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tgen'];
end
z = mediaAgen';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.coloregen);
title('Generated PsAcceleration Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsAcceleration (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in areg.
function areg_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili uste prima
Treg = handles.Treg;
mediaSreg = handles.mediaSreg;
mediaAreg = handles.mediaAreg;
mediaEreg = handles.mediaEreg;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Treg))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Treg'];
end
z = mediaAreg';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorereg);
title('Registered PsAcceleration Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsAcceleration (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;



% --- Executes on button press in edcod.
function edcod_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'energia(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili usate prima
Tr = handles.Tr;
Sr = handles.Sr;
Ar = handles.Ar;
Er = handles.Er;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tr))
    x = [x,dutti];
end
y = [ ];
y = Sr';
z = Er';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorecod);
title('Code PsEnergy vs. Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsE)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;



% --- Executes on button press in edgen.
function edgen_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'accelerazione(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili usate prima
Tgen = handles.Tgen;
mediaSgen = handles.mediaSgen;
mediaAgen = handles.mediaAgen;
mediaEgen = handles.mediaEgen;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tgen))
    x = [x,dutti];
end
y = mediaSgen';
z = mediaEgen';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.coloregen);
title('Generated PsEnergy vs. Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in edreg.
function edreg_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'energia(z) in
%funzione della duttilità(x) e dello spostamento(y)
%Qui richiama le variabili usate prima
Treg = handles.Treg;
mediaSreg = handles.mediaSreg;
mediaAreg = handles.mediaAreg;
mediaEreg = handles.mediaEreg;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Treg))
    x = [x,dutti];
end
y = mediaSreg';
z = mediaEreg';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorereg);
title('Registered PsEnergy vs. Displacement Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Displacement (D)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsA)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;




% --- Executes on button press in ecod.
function ecod_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'energia(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili usate prima
Tr = handles.Tr;
Sr = handles.Sr;
Ar = handles.Ar;
Er = handles.Er;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tr))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tr'];
end
z = Er';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorecod);
title('Code PsEnergy Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsE)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in egen.
function egen_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'energia(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili usate prima
Tgen = handles.Tgen;
mediaSgen = handles.mediaSgen;
mediaAgen = handles.mediaAgen;
mediaEgen = handles.mediaEgen;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Tgen))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Tgen'];
end
z = mediaEgen';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.coloregen);
title('Generated PsEnergy Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsE)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


% --- Executes on button press in ereg.
function ereg_Callback(hObject, eventdata, handles)
%Tale routine serve per visualizzare lo spettro 3D dell'energia(z) in
%funzione della duttilità(x) e del periodo(y)
%Qui richiama le variabili usate prima
Treg = handles.Treg;
mediaSreg = handles.mediaSreg;
mediaAreg = handles.mediaAreg;
mediaEreg = handles.mediaEreg;
dutti = handles.dutti;
%Prepara le matrici per plottare il grafico 3D
x = [ ];
for i = 1:max(size(Treg))
    x = [x,dutti];
end
y = [ ];
for j = 1:max(size(dutti));
    y = [y;Treg'];
end
z = mediaEreg';
figure(1);
mesh(x,y,z);
shading interp;
colormap(handles.colorereg);
title('Registered PsEnergy Spectra','FontName','Cambria','FontSize',20)
xlabel('Ductility (\mu)','FontName','Cambria','FontSize',15)
ylabel('Period (T)','FontName','Cambria','FontSize',15)
zlabel('PsEnergy (PsE)','FontName','Cambria','FontSize',15)
colorbar ('FontName','Cambria','FontSize',12);
view([1,1,3]);
rotate3d;


