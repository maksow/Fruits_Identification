clear all
clc
p=4;%hidden
m=10;%input
input=[0.3161 0.2054 0.2058 0.2424; 
       0.2545 0.3361 0.1632 0.2513; 
       0.4313 0.3617 0.1660 0.3197;
       0.5443 0.3870 0.1455 0.3590; 
       0.4003 0.2911 0.2345 0.3087;
       0.2867 0.3086 0.1953 0.2635;  
       0.2915 0.2534 0.1818 0.2422;
       0.4493 0.4548 0.1996 0.3679; 
       0.6129 0.1996 0.2004 0.3376; 
       0.2203 0.2703 0.1789 0.2232]';%RGB means of 10 fruits
 

output=[1 0 0 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 1];



    
    
    
    
    
    

% t=[1.0];%target
% w=rand(10,10);%weights(i/p to hidden)
% wn=w/4;
% w1=rand(4,1);%weights (hidden to o/p)
% epoch=0;
% con=1;
% eta=0.6;%learning rate
% alpha=0.3;%momentum
% %feed forward
% for i=1:10
%    inputx=x(1,:);
%    outputy=t(1,:);
%    
% 
% while con
% for j=1:p
%     for i=1:m
%         outputy(1,j)=x(i)*wn(i,j);
%         
%     end
% end
% A=logsig(outputy);%activation function of i/p to hidden
% A=A';
% out=w1'*A;%output layer OUTPUT
% outA=logsig(out);%activation function of o/p
% %error
% outputerror=(t-outA)*(1-outA)*outA;
% %backward propagation of error
% y=A*outputerror;
% deltaw1=alpha*w1+eta*y;%change in weight
% %error
% e1=w1*outputerror;
% dstar=e1.*A.*(1-A);
% absx=dstar*x';
% absdeltaV=alpha*w'+eta*absx;
% %weight update input to hidden layer
% wupdate=w'+absdeltaV;
% %weight update hidden layer to outputlayer
% w1update=w1+deltaw1;
% e=outputerror;
% e=abs(e);
% %error condition
% if e<0.00005
%  con=0;   
% else
% epoch=epoch+1;
% end
% w=wupdate';
% w1=w1update;
% end
% end


