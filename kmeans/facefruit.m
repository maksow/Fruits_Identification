%dctcomp.m
%Written by Jawad Nagi
%Date: 13th July 2006
%Last modified: 3rd August 2006
clear all
clc
%Reading image
% for i=1:6:13
%     path = strcat(strcat('train',num2str(i),'.jpg'));
%    vx= strcat(strcat('apple',num2str(i),'.jpg'))
%     i=imwrite(path,vx);
% end
% for j=1:3
%       path = strcat(strcat('train',num2str(j),'.jpg'));
%    imwrite( path = strcat(strcat('train',num2str(i),'.jpg'));)


for i=1:5
    path=strcat(strcat('gapp',num2str(i),'.jpg'));
   vx=strcat(strcat('gappdct',num2str(i),'.jpg'));
 IX = imread(path);
 IX = im2double(IX);
 IX=rgb2gray(IX);
 IX=imresize(IX,[256 256]);
 %figure,imshow(IX);
%Resizing original image
%(512x512 pixels => 8x8 pixels)
% I = imresize(I,[8 8],'nearest');
%Converting image data to double
%Generating random 8x8 DCT matrix
fun=@dct2;
%Taking 8x8 DCT of each block of the image
B = blkproc(IX,[8 8],fun);
%Applying the mask
%(8 DCT coefficients selected)
figure, imshow(B)
%Writing compressed image to file
imwrite(B,vx);
end
%loaddata.m
%
%Written by Jawad Nagi
%Date: 7th October 2006
%Last modified: 25 October 2006
%
%Loading all DCT images
a1=imread('appdct1.jpg');
a2=imread('appdct2.jpg');
a3=imread('appdct3.jpg');
a4=imread('appdct4.jpg');
a5=imread('appdct5.jpg');
f1=imread('gappdct1.jpg');
f2=imread('gappdct2.jpg');
f3=imread('gappdct3.jpg');
f4=imread('gappdct4.jpg');
f5=imread('gappdct5.jpg');
h1=imread('bandct1.jpg');
h2=imread('bandct2.jpg');
h3=imread('bandct3.jpg');
h4=imread('bandct4.jpg');
h5=imread('bandct5.jpg');
a1=im2double(a1);
a2=im2double(a2);
a3=im2double(a3);
a4=im2double(a4);
a5=im2double(a5);
f1=im2double(f1);
f2=im2double(f2);
f3=im2double(f3);
f4=im2double(f4);
f5=im2double(f5);
h1=im2double(h1);
h2=im2double(h2);
h3=im2double(h3);
h4=im2double(h4);
h5=im2double(h5);
a1=imresize(a1,[64 1]);
a2=imresize(a2,[64 1]);
a3=imresize(a3,[64 1]);
a4=imresize(a4,[64 1]);
a5=imresize(a5,[64 1]);
f1=imresize(f1,[64 1]);
f2=imresize(f2,[64 1]);
f3=imresize(f3,[64 1]);
f4=imresize(f4,[64 1]);
f5=imresize(f5,[64 1]);

h1=imresize(h1,[64 1]);
h2=imresize(h2,[64 1]);
h3=imresize(h3,[64 1]);
h4=imresize(h4,[64 1]);
h5=imresize(h5,[64 1]);

%save('data.mat','a','f','h');
%Reshaping data into a 64x1 array
% a1=double(reshape(a1,64,1));
% %a1=double(imreshape(a1,64,1));
% a2=double(reshape(a2,64,1));
% a3=double(reshape(a3,64,1));
% a4=double(reshape(a4,64,1));
% a5=double(reshape(a5,64,1));
% f1=double(reshape(f1,64,1));
% f2=double(reshape(f2,64,1));
% f3=double(reshape(f3,64,1));
% 
% f4=double(reshape(f4,64,1));
% f5=double(reshape(f5,64,1));
% h1=double(reshape(h1,64,1));
% h2=double(reshape(h2,64,1));
% h3=double(reshape(h3,64,1));
% h4=double(reshape(h4,64,1));
% h5=double(reshape(h5,64,1));
% % n1=double(reshape(n1,64,1));
% % n2=double(reshape(n2,64,1));
% % n3=double(reshape(n3,64,1));
% % n4=double(reshape(n4,64,1));
% % n5=double(reshape(n5,64,1));
% % r1=double(reshape(r1,64,1));
% % r2=double(reshape(r2,64,1));
% % r3=double(reshape(r3,64,1));
% % r4=double(reshape(r4,64,1));
% % r5=double(reshape(r5,64,1));
% %Adding training data into vectors
a=[a1 a2 a3 a4 a5];
f=[f1 f2 f3 f4 f5];
h=[h1 h2 h3 h4 h5];
% % n=[n1 n2 n3 n4 n5];
% % r=[r1 r2 r3 r4 r5];
% %Saving training data into file
% %save('data.mat','a','f','h','n','r');
% save('data.mat','a','f','h');
% %simsom.m

