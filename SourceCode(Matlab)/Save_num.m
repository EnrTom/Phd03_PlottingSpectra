%Salva tutti gli spettri medi e la relativa deviazione standar in un file
%di testo per poter essere riutilizzati

%Sono le impostazioni generali del titolo e del formato
title = [ '   Period    '];
separa = ['------------'];
formato = ['%10.5f'];
for j = 1:nodutti
    title =   [title,'m = ',num2str(dutti(j)),'   '];
    separa = [separa,'-----------'];
    formato = [formato,' %10.6f'];
end
formato = [formato,' \r\n'];


%Lo fa per i generati -----------------------------------------------------
%Salvataggio per spettri medi per lo spostamento
fileout = fopen ('Output\Generated\Mean_Disp.txt','w');
fprintf (fileout,'%s\r\n','MEAN DISPLACEMENT [m] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,mediaSgen]');
fclose (fileout);
%Salvataggio per spettri dev.st. per lo spostamento
fileout = fopen ('Output\Generated\StDev_Disp.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION DISPLACEMENT [m] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,deviaSgen]');
fclose (fileout);


%Salvataggio per spettri medi per l'accelerazione
fileout = fopen ('Output\Generated\Mean_Acc.txt','w');
fprintf (fileout,'%s\r\n','MEAN PSEUDO-ACCELERATION [g] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,mediaAgen]');
fclose (fileout);
%Salvataggio per spettri dev.st. per l'accelerazione
fileout = fopen ('Output\Generated\StDev_Acc.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION PSEUDO-ACCELERATION [g] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,deviaAgen]');
fclose (fileout);


%Salvataggio per spettri medi per l'energia
fileout = fopen ('Output\Generated\Mean_Ener.txt','w');
fprintf (fileout,'%s\r\n','MEAN PSEUDO-ENERGY [m.g] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,mediaEgen]');
fclose (fileout);
%Salvataggio per spettri dev.st. per l'energia
fileout = fopen ('Output\Generated\StDev_Ener.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION PSEUDO-ENERGY [m.g] - GENERATED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Tgen,deviaEgen]');
fclose (fileout);





%Lo fa per i registrati -----------------------------------------------------
%Salvataggio per spettri medi per lo spostamento
fileout = fopen ('Output\Registered\Mean_Disp.txt','w');
fprintf (fileout,'%s\r\n','MEAN DISPLACEMENT [m] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,mediaSreg]');
fclose (fileout);
%Salvataggio per spettri dev.st. per lo spostamento
fileout = fopen ('Output\Registered\StDev_Disp.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION DISPLACEMENT [m] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,deviaSreg]');
fclose (fileout);


%Salvataggio per spettri medi per l'accelerazione
fileout = fopen ('Output\Registered\Mean_Acc.txt','w');
fprintf (fileout,'%s\r\n','MEAN PSEUDO-ACCELERATION [g] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,mediaAreg]');
fclose (fileout);
%Salvataggio per spettri dev.st. per l'accelerazione
fileout = fopen ('Output\Registered\StDev_Acc.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION PSEUDO-ACCELERATION [g] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,deviaAreg]');
fclose (fileout);


%Salvataggio per spettri medi per l'energia
fileout = fopen ('Output\Registered\Mean_Ener.txt','w');
fprintf (fileout,'%s\r\n','MEAN PSEUDO-ENERGY [m.g] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,mediaEreg]');
fclose (fileout);
%Salvataggio per spettri dev.st. per l'energia
fileout = fopen ('Output\Registered\StDev_Ener.txt','w');
fprintf (fileout,'%s\r\n','STANDARD DEVIATION PSEUDO-ENERGY [m.g] - REGISTERED ACCELEROGRAMS');
fprintf (fileout,'%s\r\n',' ');
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,'%s \r\n',title);
fprintf (fileout,'%s \r\n',separa);
fprintf (fileout,formato,[Treg,deviaEreg]');
fclose (fileout);




