clear all
clc
data=open('comp.mat');
x=data.input;
t=data.t1;
emax=0.05; 
v=rand(4,10);
w=rand(10,10);
eta=0.4;
con=1;
epoch=1;
b1=rand(1,10);
b2=rand(1,10);

while con==1
%present first input and first output
for i=1:1
    z=x(i,:);
    d=t(i,:);
   for j=1:10
    for i=1:4
        yj(j)=b1(j);  
        yj(j)=yj(j)+v(i,j)'*x(i);        
    end
   end
    
end
   yj=logsig(yj);
   for j=1:10
    for i=1:10
        ok(1,j)=w(i,j)'*yj(i);        
    end
   end
  ok=logsig(ok);
  %error signal in terms of output layer
  for i=1:10
      deltaok(i)=1/2*(d(i)-ok(i))*(1-ok(i).^2);
      for j=1:10
          w1(i,j)=w(i,j)+eta*deltaok(i)*w(i,j)*yj(i);
      end
  end
  sum=0;
  
  for k=1:10
      for j=1:10
      sum=sum+deltaok(1,k)*w1(k,j);
      end
  end
      
  for j=1:10
      deltayj(j)=1/2*(1-yj(j).^2)*sum;
  end
%weight updation in hidden layer
for j=1:4
    for i=1:10
        v1(j,:)=v(j,:)+eta*deltayj*x(1,j);
    end
end 
e=1/2*(d-ok).^2;
if e<0.05
    con=0;   
else
epoch=epoch+1
if epoch==2000
        con=0;
    end

end
w=w1
v=v1;
   
end

% 
%     
%     
% 
% % w=[1 2 3 4; 1 2 3 4;1 2 3 4];%weights(i/p to hidden)
% % wn=w/4;
% % w1=rand(4,1);%weights (hidden to o/p)
% % epoch=0;
% % con=1;
% % eta=0.6;%learning rate
% % alpha=0.3;%momentum
% % 
% % 
% % t1=[0.2 0.5 0.8];
% % for i=1:3
% %     x=input(1,:);
% %     x=x';
% %     t=t1(:,1);
% % %feed forward
% % 
% % while con
% % for j=1:p
% %     for i=1:m
% %         tx(1,j)=x(i)*wn(i,j);
% %         
% %     end
% % end
% % A=logsig(tx);%activation function of i/p to hidden
% % A=A';
% % out=w1'*A;%output layer OUTPUT
% % outA=logsig(out);%activation function of o/p
% % %error
% % outputerror=(t-outA)*(1-outA)*outA;
% % %backward propagation of error
% % y=A*outputerror;
% % deltaw1=alpha*w1+eta*y;%change in weight
% % %error
% % e1=w1*outputerror;
% % dstar=e1.*A.*(1-A);
% % absx=dstar*x';
% % absdeltaV=alpha*w'+eta*absx;
% % %weight update input to hidden layer
% % wupdate=w'+absdeltaV;
% % %weight update hidden layer to outputlayer
% % w1update=w1+deltaw1;
% % e=outputerror;
% % e=abs(e);
% % %error condition
% % if e<0.00005
% %  con=0;   
% % else
% % epoch=epoch+1
% % end
% % w=wupdate';
% % w1=w1update;
% % end
% % end
% % 
