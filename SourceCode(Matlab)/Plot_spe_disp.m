%ATTENZIONE: IN QUESTO FILE (E SOLO IN QUESTO) SONO PRESENTI IN COMANDI PER
%SELEZINARE IL GRAFICO CON LE X E/O LE Y IN SCALA LOGARITMICA.
%SULL'INTERFACCIA GRAFICA TALI COMANDI NON HANNO EFFETTO E NON RIESCO A
%CAPIERE PERCHE' DATO CHE SE SI FA IL CICLO A PARTE TUTTO TORNA.
%APPROFONDIRE TALE ASPETTO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



%QUI SI PLOTTANO GLI SPETTRI A VIDEO DELLE GRANDEZZE TROVATE. IN QUESTO
%FILE C'E' ANCHE LA SELEZIONE DI QUELLO CHE VA PLOTTATO
%INIZIA LA PROCEDURA
%SPETTRO DI SPOSTAMENTO....................................................
%Si decide se plottare lo spettro della Norma oppure no
%Prende il grafico e lo azzera
axes(handles.axes1);
cla reset;
%Si decide se si vuole stampare lo spettro della Norma oppure no
if handles.mostraCod == 'On '
    %Se ho selezionato "All" allora plotta tutte le duttilità
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di spostamento uno per uno 
            hold on;
            if and(handles.mostraLogx == 'Off',handles.mostraLogy == 'Off')
                plot(Tr,Sr(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:));
                hold on;
                if handles.mostraLim == 'On '
                    plot(Tr,1.1*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                    plot(Tr,0.9*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
                end
            elseif and(handles.mostraLogx == 'On ',handles.mostraLogy == 'Off')
                semilogx(Tr,Sr(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:));
                hold on;
                if handles.mostraLim == 'On '
                    semilogx(Tr,1.1*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                    semilogx(Tr,0.9*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
                end
            elseif and(handles.mostraLogx == 'Off',handles.mostraLogy == 'On ')
                semilogy(Tr,Sr(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:));
                hold on;
                if handles.mostraLim == 'On '
                    semilogy(Tr,1.1*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                    semilogy(Tr,0.9*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
                end
            elseif and(handles.mostraLogx == 'On ',handles.mostraLogy == 'On ')
                loglog(Tr,Sr(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:));
                hold on;
                if handles.mostraLim == 'On '
                    loglog(Tr,1.1*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                    loglog(Tr,0.9*Sr(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
                end
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        %Se almeno uno spettro generato/registrato è plottato lo spettro
        %della norma diventa nero
        if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
            if and(handles.mostraLogx == 'Off',handles.mostraLogy == 'Off')
                plot(Tr,Sr(:,mostramu),'-','LineWidth',LT1out,'Color','k')   
                %Se entrambi gli spettri generati e registrati NON sono
                %plottati lo spettro
            elseif and(handles.mostraLogx == 'On ',handles.mostraLogy == 'Off')
                semilogx(Tr,Sr(:,mostramu),'-','LineWidth',LT1out,'Color','k')   
            elseif and(handles.mostraLogx == 'Off',handles.mostraLogy == 'On ')
                semilogy(Tr,Sr(:,mostramu),'-','LineWidth',LT1out,'Color','k') 
            elseif and(handles.mostraLogx == 'On ',handles.mostraLogy == 'On ')
                loglog(Tr,Sr(:,mostramu),'-','LineWidth',LT1out,'Color','k')    
            end
                %della norma diventa del colore relativo
            elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
                if and(handles.mostraLogx == 'Off',handles.mostraLogy == 'Off')
                    plot(Tr,Sr(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
                end
        end
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraLim == 'On '
            %Se NON ho solo lo spettro da Norma l'intervallo è plottato in nero
            %tratteggiato
            if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
                plot(Tr,1.1*Sr(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore+10%
                plot(Tr,0.9*Sr(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore-10%
            %Altrimenti se ho solo lo spettro da Norma anche l'intervallo è
            %colorato del relativo colore della duttilità
            elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
                plot(Tr,1.1*Sr(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
                plot(Tr,0.9*Sr(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
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
            plot(Tgen,mediaSgen(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(Tgen,mediaSgen(:,i)+deviaSgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+dev.st.
                plot(Tgen,mediaSgen(:,i)-deviaSgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(Tgen,mediaSgen(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(Tgen,mediaSgen(:,mostramu)+deviaSgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
            plot(Tgen,mediaSgen(:,mostramu)-deviaSgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
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
            plot(Treg,mediaSreg(:,i),'-','LineWidth',LT1out,'Color',Colore(i+1,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(Treg,mediaSreg(:,i)+deviaSreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore+dev.st.
                plot(Treg,mediaSreg(:,i)-deviaSreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(Treg,mediaSreg(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu+1,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(Treg,mediaSreg(:,mostramu)+deviaSreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore+10%
            plot(Treg,mediaSreg(:,mostramu)-deviaSreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore-10%
        end
        
    end
end

%Decide se visualizzare la griglia o meno sui grafici
if handles.gri == 'On ';
    grid;
    hold on;
end

%Se i limiti non sono stati cambiati prende quelli in defalut
if handles.Tmin >= handles.Tmax
    xlim([0.00  4.00]);
%Altrimenti da i limiti impostati
elseif handles.Tmin < handles.Tmax
    xlim([handles.Tmin  handles.Tmax]);
end
%Cambia il font degli assi
set(handles.axes1,'FontName','Cambria');
xlabel ('T [s]');
ylabel ('D [m]');










