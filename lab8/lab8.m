% Shannon-Fano Coding

clc;
clear all;
close all;

disp('Enter the probabilities:');

ss=[0.4 0.2 0.12 0.08 0.08 0.08 0.04]

%outputs = string of codewords,average codeword length
ss=ss./sum(ss); %if occurrences are inputted, probabilities are gained
ss=sort(ss,'descend');  %the probabilities are sorted in descending order

%siling=ceil(log2(1/ss(1))); %initial length is computed

siling=log2(1/ss(1)); %initial length is computed
siling=round(siling,1,'significant');

sf=0;
fano=0;
%initializations for Pk
n=1;Hx=0; %initializations for entropy H(X)

for i=1:length(ss)
   Hx=Hx+ ss(i)*log2(1/ss(i)); %solving for entropy
end

for k=1:length(ss)
   info(k)=-(log2(ss(k))); %Information
end

for j=1:length(ss)-1
   fano=fano+ss(j);
   sf=[sf 0]+[zeros(1,j) fano]; %solving for Information for every codeword
   siling=[siling 0]+[zeros(1,j) ceil(log2(1/ss(j+1)))]; %solving for length every codeword

end

for r=1:length(sf)
    esf=sf(r);
    for p=1:siling(r)   
        esf=mod(esf,1)*2;
        h(p)=esf-mod(esf,1); %converting Pk into a binary number      
    end
    hh(r)=h(1)*10^(siling(r)-1); %initializtion for making the binary a whole number
    for t=2:siling(r)
        hh(r)=hh(r)+h(t)*10^(siling(r)-t);    %making the binary a whole number
    end                                       %e.g. 0.1101 ==> 1101
end

c={'0','1'};
disp('Codeword');
for i=1:length(hh)
    u=1;                                      %converting the codes into a string
   for t=siling(i):-1:1
       f=floor(hh(i)/10^(t-1));               %1001 ==>1 (getting the first highest unit of a number)
       hh(i)=mod(hh(i),10^(t-1));             %1001 ==>001(eliminating the first highest unit of a number)
       if f==1
           if u==1
                d=c{2};                       %conversion part (num(1001) to str(1001)) 
           else
                d=[d c{2}];
           end
       else
           if u==1
                d=c{1};
           else
                d=[d c{1}];
           end
       end
      
       codex{i,:}={d};
       u=u+1;
   end
   disp([d])
end

tao=siling(1)*ss(1); %initialization for codeword length
for u=1:length(ss)-1 %computing for codeword length
   tao=tao+siling(u+1)*ss(u+1);
end

T=tao/n; %computing for average codeword length
B=[flipud(rot90(ss)),flipud(rot90(siling)),flipud(rot90(info))];
disp(['Probability','   Length','   Information'])
disp(B)
disp(['Entropy H(X) = ',num2str(Hx),'bits/symbol'])
disp(['Average length,L = ',num2str(T),'bits/symbol'])
eff=((Hx/T)*100); %Coding efficiency
disp(['Efficiency=',num2str(eff),'%'])
redu=100-eff;   %Redundancy
disp(['Redundancy=',num2str(redu),'%'])