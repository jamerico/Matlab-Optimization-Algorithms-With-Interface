function varargout = buscaMinimosGUI(varargin)
% BUSCAMINIMOSGUI MATLAB code for buscaMinimosGUI.fig
%      BUSCAMINIMOSGUI, by itself, creates a new BUSCAMINIMOSGUI or raises the existing
%      singleton*.
%
%      H = BUSCAMINIMOSGUI returns the handle to a new BUSCAMINIMOSGUI or the handle to
%      the existing singleton*.
%
%      BUSCAMINIMOSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUSCAMINIMOSGUI.M with the given input arguments.
%
%      BUSCAMINIMOSGUI('Property','Value',...) creates a new BUSCAMINIMOSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before buscaMinimosGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to buscaMinimosGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help buscaMinimosGUI

% Last Modified by GUIDE v2.5 31-Jan-2016 13:18:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @buscaMinimosGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @buscaMinimosGUI_OutputFcn, ...
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



% --- Executes just before buscaMinimosGUI is made visible.
function buscaMinimosGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to buscaMinimosGUI (see VARARGIN)




% Choose default command line output for buscaMinimosGUI
handles.output = hObject;



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes buscaMinimosGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = buscaMinimosGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




function enterTolTxt_Callback(hObject, eventdata, handles)
% hObject    handle to enterTolTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enterTolTxt as text
%        str2double(get(hObject,'String')) returns contents of enterTolTxt as a double
handles.tolerancia = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function enterTolTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enterTolTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.tolerancia = str2double(get(hObject,'String'));
guidata(hObject,handles);



function enterMaxIntTxt_Callback(hObject, eventdata, handles)
% hObject    handle to enterMaxIntTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enterMaxIntTxt as text
%        str2double(get(hObject,'String')) returns contents of enterMaxIntTxt as a double


% --- Executes during object creation, after setting all properties.
handles.maxinteracao = str2double(get(hObject,'String'));
guidata(hObject,handles);

function enterMaxIntTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enterMaxIntTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.maxinteracao = str2double(get(hObject,'String'));
guidata(hObject,handles);



function vetorInicial_Callback(hObject, eventdata, handles)
% hObject    handle to vetorInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vetorInicial as text
%        str2double(get(hObject,'String')) returns contents of vetorInicial as a double


% --- Executes during object creation, after setting all properties.
display('current vetor inicial')
handles.pontoInicial = str2num(get(hObject,'String'));
display(handles.pontoInicial)
guidata(hObject,handles);



function vetorInicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vetorInicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%handles.pontoInicial = [-3 3];
handles.pontoInicial = str2num(get(hObject,'String'));
guidata(hObject,handles);



% --- Executes on button press in histGraphBool.
function histGraphBool_Callback(hObject, eventdata, handles)
% hObject    handle to histGraphBool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of histGraphBool

handles.graphHistBool = get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on selection change in metodosPopup.
function metodosPopup_Callback(hObject, eventdata, handles)
% hObject    handle to metodosPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns metodosPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from metodosPopup

contents = cellstr(get(hObject,'String'));
handles.metodos = contents{get(hObject,'Value')};
guidata(hObject,handles);


    




% --- Executes during object creation, after setting all properties.
function metodosPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to metodosPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%listaMetodos = strvcat('Aurea', 'Fibonacci', 'Interpolacao')
%set(hObject,'String', listaMetodos);

handles.contents = cellstr(get(hObject,'String'));
handles.metodos = handles.contents{get(hObject,'Value')};
guidata(hObject,handles);





function enterMaxIntervalTxt_Callback(hObject, eventdata, handles)
% hObject    handle to enterMaxIntervalTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enterMaxIntervalTxt as text
%        str2double(get(hObject,'String')) returns contents of enterMaxIntervalTxt as a double
handles.maxinterval = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function enterMaxIntervalTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enterMaxIntervalTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.maxinterval = str2double(get(hObject,'String'));

guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function graph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate graph
% 
%  t = linspace(-10,10,1000);
% %  handles.y = nan(1,1000);
% 
%  yy = sin(t);
%  handles.graph1 = plot(handles.t,yy);

 %set(handles.graph1, 'xdata',linspace(-10,10,1000),'ydata', handles.yy);
%  drawnow;
 guidata(hObject,handles);



