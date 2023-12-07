clc
clear
close all
% 12 18 25 35 60 70 age groups
n = 18;
lb = [20 1 75 20 10 65 15 10 65 10 10 65 5 5 65 4 5 70];
ub = [50 20 85 50 50 75 50 50 75 20 50 80 15 30 80 10 20 80];
prob = @life;
prob2 = @life2;
Nruns = 5;
Np = 50;
T = 100;

bestsol = NaN(Nruns,n);
bestsol2 = NaN(Nruns,n);
bestfitness = NaN(Nruns,1);
bestfitness2 = NaN(Nruns,1);
greed1 = NaN(Nruns,n/3);
careless1 = NaN(Nruns,n/3);
satis1 = NaN(Nruns,n/3);
greed2 = NaN(Nruns,n/3);
careless2 = NaN(Nruns,n/3);
satis2 = NaN(Nruns,n/3);
ind1 = NaN(Nruns,n/3);
ind2 = NaN(Nruns,n/3);

for i = 1:Nruns
    rng(i,'twister');
    [bestsol(i,:),bestfitness(i),~,P1,~] = tlbo(prob,lb,ub,Np,T);
end
x = min(bestfitness);

for i = 1:Nruns
    rng(i,'twister');
    [bestsol2(i,:),bestfitness2(i),~,P2,~] = tlbo2(prob2,lb,ub,Np,T,x);
end

for j=1:Nruns
    k = 1;
    for i = 1:3:n
        sumi = sum(bestsol(j,i+1)+bestsol(j,i)+bestsol(j,i+2));
        greed1(j,k) = bestsol(j,i+1)*100/sumi;
        careless1(j,k) = bestsol(j,i)*100/sumi;
        satis1(j,k) = bestsol(j,i+2)*100/sumi;
        ind1(j,k) = greed1(j,k) + satis1(j,k) - careless1(j,k);
        k = k+1;
    end
end

for j=1:Nruns
    k=1;
    for i = 1:3:n
        sumi = sum(bestsol2(j,i+1)+bestsol2(j,i)+bestsol2(j,i+2));
        greed2(j,k) = bestsol2(j,i+1)*100/sumi;
        careless2(j,k) = bestsol2(j,i)*100/sumi;
        satis2(j,k) = bestsol2(j,i+2)*100/sumi;
        ind2(j,k) = greed2(j,k) + satis2(j,k) - careless2(j,k);
        k = k+1;
    end
end

x1 = [12,18,25,35,60,75];

subplot(1,2,1);
plot(x1,mean(greed1),'o-');
hold on;
plot(x1,mean(careless1),'o-');
plot(x1,mean(satis1),'o-');
plot(x1,mean(ind1),'o-');
legend('Greediness level','Carelessness level','Satisfaction level','Life index');
title('Variation of different levels with age group');
xlabel('Age');
ylim([0,120]);
xlim([0,100]);
hold off;

subplot(1,2,2);
plot(x1,mean(greed2),'o-');
hold on;
plot(x1,mean(careless2),'o-');
plot(x1,mean(satis2),'o-');
plot(x1,mean(ind2),'o-');
legend('Greediness level','Carelessness level','Satisfaction level','Life index');
title('Variation of different levels with age group');
xlabel('Age');
ylim([0,120]);
xlim([0,100]);
hold off;

disp('Greediness levels at age 12,18,25,35,60,75');
disp(mean(greed1));
disp('Carelessness levels at age 12,18,25,35,60,75');
disp(mean(careless1));
disp('Satisfaction levels at age 12,18,25,35,60,75');
disp(mean(satis1));
disp('Life index levels at age 12,18,25,35,60,75');
disp(mean(ind1));

disp('Maximizing satisfaction levels while maximizing life index in range of 5')
disp('Greediness levels at age 12,18,25,35,60,75');
disp(mean(greed2));
disp('Carelessness levels at age 12,18,25,35,60,75');
disp(mean(careless2));
disp('Satisfaction levels at age 12,18,25,35,60,75');
disp(mean(satis2));
disp('Life index levels at age 12,18,25,35,60,75');
disp(mean(ind2));
