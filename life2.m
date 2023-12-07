function f = life2(x,maxi)

n = length(x);
satisfaction = 0;
val = [0.15 0.2 0.2 0.15 0.15 0.15];
k = 1;

for j = 1:3:n
    sumi = x(j)+x(j+1)+x(j+2);
    x(j) = x(j)*100/sumi;
    x(j+1) = x(j+1)*100/sumi;
    x(j+2) = x(j+2)*100/sumi;
    satisfaction = satisfaction + x(j+2)*val(k);
    k = k + 1;
end

fit = NaN(1,n/3);   
k = 1;
penalty1 = 0;
penalty3 = 0;

for j = 1:3: n
    
    final = -x(j)+x(j+1)+x(j+2);
    final = final*val(k);
    if k>=4 && x(j+1) > 40  %too much greedy at middle age
        penalty1 = penalty1 + (x(j+1)-40)^2;
    end
    if k<4 && x(j) > 40  % too much careless at young age
        penalty3 = penalty3 + (x(j)-40)^2;
    end
    fit(k) = final;
    k = k + 1;
end
sumi = sum(fit);
multipenalty = 0;
if(-sumi - maxi > 5)
    multipenalty = (-sumi-maxi)^2;
end
f = -satisfaction+ (penalty1 + penalty3 + multipenalty)*10^5;
