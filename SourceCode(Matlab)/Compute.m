%Lo fa per spettri generati
%--------------------------------------------------------------------------
%Calcola la pseudoaccelerazione e la pseudoanergia dallo spostamento
%e la esprime in termini di g e 1/s2 (adimensionalizza ripestto a g)
for j = 1:nodutti
    for i = 1:noTgen
        for k = 1:noeqgen
            Agen(i,j,k) = (2*3.1415926/Tgen(i,1))^2*Sgen(i,j,k)./dutti(j)./9.81;
            Egen(i,j,k) = 2*(3.1415926/Tgen(i,1))^2*(2*dutti(j)-1)./(dutti(j)^2).*(Sgen(i,j,k)^2);
        end
    end
end
%Calcola la media e la deviazione standard degli spettri
for j = 1:nodutti
    for k = 1:noeqgen
        %Genera una matrice di comodo
        matrS(:,k) = Sgen(:,j,k);
        matrA(:,k) = Agen(:,j,k);
        matrE(:,k) = Egen(:,j,k);
    end
    %Media e dev.st. per spostamento
    mediaSgen(:,j) = mean(matrS')';
    deviaSgen(:,j) = std(matrS',1)';

    %Media e dev.st. per accelerazione
    mediaAgen(:,j) = mean(matrA')';
    deviaAgen(:,j) = std(matrA',1)';

    %Media e dev.st. per energia
    mediaEgen(:,j) = (mean(matrE')')./9.81;
    deviaEgen(:,j) = (std(matrE',1)')./9.81;
end

%Lo fa per spettri registrati
%--------------------------------------------------------------------------
%Calcola la pseudoaccelerazione e la pseudoanergia dallo spostamento
%e la esprime in termini di g e 1/s2 (adimensionalizza ripestto a g)
for j = 1:nodutti
    for i = 1:noTreg
        for k = 1:noeqreg
            Areg(i,j,k) = (2*3.1415926/Treg(i,1))^2*Sreg(i,j,k)./dutti(j)./9.81;
            Ereg(i,j,k) = 2*(3.1415926/Treg(i,1))^2*(2*dutti(j)-1)./(dutti(j)^2).*(Sreg(i,j,k)^2);
        end
    end
end
%Calcola la media e la deviazione standard degli spettri
for j = 1:nodutti
    for k = 1:noeqreg
        %Genera una matrice di comodo
        matrS(:,k) = Sreg(:,j,k);
        matrA(:,k) = Areg(:,j,k);
        matrE(:,k) = Ereg(:,j,k);
    end
    %Media e dev.st. per spostamento
    mediaSreg(:,j) = mean(matrS')';
    deviaSreg(:,j) = std(matrS',1)';

    %Media e dev.st. per accelerazione
    mediaAreg(:,j) = mean(matrA')';
    deviaAreg(:,j) = std(matrA',1)';

    %Media e dev.st. per energia
    mediaEreg(:,j) = (mean(matrE')')./9.81;
    deviaEreg(:,j) = (std(matrE',1)')./9.81;
end





