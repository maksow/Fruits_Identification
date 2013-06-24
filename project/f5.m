clc;
clear;%clear all
data=open('comp.mat');
x=data.input;
t=data.t1;
emax=0.05; 
v=rand(4,10);
v1=rand(10,10);
eta=0.4;
con=1;
epoch=1;
v=rand(4,10);
v1=zeros(10,10);
%b1=[-.3378 .2771 .2859 -.3329];
b1=rand(1,10);%bias [1:10]
b2=-.1401;
%w=[0.4919; -0.2913; -0.3979;0.3581];
w=rand(10,1);%weights [10:1]
w1=zeros(10,1);%initial all zeros


% x= [ 0.3161  0.2054  0.2058;    0.2545 0.3361   0.1632 ;  0.4313 0.3617 0.1660;
%       0.5443 0.3870 0.1455;  0.4003 0.2911 0.2345;  0.2867 0.3086 0.1953;  0.2915  0.2534 0.1818;
%       0.4493 0.4548 0.1996; 0.6129 0.1996 0.2004;  0.2203 0.2703 0.1789]';%RGB means of 10 fruits
%   
%   
% t= [0.2424    0.2513   0.3197    0.3590   0.3087   0.2635    0.2422    0.3679     0.3376    0.2232];%output means of 10 fruits

%x=[ 0.3161  0.2054  0.2058;   0.2545 0.3361 0.1632 ; 0.4313 0.3617 0.1660;0.5443 0.3870 0.1455;0.4003 0.2911 0.2345 ]';
%t= [0.2424    0.2513   0.3197    0.3590   0.3087]; 
I1=10; i1=4;j1=10;%10 neurons;columns&rows
%x=[0.3161 0.2054 0.2058 0.2424;0.2545 0.3361 0.1632 0.2513];
%t=[0.24 0.25 0 0];
%x=[1 1 0 0 0;1 0 1 0 0;1 1 1 1 1];
%t=[1 0 0 1 1];
alpha=.02; %learning rate
mf=0.9;
con=1;
epoch=0;
while con
    e=0;
    for I=1:I1    %%(number of outputs)
        %FEED FORWARD
            for j=1:j1  %%%%(number of rows)
                    zin(j)=b1(j);   %%% 4 bias values 
                for i=1:i1  %%%%(number of columns)
                     zin(j)= zin(j)+x(i,I)*v(i,j);  %%%4 outputs
                end
                   z(j)=binsig(zin(j));   %%%4 outputs with binsig function
            end
            yin=b2+z*w;     %%% bias + output* weight
            y(I)=binsig(yin); %sigmoid value
            
            %Back propogation of error
            delk=(t(I)-y(I))*y(I);%error=(target-output)*output
            delw=alpha*delk*z'+mf*(w-w1);%weight change=learning rate*error*output'+mf*weight(rand-zeros)
            delb2=alpha*delk;%bias
            delinj=delk*w;
            for j=1:j1
                delj(j,1)=delinj(j,1)*binsig1(zin(j));
            end
              for j=1:j1
                for i=1:i1
                  delv(i,j)=alpha*delj(j,1)*x(i,I)+mf*(v(i,j)-v1(i,j));
                end
            end

    delb1=alpha*delj;
    w1=w;
    v1=v;
    %weight updation
    w=w+delw;
    b2=b2+delb2;
    v=v+delv;
    b1=b1+delb1';
    e=e+(t(I)-y(I))^2;
    end     
            
               
    if(e<0.005)con=0;
    end 
    epoch=epoch+1;
end 
  

%testing input data

x= [ 0.3161  0.2054  0.2058;    0.2545 0.3361   0.1632 ;  0.4313 0.3617 0.1660;
      0.5443 0.3870 0.1455;  0.4003 0.2911 0.2345;  0.2867 0.3086 0.1953;  0.2915  0.2534 0.1818;
      0.4493 0.4548 0.1996; 0.6129 0.1996 0.2004;  0.2203 0.2703 0.1789]'
  
  
t= [0.2424    0.2513   0.3197    0.3590   0.3087   0.2635    0.2422    0.3679     0.3376    0.2232]

%x1=[0 0 0 1;0 0 0 0];
%x1=[1 1 0 0 0;1 0 1 0 0;1 1 1 1 1];
%x=[0.5443 0.3870 0.1455 0.3590;0.2545 0.3361 0.1632 0.2513];
 for I=1:I1
        %FEED FORWARD
            for j=1:j1
                zin(j)=b1(j); 
                  for i=1:i1
                     zin(j)= zin(j)+x(i,I)*v(i,j);
                   end
                 z(j)=binsig(zin(j));
            end

            yin=b2+z*w;
            yt(I)=binsig(yin);
 end