% --- Executes on button press in goButton.
function goButton_Callback(hObject, eventdata, handles)
% hObject    handle to goButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%--------------------------------------------------------------
handles.intervalo = handles.vetorIntervalo;
pontoInicialDimension = size(handles.pontoInicial);

%Verificar se a funcao tem dimensao 1. Se sim, não precisa se preocupar com
%ponto inicial. Caso contrário, verifica se a dimensão da funcao está
%consistente com a dimensão do vetor ponto inicial.
%--------------------------------------------------------------
if handles.functionDimension(1)~=1&&handles.functionDimension(1)~=pontoInicialDimension(2)
    disp('---')
    disp(handles.functionDimension(1))
    disp(pontoInicialDimension(2))
    msgbox('O vetor inical está com a dimensão incorreta')
end
%--------------------------------------------------------------    

hold off

tic
switch handles.metodos
    
    case 'Aurea'
        display('To aqui')
               
        [xMin,fMin,k] = aurea4(handles.funcao,handles.tolerancia,handles.intervalo,handles.graphHistBool,handles.maxinteracao)
        
    case 'Fibonacci'
        
        [xMin,fMin,k] = Fibo_Ph(handles.funcao,handles.tolerancia,handles.intervalo,handles.graphHistBool,handles.maxinteracao)
               
    case 'Interpolacao'

        [xMin,fMin,k] = intpol_henrique(handles.funcao,handles.tolerancia,handles.intervalo,handles.maxinteracao,handles.graphHistBool);

    case 'Gradiente'
        [xMin,fMin,k, historico] = Gradiente(handles.funcao,transpose(handles.pontoInicial),handles.tolerancia,handles.tolerancia,handles.maxinteracao);


    case 'Gradiente Conjugado-PR'
        %x5 = 0 POLAkQUE RIBIERE, x5 = 1, flatchi and rivers 
        [xMin,fMin,k, historico] = Gradconj_henrique(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.maxinteracao,0);
        xMin = transpose(xMin); %correcao de retorno. 
        
    case 'Gradiente Conjugado-FR'
        [xMin,fMin,k, historico] = Gradconj_henrique(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.maxinteracao,1);
         xMin = transpose(xMin);
         
    case 'Newton'
        [xMin,fMin,k, historico] = NewtonPH(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.maxinteracao,1);
     
    case 'Newton Modificado'
        [xMin,fMin,k, historico] = NewtonModPh(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.maxinteracao,1);

    case 'Quase Newton-DFP'
        [xMin,fMin,k, historico] = quase_newton(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.tolerancia,handles.maxinteracao,1);
        xMin = transpose(xMin);%correcao de retorno. 
        
    case 'Quase Newton-BFGS'
        [xMin,fMin,k, historico] = quase_newton(handles.funcao,handles.pontoInicial,handles.tolerancia,handles.tolerancia,handles.maxinteracao,2);
        xMin = transpose(xMin); %correcao de retorno. 
        
    case 'HookeAndJeeves'
        disp(num2str(handles.pontoInicial))
        [xMin, fMin, k, historico] = Hooke(handles.funcao, handles.pontoInicial, 10, handles.tolerancia, handles.maxinteracao)
        xMin = transpose(xMin);
    case 'Genetico'
        handles.NSobreviventes = 5;
        [xMin, fMin, k, historico, historico2] = EstratEvol(handles.funcao, handles.pontoInicial,handles.tolerancia, handles.maxinteracao, 100, handles.NSobreviventes, 0.5, 1);
        xMin = transpose(xMin);
end
elapsedTime = toc;
hold off

