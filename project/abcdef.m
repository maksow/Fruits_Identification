%back propagation network for data compression
clc;
clear;
%get input pattern from file
data=open('comp.mat');
x=data.input;
t=data.t1;
% %input.Hidden and output layer definition
%input--n, hidden1--h1  hidden2-h2 ,out---m

n=4;%i/p
h1=10;%hidden1
h2=10;%hidden2
m=10;%o/p

ih=rand(n,h1);
ih0=zeros(n,h1);%weights b/w input and h1

hh=rand(h1,h2)-0.5;
hh0=zeros(h1,h2);%weights between h1 and h2


ho=rand(h2,m)-0.5;
ho0=zeros(h2,m);%weights between h2 and output

b1=rand(1,h1)-0.5;%bias h1
b2=rand(1,h2)-0.5;%bias h2
b3=rand(1,m)-0.5;%bias output(m)

alpha=0.4;
mf=0.3;
con=1;
epoch=0;
while con
    e=0;
    %input to hidden1 layer
    for I=1:n
        %feed forward
        for j=1:h1
            zin(j)=b1(j);
            for i=1:n
                zin(j)=zin(j)+x(I,i)*ih(i,j);
            end
            z(j)=bipsig(zin(j));
        end
    end
        %feed forward from hidden1 to hidden2 layer
        for k=1:h2
            yin(k)=b2(k);
        for j=1:h1
            yin(k)=yin(k)+z(j)*hh(j,k);
        end
            yh(k)=bipsig(yin(k));
            tx1(j,k)=yh(k);
        end
        %feed forward from hidden2 layer to output
        for k=1:m
            yin(k)=b3(k);
        for j=1:h2
            yin(k)=yin(k)+tx1(j)*ho(j,k);
        end
            yo(k)=bipsig(yin(k));
            ty1(j,k)=yo(k);
        end
    
        %propogation of error backward
        %from output to hidden2
                for k=1:m
            delk(k)=(t(I,k)-ty1(I,k))*bipsig1(yin(k));
                end
        for j=1:h2
            for k=1:m
                delw(j,k)=alpha*delk(k)*tx1(j)+ho(j,k);
               
            end
        end
%         from hidden2 to hidden1
         for k=1:h1
              for j=1:h2
            delk1(k)=(ty1(k,j)-tx1(k,j)).*bipsig1(yh(k));
              end
         end
        for j=1:h2
            for k=1:m
                delw1(j,k)=alpha*delk1(k)*z(j)+hh(j,k);
               
            end
        end
%         from hidden1 to input
 for k=1:n
              for j=1:h1
            delk2(k)=(ty1(k,j)-tx1(k,j)).*bipsig1(yh(k));
              end
 end
 e=(ty1-tx1).^2;        
 
     if e<0.005
        con=0;
    else
    epoch=epoch+1
if epoch==10000
        con=0;
    end
    end
    x1(epoch)=epoch
%     y1(epoch)=e;
%end
disp('total epoch performed');
disp(epoch);
disp('error');
disp(e);
end
 
 
%         for j=1:h2
%             for k=1:m
%                 delw1(j,k)=alpha*delk2(k)*z(j)+hh(j,k);
%                
%             end
%         end
        
        
        
