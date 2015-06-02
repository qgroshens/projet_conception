%*******************************************************************************************************************************
%scrip de simulation totale
%création du guide d'onde & propagation
%*******************************************************************************************************************************
%lance la création du guide d'onde et la propagation du faisceau gaussien.
%sim_glob(écart entre les faiceaux d'airy, tau, gama, n° = lobe d'entrée (1 ou 2),longeur (en distance normalisée)

function [xmax1,ymax1,xmax2,ymax2] = sim_glob (D_airy, tau, gama,lobe_entree,longueur)

[x_A,X,G,Eo,k,l,phase,Z,e,m,ko,I]=airy_rk_propre(D_airy, tau, gama,longueur);

[~,locs]=findpeaks(abs(I(:,1)),'SORTSTR','descend');

if(lobe_entree==1)
    D_gaussien=(500-locs(1))/x_A+0.4;
    %+0.4 optimise l'intensité en sortie par rapport à une entrée ua centre du lobe
elseif(lobe_entree==2)
    D_gaussien=(500-locs(2))/x_A+0.4; 
else
    error('lobe 1 ou 2 uniquement')
    
end

[val,local]=findpeaks(I,'SORTSTR','descend');
xmax1=local(1);
ymax1=val(1);
xmax2=local(2);
ymax2=val(2);