% %Written by Jawad Nagi
% %Date: 8th January 2006
% %Last modified: 26th Febuary 2006

% %Load saved training data into workspace
% load data.mat
% %Declare training data
P=[a f h];
net=newsom(minmax(P),[64 1]);
%Train SOM neural network for 1000 epochs
net.trainParam.epochs=100;
net=train(net,P);
%Plot SOM layer weights
x=net.iw{1,1},net.layers{1}.distances;
figure, plot(dist(x),'o');
title('SOM Layer Weights');xlabel('Layer Weights');
ylabel('Magnitude');
%Plot SOM weight vectors
figure, plotsom(net.iw{1,1},net.layers{1}.distances)

% %Create SOM neural network
% %(64 minimum points and 64 maximum points)
% net=newff(minmax(P),[64 1]);
% % %Train SOM neural network for 1000 epochs
% net.trainParam.epochs=100;
% net=train(net,P);
% % %Plot SOM layer weights
% % x=net.iw{1,1},net.layers{1}.distances;
% % figure, plot(dist(x),'o');
% % title('SOM Layer Weights');xlabel('Layer Weights');
% % ylabel('Magnitude');
% % %Plot SOM weight vectors
% % figure, plotsom(net.iw{1,1},net.layers{1}.distances)
sx=sim(net,P);
%save aaa

[l,m]=size(sx);
for u=1:1:m
sm(u)=find(sx(:,u));
end
Q=imread('F:\project\fruits\workingcodesnew\apptest.jpg');
 Q= im2double(Q);
 Q=rgb2gray(Q);
Q=imresize(Q,[256 256]);
fun=@dct2;
B = blkproc(Q,[8 8],fun);
figure, imshow(B)
% %Writing compressed image to file
Q1=im2double(B);
Q1=imresize(Q1,[64 1]);

% msx=sim(net,Q1);
% %for k=1:15
% %     i=(k-1)*64+1;
% %     pq=sx(i:i+63);
% %    dis=(pq-msx);
% %    d=min(dis.^2);
% % end
% %    
%     
% j=1;
% while(j<=15)
%     for i=1:64:960
%         a=sx(i:i+63);
%         d(j)=norm(a-msx);
%         j=j+1;
%     end
% end
% 

msxm=find(msx);
%ans=find((sm - msxm)==min(abs((sm-msxm))));

 ans=find((sm(1,64:1)-msxm')==min(abs((sm(1,64:1)-msxm'))));

if (ans > 0) & (ans <= 5)
disp('Subject is identified to be: Apple');
 else if (ans > 5) & (ans <= 10)
 disp('Subject is identified to be: greenapp');
else if (ans > 10) & (ans <= 15)
 disp('Subject is identified to be: banana');
% else if (ans > 15) & (ans <= 20)
% disp('Subject is identified to be: Naseem');
% else if (ans > 20) & (ans <= 25)
% disp('Subject is identified to be: Rafay');
else
disp('Subject is not identified in the training database.');
end
end
end


% % %Load input face image
% Q=imread('F:\project\fruits\workingcodesnew\apptest.jpg');
%  Q= im2double(Q);
%  Q=rgb2gray(Q);
% Q=imresize(Q,[256 256]);
% fun=@dct2;
% B = blkproc(Q,[8 8],fun);
% figure, imshow(B)
% %Writing compressed image to file
% Q1=im2double(B);
% Q1=imresize(Q1,[1 64]);

%  % Q=double(reshape(Q,64,1));
% % Q=double(reshape(Q,64,1));
% % %Simulate SOM neural network for input face image
%  msx=sim(net,Q1);
%  msxm=find(msx);
% %% if (ans > 0) & (ans <= 5)
% % disp('Subject is identified to be: Asif');
% % else if (ans > 5) & (ans <= 10)
% % disp('Subject is identified to be: Fahad');
% % else if (ans > 10) & (ans <= 15)
% % disp('Subject is identified to be: Hayyan');
% % else if (ans > 15) & (ans <= 20)
% % disp('Subject is identified to be: Naseem');
% % else if (ans > 20) & (ans <= 25)
% % disp('Subject is identified to be: Rafay');
% % else
% % disp('Subject is not identified in the training database.');
% % end
% % end
% % end
% % end
% % end