%         delb2=alpha*delk;
%         
%         for j=1:h
%             delj(j)=delinj(j)*bipsig1(ty1(j));
%         end
%         
%     
%     
%         %error back to h2 to h1
%         for k=1:m
%             delk(k)=(tx1(I,k)-z(k))*bipsig1(y(k));
%         end
%         for j=1:h
%             for k=1:m
%                 delw(j,k)=alpha*delk(k)*y(j)+mf*(w1(j,k)-w(j,k));
%                 delinj(j)=delk(k)*w1(j,k);
%             end
%         end
%         delb2=alpha*delk;
%         for j=1:h
%             delj(j)=delinj(j)*bipsig1(zin(j));
%         end
% %         %error back to h1 to input
% %          for k=1:m
% %             yin(k)=b2(k);
% %         for j=1:h
% %             yin(k)=yin(k)+z(j)*w(j,k);
% %         end
% %             y(k)=bipsig(yin(k));
% %             ty(I,k)=y(k);
% %         end
% %         %back propagation of error
% %         for k=1:m
% %             delk(k)=(t(I,k)-y(k))*bipsig1(yin(k));
% %         end
% %         for j=1:h
% %             for k=1:m
% %                 delw(j,k)=alpha*delk(k)*z(j)+mf*(w(j,k)-w1(j,k));
% %                 delinj(j)=delk(k)*w(j,k);
% %             end
% %         end
% %         delb2=alpha*delk;
% %         for j=1:h
% %             delj(j)=delinj(j)*bipsig1(zin(j));
% %         end
% % % % 
% % %error back from hidden to input       
% %        for j=1:h
% %             for i=1:n
% %                 delv(i,j)=alpha.*delj(j).*x(I,i)+mf*(w1(i,j)-w(i,j));
% %             end
% %         end
% %         delb1=alpha*delj;
% % %         w1=w;
% % %         v1=v;
% % %         %weight updation
% % %         w=w+delw;
% % %         b2=b2+delb2;
% % %         v=v+delv;
% % %         b1=b1+delb1;
% % %         for k=1:k
% % %             e=e+(t(I,k)-y(k))^2;
% % %         end
% % %     end
% % %     if e<0.005
% % %         con=0;
% % %     else
% % %     epoch=epoch+1
% % % if epoch==10000
% % %         con=0;
% % %     end
% % %     end
% % %     x1(epoch)=epoch
% % %     y1(epoch)=e;
% % % %end
% % % disp('total epoch performed');
% % % disp(epoch);
% % % disp('error');
% % % disp(e);
% % % end
% % % 
% % % % figure(1);
% % % % k=1;
% % % % for i=1:2
% % % %     for j=1:5
% % % %         charplot(x(k,:),10+(j-1)*15,30-(j-1)*15,9,7);
% % % %         k=k+1;
% % % %     end
% % % % end
% % % % title('input pattern for compression');
% % % % axis([0 90 0 40]);
% % % % figure(2);
% % % % plot(x1,y1);
% % % % xlabel('epoch number');
% % % % ylabel('error');
% % % % tirle('conversion of net');
% % % % %output of net after training
% % % % for I=1:10
% % % %     for j=1:h
% % % %         zin(j)=b1(j);
% % % %         for i=1:n
% % % %             zin(j)=zin(j)+x(I,j)*v(i,j);
% % % %         end
% % %         z(j)=bipsig(zin(j));
% % %     end
% % %     for k=1:m
% % %         yin(k)=b2(k);
% % %         for j=1:h
% % %             yin(k)=yin(k)+z(j)*w(j,k);
% % %         end
% % %        y(k)=bipsig(yin(k));
% % %        ty(I,k)=y(k);
% % %     end
% % % end
% % % for i=1:10
% % %     for j=1:63
% % %         if ty(i,j)>=0.8
% % %             tx(i,j)=1;
% % %         else if ty(i,j)<=-0.8
% % %                  tx(i,j)=-1;
% % %             else
% % %                  tx(i,j)=0;
% % %             end
% % %         end
% % %     end
% % % end
% % % figure(3);
% % % k=1;
% % % for i=1:2
% % %     for j=1:5
% % %         charplot(tx(k,:),10+(j-1)*15,30-(i-1)*15,9,7);
% % %         k=k+1;
% % %     end
% % % end
% % % axis([0 90 0 40]);
% % % title('Decompressed pattern');
% % % %subfunction used:
% % %  %plot character
% % %  function charplot(x,xs,ys,row,col)
% % %  k=1;
% % %  for i=1:row
% % %     for j=1:col
% % %         x1(i,j)=x(k);
% % %         k=k+1;
% % %     end
% % %  end
% % %  for i=1:row
% % %     for j=1:col
% % %        if x1(i,j)==1
% % %         plot(j+xs-1,ys-i+1,'k*');
% % %         hold on
% % %        else
% % %            plot(j+xs-1,ys-i+1,'r');
% % %            hold on
% % %        end
% % %     end
% % %  end
% % 
