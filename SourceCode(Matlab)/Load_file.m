%Procedure LOAD DATABASE
%This procedure loads, for each 7 time history in database, Sd
%spectra for different ductility values.

%Reading of ductility values from file Ductility.txt
fileread = fopen ('Input\Ductility.txt','r');
dutti = fscanf (fileread,'%g',[1,inf]);
fclose(fileread);
nodutti = max(size(dutti));
dutti = dutti';

%GENERATI------------------------------------------------------------------
%Legge le informazioni relative agli spettri generati
fileread = fopen ('Input\Generated\NameGen.txt','r');
%Legge il nome dei sismi nella cartella e li conta 
namegen = fscanf (fileread,'%4s',[4,inf]);
fclose(fileread);
namegen = namegen';
size(namegen);
noeqgen = ans(1,1);
%Tale routine genera una matrice cubica in cui si hanno nelle righe i
%valori che variano con la duttilità (colonne) e con i numero di sisma
%(3° coordinata della matrice). Il tutto è per spettri generati
for i = 1:noeqgen
    fileread = fopen (['Input\Generated\',namegen(i,:),'.dat'],'r');
    %legge le informazioni dell'iesimo file
    comodo = fscanf (fileread,'%g',[2*nodutti,inf]);
    comodo = comodo';
    fclose(fileread);
    %Tira fuori il periodo degli spettri
    Tgen = comodo(:,1);
    %Converte gli spettri in m/s
    comodo = comodo*0.0254;
    for j = 1:nodutti
        comodo(:,2*nodutti-(2*j-1)) = [ ];
    end
    Sgen(:,:,i) = comodo;
end
%Calcola quanti valori spettrali generati considerati
size(Tgen);
noTgen = ans(1,1);


%REGISTRATI----------------------------------------------------------------
%Legge le informazioni relative agli spettri registrati
fileread = fopen ('Input\Registered\NameReg.txt','r');
%Legge il nome dei sismi nella cartella e li conta 
namereg = fscanf (fileread,'%4s',[4,inf]);
fclose(fileread);
namereg = namereg';
size(namereg);
noeqreg = ans(1,1);
%Tale routine genera una matrice cubica in cui si hanno nelle righe i
%valori che variano con la duttilità (colonne) e con i numero di sisma
%(3° coordinata della matrice). Il tutto è per spettri registrati
for i = 1:noeqreg
    fileread = fopen (['Input\Registered\',namereg(i,:),'.dat'],'r');
    %legge le informazioni dell'iesimo file
    comodo = fscanf (fileread,'%g',[2*nodutti,inf]);
    comodo = comodo';
    fclose(fileread);
    %Tira fuori il periodo degli spettri
    Treg = comodo(:,1);
    %Converte gli spettri in m/s
    comodo = comodo*0.0254;
    for j = 1:nodutti
        comodo(:,2*nodutti-(2*j-1)) = [ ];
    end
    Sreg(:,:,i) = comodo;
end
%Calcola quanti valori spettrali registrati considera
size(Treg);
noTreg = ans(1,1);        


%Legge i file degli spettri di riferimento dati da quelli Normativi scalati
%con Newmark-Hall e Miranda
fileread = fopen ('Input\Reference\Refe_Sa.txt','r');
Ar = fscanf (fileread,'%g',[nodutti+1,inf]);
fclose(fileread);
Ar = Ar';
Tr = Ar(:,1);
Ar(:,1) = [ ];

fileread = fopen ('Input\Reference\Refe_Sd.txt','r');
Sr = fscanf (fileread,'%g',[nodutti+1,inf]);
fclose(fileread);
Sr = Sr';
Sr(:,1) = [ ];

fileread = fopen ('Input\Reference\Refe_PsE.txt','r');
Er = fscanf (fileread,'%g',[nodutti+1,inf]);
fclose(fileread);
Er = Er';
Er(:,1) = [ ];



