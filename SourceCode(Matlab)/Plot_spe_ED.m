%QUI SI PLOTTANO GLI SPETTRI A VIDEO DELLE GRANDEZZE TROVATE. IN QUESTO
%FILE C'E' ANCHE LA SELEZIONE DI QUELLO CHE VA PLOTTATO
%INIZIA LA PROCEDURA
%SPETTRO DI ENERGIA/SPOSTAMENTO..................................................
%Si decide se plottare lo spettro della Norma oppure no
%Prende il grafico e lo azzera
axes(handles.axes5);
cla reset;
%Si decide se si vuole stampare lo spettro della Norma oppure no
if handles.mostraCod == 'On '
    %Se ho selezionato "All" allora plotta tutte le duttilità
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di accelerazione uno per uno 
            hold on;
            plot(Sr(:,i),Er(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limite +-10% (-19 e +21% per l'energia)
            if handles.mostraLim == 'On '
                plot(1.1*Sr(:,i),1.21*Er(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                plot(0.9*Sr(:,i),0.81*Er(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di acc-spostamento solo per la duttilità fissata
        hold on;
        %Se almeno uno spettro generato/registrato è plottato lo spettro
        %della norma diventa nero
        if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
            plot(Sr(:,mostramu),Er(:,mostramu),'-','LineWidth',LT1out,'Color','k')   
        %Se entrambi gli spettri generati e registrati NON sono plottati lo spettro
        %della norma diventa del colore relativo
        elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
            plot(Sr(:,mostramu),Er(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        end
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraLim == 'On '
            %Se NON ho solo lo spettro da Norma l'intervallo è plottato in nero
            %tratteggiato
            if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
                plot(1.1*Sr(:,mostramu),1.21*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore+10%
                plot(0.9*Sr(:,mostramu),0.81*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore-10%
            %Altrimenti se ho solo lo spettro da Norma anche l'intervallo è
            %colorato del relativo colore della duttilità
            elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
                plot(1.1*Sr(:,mostramu),1.21*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
                plot(0.9*Sr(:,mostramu),0.81*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
            end
        end
    end
end
%Si decide se plottare lo spettro dei Generati oppure no
if handles.mostraGen == 'On '
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di spostamento uno per uno 
            hold on;
            plot(mediaSgen(:,i),mediaEgen(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(mediaSgen(:,i)+deviaSgen(:,i),mediaEgen(:,i)+deviaEgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+dev.st.
                plot(mediaSgen(:,i)-deviaSgen(:,i),mediaEgen(:,i)-deviaEgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(mediaSgen(:,mostramu),mediaEgen(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(mediaSgen(:,mostramu)+deviaSgen(:,mostramu),mediaEgen(:,mostramu)+deviaEgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
            plot(mediaSgen(:,mostramu)-deviaSgen(:,mostramu),mediaEgen(:,mostramu)-deviaEgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
        end
        
    end
end

%Si decide se plottare lo spettro dei Registrati oppure no
if handles.mostraReg == 'On '
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di spostamento uno per uno 
            hold on;
            plot(mediaSreg(:,i),mediaEreg(:,i),'-','LineWidth',LT1out,'Color',Colore(i+1,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(mediaSreg(:,i)+deviaSreg(:,i),mediaEreg(:,i)+deviaEreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore+dev.st.
                plot(mediaSreg(:,i)-deviaSreg(:,i),mediaEreg(:,i)-deviaEreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(mediaSreg(:,mostramu),mediaEreg(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu+1,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(mediaSreg(:,mostramu)+deviaSreg(:,mostramu),mediaEreg(:,mostramu)+deviaEreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore+10%
            plot(mediaSreg(:,mostramu)-deviaSreg(:,mostramu),mediaEreg(:,mostramu)-deviaEreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore-10%
        end
        
    end
end


%Decide se visualizzare la griglia o meno sui grafici
if handles.gri == 'On ';
    grid;
    hold on;
end

%Se i limiti non sono stati cambiati prende quelli in defalut
%if handles.Tmin >= handles.Tmax
%    xlim([0.00  4.00]);
%Altrimenti da i limiti impostati
%elseif handles.Tmin < handles.Tmax
%    xlim([handles.Tmin  handles.Tmax]);
%end
%Cambia il font degli assi
set(handles.axes5,'FontName','Cambria');
xlabel ('D [m]');
ylabel ('PsE [m\cdotg]');










