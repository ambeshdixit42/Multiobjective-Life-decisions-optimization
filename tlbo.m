function[bestsol,bestfit,BestFitIter,P,f]=tlbo(prob,lb,ub,Np,T)

f=NaN(Np,1);
BestFitIter=NaN(T+1,1);
D=length(lb);
P=repmat(lb,Np,1)+repmat((ub-lb),Np,1).*rand(Np,D);
for p=1:Np
    f(p)=prob(P(p,:));
end
BestFitIter(1)=min(f);

for t=1:T
    for i=1:Np
        %Teacher
        Xmean=mean(P);
        [~,ind]=min(f);
        Xbest=P(ind,:);
        Tf=randi([1 2],1,1);
        Xnew=P(i,:)+rand(1,D).*(Xbest-Tf*Xmean);
        Xnew=min(Xnew,ub);
        Xnew=max(Xnew,lb);
        fnew=prob(Xnew);
        if(fnew<f(i))
            P(i,:)=Xnew;
            f(i)=fnew;
        end

        %Learner
        p=randi([1 Np],1,1);
        while i==p
            p=randi([1 Np],1,1);
        end

        if f(i)<f(p)
            Xnew=P(i,:)+rand(1,D).*(P(i,:)-P(p,:));
        else
            Xnew=P(i,:)-rand(1,D).*(P(i,:)-P(p,:));
        end
        Xnew=min(Xnew,ub);
        Xnew=max(Xnew,lb);
        fnew=prob(Xnew);
        if(fnew<f(i))
            P(i,:)=Xnew;
            f(i)=fnew;
        end
    end
    BestFitIter(t+1)=min(f);
end
[bestfit,ind]=min(f);
bestsol=P(ind,:);
