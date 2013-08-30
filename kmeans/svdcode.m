clc
clear all
close all
N=4;
N1=4;
re=20;
ggg=1;
dist=zeros(1,N*N1);
for a1=1:N1
    s=zeros(re*re*3,N);
    A=zeros(re*re*3,N);
    clear U;
    clear S;
    clear V;
    for a=1:N
        i=imread(strcat('train',num2str(a),'.jpg'));
%         i=rgb2gray(i);
        h=imresize(i,[re,re]);
        f=reshape(h,re*re*3,1);
        sx(:,a)=f;
    end
end
sx=im2double(sx);
for K=1:4
    [u s v]=svd(sx);
end

% fbar=mean(s,2);
% for a=1:N
% A(:,a)=s(:,a)-fbar;
% end
% r=rank(A);
% A=double(A);
% [U,S,V]=svd(A);
% Ur = S(:, 1:r);
% 
% x=zeros(r,N);
% 
% for i=1:N
% x(:,i)=Ur'*(s(:,i)-fbar);
% end
% 
% s1=zeros(re*re*3,1);
% x1=zeros(r,1);
% 
% 
% 
%     st=zeros(re*re*3,N);
%     At=zeros(re*re*3,N);
%     clear U;
%     clear S;
%     clear V;
    for a=1:N
        it=imread(strcat('test',num2str(a),'.jpg'));
%         i=rgb2gray(i);
        ht=imresize(it,[re,re]);
        ft=reshape(ht,re*re*3,1);
        st(:,a)=ft;
    end
    st=im2double(st);
    

     [Uw,Sw,Vw]=svd(st);

     for i=1:4

     for j=1:4
    if i==j
       strain(i,j)=s(i,j);

        stest(i,j)=Sw(i,j);
    end
     end
     end
     
   strain=diag(strain);
   stest=diag(stest);
        
% fbart=mean(st,2);
% for a=1:N
% At(:,a)=st(:,a)-fbart;
% end
% r=rank(At);
% At=double(At);
% [Ut,St,Vt]=svd(At);
% Urt = Ut(:, 1:r);
% 
% xt=zeros(r,N);
% % 
% for i=1:N
% xt(:,i)=Urt'*(st(:,i)-fbart);
% end
% end
% % 
% % %  i=imread(strcat('test',num2str(a),'.jpg'));
% % %  h=imresize(i,[re,re]);
% % % f=reshape(h,re*re*3,1);
% % % ftbar=mean(f);
% % % ft1=f-ftbar;
% % % ft1=double(ft1);
% % % %r1=rank(ft1);
% % % 
% % % [Uw,Sw,Vw]=svd(ft1);
% % % Urt=Uw(:,1:3);
% % % x1=Urt'*ft1;
% % 
% % % s1(:,1)=f;
% % % s1=double(s1);
% % % x1(:,1)=Ur'*(s1(:,1)-fbar);
% % % 
% % % 
for i=1:4
for j=1:4
dist(i,j)=norm(stest(j)-strain(i));
%if(dist(1,ggg)==0)
    if i==j
disp(strcat('image matched with fruit',num2str(j)));

imshow(strcat('test',num2str(j),'.jpg'));
title('test image');
% else
%     disp(strcat('image does not matched with fruit',num2str(j)));
%     title('doesnot mathed image');
figure, imshow(strcat('train',num2str(i),'.jpg'));
title('mathed image');
end
ggg=ggg+1;
end
end

% for i=1:4
%     for j=1:4
% %dist(1,ggg)=norm(stest(:,i)-strain(:,i));
% dist(i,j)=norm(stest(j)-strain(i));
% if(dist(i,j)==0)
%     disp(strcat('image matched with fruit',num2str(j)));
% % %    
% % %    
%     figure, imshow(strcat('train',num2str(i),'.jpg'));
% % %      title('test image');
% %     title('mathed image');
% % end
% %  ggg=ggg+1;
% end
%       end 
%  end
% % % end
