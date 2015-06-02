sortie_princ=zeros(1,10);
sortie_second=zeros(1,10);
for i=1:10
    [xmax1,ymax1,xmax2,ymax2] = sim_glob (((2.5)^2)/2, 10+i, 50,1,2.5);
    sortie_princ(1,i)=xmax1;
    sortie_second(1,i)=xmax2;
    
end
figure
plot(sortie_princ(1,:))
axis([0 10 0 600])
figure
plot(sortie_second(1,:))
axis([0 10 0 600])