switch handles.functionDimension(1)
    
    case 2;
        %---------------------------------------------
        %Se tem intervalo suficiente = plota no intervalo. Se não, plota
        %default.
        plotdefault = size(handles.vetorIntervalo)
        if plotdefault(2) == 4 
            ezmesh(handles.funcao,handles.vetorIntervalo);
        else
            ezmesh(handles.funcao);
        end
        %---------------------------------------------
        %Plot dos vetores
        %---------------------------------------------
        %Setup Inicial e plot de primeiro e ultimo ponto
        hold on
        aux2 = size(historico);
        sizeHist = aux2(2);
        
        plot3(historico(1),historico(2),historico(3), 'r-o'); %ponto inicial
        hold on
        plot3(historico(sizeHist-2), historico(sizeHist-1),historico(sizeHist),'b-o','LineWidth',2); %ponto final
       %---------------------------------------------
       %plota os vetores caso HistBool ==1.
        
        i=1;
        if handles.graphHistBool==1
            while i+5<=(sizeHist)
                p0 = [historico(i+0) historico(i+1) historico(i+2)];
                p1 = [historico(i+3) historico(i+4) historico(i+5)];
                i=i+3;
                
                
                vectarrow(p0,p1)
                
                hold on
            end
        end
        
        if strcmp(handles.metodos,'Genetico')
        
            aux2 = size(historico2);
            sizeHist = aux2(2);
            hold on
            %------------------------------ plot dos sobreviventes
            
                %plot3(historicoBom(1),historicoBom(2),historicoBom(3), 'r-o')
                i=1
                ii = 1;
                while i+5<=sizeHist
                    p3 = [historico2(i+0) historico2(i+1) historico2(i+2)];
                    %p1 = [historicoBom(i+3) historicoBom(i+4) historicoBom(i+5)];
                    %plot(p0,'r-o')
                    
                    %p1 = [historicoRuim(i+0) historicoRuim(i+1) historicoRuim(i+2)];
                    pos = (i-1)/3+1
                    if mod(pos,handles.NSobreviventes)==0
                        ii = ii+1 %avança para a proxima geracao
                    end
                    
                    
                    
                    switch ii
                        case 1
                            plot3(p3(1),p3(2),p3(3),'bo','LineWidth',2)
                            %plot(p1,'b-o')
                        case 2
                            plot3(p3(1),p3(2),p3(3),'co','LineWidth',2)
                            %plot(p1,'g-o')
                        case 3
                            plot3(p3(1),p3(2),p3(3),'go','LineWidth',2)
                            %plot(p1,'y-o')
                        case 4
                            plot3(p3(1),p3(2),p3(3),'yo','LineWidth',2)
                            %plot(p1,'m-o')
                        case 5
                            plot3(p3(1),p3(2),p3(3),'go','LineWidth',2)
                            %plot(p0,'c-o')
                        otherwise
                            plot3(p3(1),p3(2),p3(3),'go','LineWidth',2)
                            %plot(p0,'c-o')
                    end
                    
                    %vectarrow(p0,p1)
                    hold on
                    i=i+3

                    
                
            end
        end
               
        %---------------------------------------------
        %plot dos resultados em forma de texto
        
        string0 = strcat('Função:', {' '}, handles.funcao);
        string1 = strcat('Método utilizado:',{' '}, handles.metodos);
        string2 = strcat('O Mínimo é:',{' '}, strcat('[',num2str(transpose(xMin)),']'))
        string3 = strcat('F(mínimo):', {' '}, num2str(double(fMin)));
        string4 = strcat('Iterações:', {' '}, num2str(k));
        string5 = strcat('Tempo de Proc (s):', {' '}, num2str(elapsedTime));
        string6 = strcat('Vetor Inicial:', {' '}, strcat('[',num2str(handles.pontoInicial),']'))
        string7 = strcat('Tolerância', {' '}, num2str(handles.tolerancia));
        string8 = '-----------------------------'
        
        stringFinal = [string0 string1 string2 string3 string4 string5 string6 string7 string8]';
        textoAtual = get(handles.resultadosTxt,'String')
        
        textoNovo = [stringFinal;textoAtual]
        %textoNovo = stringFinal;
        set(handles.resultadosTxt,'String',textoNovo);
        
       
        %---------------------------------------------
        
        
        
        
    case 1
        
        
        %--------------------------------------------- 
        %Resultados em forma de texto para funcoes unidimensionais
        string0 = strcat('Função:', {' '}, handles.funcao);
        string1 = strcat('Método utilizado:',{' '}, handles.metodos);
        string2 = strcat('O Mínimo é:',{' '},num2str(xMin));
        string3 = strcat('F(mínimo)', {' '}, num2str(fMin));
        string4 = strcat('Iterações', {' '}, num2str(k));
        string5 = strcat('Tempo de Proc (s):', {' '}, num2str(elapsedTime));
        string6 = strcat('Intervalo:', {' '}, strcat('[',num2str(handles.intervalo),']'));
        string7 = strcat('Tolerância', {' '}, num2str(handles.tolerancia));
        string8 = '-----------------------------'
        
        stringFinal = [string0 string1 string2 string3 string4 string5 string6 string7 string8]';
        textoAtual = get(handles.resultadosTxt,'String')
        
        textoNovo = [stringFinal;textoAtual]
        set(handles.resultadosTxt,'String',textoNovo);

        
