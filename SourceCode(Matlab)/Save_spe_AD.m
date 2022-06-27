%QUI SI PLOTTANO GLI SPETTRI A VIDEO DELLE GRANDEZZE TROVATE. IN QUESTO
%FILE C'E' ANCHE LA SELEZIONE DI QUELLO CHE VA PLOTTATO
%INIZIA LA PROCEDURA
%SPETTRO DI ACCELERAZIONE/SPOSTAMENTO..................................................

%Qui imposta le caratteristiche generali+++++++++++++++++++++++++++++++++++
figure ('Visible','Off')
fi = figure (4);
axes('FontSize',ANSout,'FontName',FONTout);
%Cambia il font degli assi
xlabel ('Displacement [s]','FontSize',ASout,'FontName',FONTout);
ylabel ('PsAcceleration [g]','FontSize',ASout, 'FontName',FONTout);
%title ('Displacement vs. Period','FontName',FONTout,'FontSize',TSout);
%i+++++++++++++++++++++++++++++++++++i+++++++++++++++++++++++++++++++++++++

%Si decide se si vuole stampare lo spettro della Norma oppure no
if handles.mostraCod == 'On '
    %Se ho selezionato "All" allora plotta tutte le duttilità
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di accelerazione uno per uno 
            hold on;
            plot(Sr(:,i),Ar(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limite +-10% (-19 e +21% per l'energia)
            if handles.mostraLim == 'On '
                plot(1.1*Sr(:,i),1.1*Ar(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                plot(0.9*Sr(:,i),0.9*Ar(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di acc-spostamento solo per la duttilità fissata
        hold on;
        %Se almeno uno spettro generato/registrato è plottato lo spettro
        %della norma diventa nero
        if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
            plot(Sr(:,mostramu),Ar(:,mostramu),'-','LineWidth',LT1out,'Color','k')   
        %Se entrambi gli spettri generati e registrati NON sono plottati lo spettro
        %della norma diventa del colore relativo
        elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
            plot(Sr(:,mostramu),Ar(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        end
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraLim == 'On '
            %Se NON ho solo lo spettro da Norma l'intervallo è plottato in nero
            %tratteggiato
            if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
                plot(1.1*Sr(:,mostramu),1.1*Ar(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore+10%
                plot(0.9*Sr(:,mostramu),0.9*Ar(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore-10%
            %Altrimenti se ho solo lo spettro da Norma anche l'intervallo è
            %colorato del relativo colore della duttilità
            elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
                plot(1.1*Sr(:,mostramu),1.1*Ar(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
                plot(0.9*Sr(:,mostramu),0.9*Ar(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
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
            plot(mediaSgen(:,i),mediaAgen(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(mediaSgen(:,i)+deviaSgen(:,i),mediaAgen(:,i)+deviaAgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+dev.st.
                plot(mediaSgen(:,i)-deviaSgen(:,i),mediaAgen(:,i)-deviaAgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(mediaSgen(:,mostramu),mediaAgen(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(mediaSgen(:,mostramu)+deviaSgen(:,mostramu),mediaAgen(:,mostramu)+deviaAgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
            plot(mediaSgen(:,mostramu)-deviaSgen(:,mostramu),mediaAgen(:,mostramu)-deviaAgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
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
            plot(mediaSreg(:,i),mediaAreg(:,i),'-','LineWidth',LT1out,'Color',Colore(i+1,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(mediaSreg(:,i)+deviaSreg(:,i),mediaAreg(:,i)+deviaAreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore+dev.st.
                plot(mediaSreg(:,i)-deviaSreg(:,i),mediaAreg(:,i)-deviaAreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilità fissata
        hold on;
        plot(mediaSreg(:,mostramu),mediaAreg(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu+1,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(mediaSreg(:,mostramu)+deviaSreg(:,mostramu),mediaAreg(:,mostramu)+deviaAreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore+10%
            plot(mediaSreg(:,mostramu)-deviaSreg(:,mostramu),mediaAreg(:,mostramu)-deviaAreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore-10%
        end
        
    end
end


%Decide se visualizzare la griglia o meno sui grafici
if handles.gri == 'On ';
    grid;
    hold on;
end

%Qui salva il grafico sul file e chiude la figura++++++++++++++++++++++++++
saveas(fi,'Output\Graphics\PsA-D.bmp');
close(fi);
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++