end



function resultadosTxt_Callback(hObject, eventdata, handles)
% hObject    handle to resultadosTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultadosTxt as text
%        str2double(get(hObject,'String')) returns contents of resultadosTxt as a double


% --- Executes during object creation, after setting all properties.
function resultadosTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultadosTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function funcaoTxt_Callback(hObject, eventdata, handles)
% hObject    handle to funcaoTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcaoTxt as text
%        str2double(get(hObject,'String')) returns contents of funcaoTxt as a double
handles.funcao = get(hObject,'String')
display('functionDimension')
handles.functionDimension = size(symvar(handles.funcao))
display(handles.functionDimension)

if handles.functionDimension(1)>1
    listaMetodos = strvcat('Gradiente', 'Gradiente Conjugado-PR', 'Gradiente Conjugado-FR','Newton', 'Newton Modificado', 'Quase Newton-DFP', 'HookeAndJeeves', 'Genetico')
    set(handles.metodosPopup, 'value', 1);
    set(handles.metodosPopup,'String', listaMetodos);
    %Primeiro método selecionado por default
    handles.metodos = 'Gradiente'
    
   
    
else
    listaMetodos = strvcat('Aurea', 'Fibonacci', 'Interpolacao')
    set(handles.metodosPopup, 'value', 1);
    set(handles.metodosPopup,'String', listaMetodos);
    
    %Primeiro método selecionado por default
    handles.metodos = 'Aurea'
end


guidata(hObject,handles);





% --- Executes during object creation, after setting all properties.
function funcaoTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcaoTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.funcao=get(hObject,'String');
handles.functionDimension = size(symvar(handles.funcao));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function histGraphBool_CreateFcn(hObject, eventdata, handles)
% hObject    handle to histGraphBool (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles.graphHistBool = get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.resultadosTxt,'String','');


% --- Executes on button press in botaoPlot.
function botaoPlot_Callback(hObject, eventdata, handles)
% hObject    handle to botaoPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold off
if handles.functionDimension(1)==1
    plotdefault = size(handles.vetorIntervalo)
    if plotdefault(2) == 2
        k = handles.vetorIntervalo(1):0.1:handles.vetorIntervalo(2);
        x = symvar(handles.funcao);
        funcao = subs(handles.funcao,x,k);
        plot(k,funcao)
    else
        k = -10:0.1:10;
        x = symvar(handles.funcao);
        funcao = subs(handles.funcao,x,k);
        plot(k,funcao)
    end
        
    
elseif handles.functionDimension(1)==2
    plotdefault = size(handles.vetorIntervalo)
    if plotdefault(2) == 4
        ezmesh(handles.funcao,handles.vetorIntervalo);
    else
        ezmesh(handles.funcao);
    end
    
else
    msgbox(strvcat('ERRO:42','Impossível plotar: dimensão >3'));    
end
guidata(hObject,handles);


%[xMin,fMin,k] = intpol_henrique(handles.funcao,handles.tolerancia,handles.intervalo,handles.maxinteracao,handles.graphHistBool)

% --- Executes on selection change in popupDimensao.
function popupDimensao_Callback(hObject, eventdata, handles)
% hObject    handle to popupDimensao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupDimensao contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupDimensao
contents = cellstr(get(hObject,'String'))
handles.dimensao = contents{get(hObject,'Value')}

% --- Executes during object creation, after setting all properties.
function popupDimensao_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupDimensao (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
contents = cellstr(get(hObject,'String'));
handles.dimensao = contents{get(hObject,'Value')}
guidata(hObject,handles);



function intervalo_Callback(hObject, eventdata, handles)
% hObject    handle to intervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of intervalo as text
%        str2double(get(hObject,'String')) returns contents of intervalo as a double
handles.vetorIntervalo = str2num(get(hObject,'String'))
display(handles.vetorIntervalo)
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function intervalo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to intervalo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.vetorIntervalo = str2num(get(hObject,'String'));
guidata(hObject,handles);
