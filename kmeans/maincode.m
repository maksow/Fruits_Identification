clc
clear all
close all
%Read in the whole image and get its size
% RGB: the image in RGB format
%RGB=imread('F:\project\apple2.jpg');
%RGB=imread('F:\project\fruits\banana2.jpg');
RGB=imread('F:\project\fruits\workingcodesnew\capsgrtest.jpg');
%imshow(RGB)
%figure(1)
%imshow(RGB)
HSI = rgb2hsv(RGB);
%figure(2)
%imshow(HSI)
H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);
[row, col, layer] = size(RGB);

% Call the function "EdgeDetection" to get the edge of the image.
result = EdgeDetection(RGB);
%figure(3)
%imshow(result)
% fImage: the matrix used to store the information extracted by using
% "Hue" and "Saturation" as threshold. Only the pixel value falling
% withing the range of "Hue" and "Saturation" value will change the
% correpsonding pixel value in "fImage" to 1.
fImage = zeros(row, col);
% Read in the HUE of certain part of the image
% Call the "Hue" function to obtain the range of the hue value and pass the
% high and low end values back to the program.
% hLow: lower end of the range of the hue.
% hHigh: higher end of the range of the hue.
[hLow, hHigh] = Hue(RGB, 0.05);
[sLow, sHigh] = Saturation(RGB, 0.2);
[iLow, iHigh] = Intensity(RGB, 0.2);
tempImage = segment(RGB,hLow,hHigh,sLow,sHigh,iLow,iHigh);
%figure(4)
%imshow(tempImage)
% Screen through every pixel in the "tempImage" matrix. If the pixel value
% is NOT zero, then pass the pixel value to the corresponding location of
% the "sImage" matrix. Otherwise, don't pass any value.
for i=1:row
    for j=1:col
       if tempImage(i,j)>0
          fImage(i,j) = tempImage(i,j); % Pass the "uniform" information to "fImage"
       end
     end
end

% Combine the segmented image information.

si = Combine(RGB,fImage,result);
%figure(5)
%imshow(si)
% location of sImage stays 0.e
sImage = zeros(300,300,300);
for i=1:row
  for j=1:col
  for k=1:layer
    if si(i,j)==1
        sImage(i,j,1) = H(i,j);
        sImage(i,j,2) = S(i,j);
        sImage(i,j,3) = I(i,j);
    end
  end
  end
end



% Screen through every pixel in the "tempImage" matrix. If the pixel value
% is NOT zero, then pass the pixel value to the corresponding location of
% the "sImage" matrix. Otherwise, don't pass any value.
for i=1:row
 for j=1:col
    if tempImage(i,j)>0
       fImage(i,j) = tempImage(i,j);
    end
 end
end
% Convert the image of "sImage" matrix from HSI format back to RGB format.
% sRGB: the image converted from HSI to RGB format
sRGB = hsv2rgb(sImage);
%figure(7)
%imshow(sRGB)
% Create a 7x7 structure element to dilate the "edge" matrix (from
% "EdgeDetection.m") to fill in some of the bounaries that were not
% connected. Perform dilation 5 times, and then apply "imfill".
% d: the filled-in boundary after dilating the edges.
block=ones(5,5);
d=imdilate(result,block);
for i=1:2
   d = imdilate(d,block);
end
d = imfill(d,'holes');
%After intersection, the target image will be captured. However, part of
% the unwanted image around the boundary are also captured. Therefore, we
% intersect image with the segmented image, "sRGB", to filter out the
% unwanted part.
% finalImage: the intersection of "d" and "sRGB". It is the final image.
finalImage = zeros(row,col,layer);
for i=1:row
for j=1:col
if d(i,j)>0
  finalImage(i,j,1) = H(i,j);
  finalImage(i,j,2) = S(i,j);
  finalImage(i,j,3) = I(i,j);
end
end
end
%figure(8)
%imshow(finalImage)
% Convert the image of "finalImage" matrix from HSI format back to RGB format.
% finalImageRGB: the image converted from HSI to RGB format
%sRGB = hsv2rgb(sImage);
finalImageRGB = hsv2rgb(finalImage);
% Show the image on the screen.
%figure(9), imshow(RGB), hold on
figure(10),imshow(finalImageRGB)

%mean calculation:
%RGB2 = imread('applered.jpg');%reading image
%imshow(RGB2)
size(RGB);
R1=RGB(:,:,1);
size(R1);
G1=RGB(:,:,2);
size(G1);
B1=RGB(:,:,3);
size(B1);

m=mean(RGB(:));
v=var(double(RGB(:)));
r=range(RGB(:));
mean(R1(:));
mean(G1(:));
mean(B1(:));
%segmented image mean calculation
size(finalImageRGB);
R=finalImageRGB(:,:,1);
size(R);
G=finalImageRGB(:,:,2);
size(G);
B=finalImageRGB(:,:,3);
size(B);

m=mean(finalImageRGB(:));
v=var(finalImageRGB(:));
r=range(finalImageRGB(:));
mean(R(:));
mean(G(:));
mean(B(:));
%calculation of texture features
R=finalImageRGB(:,:,1);
G=finalImageRGB(:,:,2);
B=finalImageRGB(:,:,3);
Rs=R(100:102,100:102);
Gs=G(100:102,100:102);
Bs=B(100:102,100:102);
 R=finalImageRGB(:,:,1);
I=statxture(R);

Rx=statxture(Rs);
%figure,imshow(Rx)
Gx=statxture(Gs);
Bx=statxture(Bs);
% deviation=sqrt(v)
% entrop=entropy(finalImageRGB)
% calculation of shape features of segmented fruit
I2=rgb2gray(finalImageRGB);
b=bwlabel(I2);
%D=regionprops(b,'Centroid','BoundingBox','Eccentricity','MajorAxisLength','Area','Perimeter','MinorAxisLength','PixelList','EquivDiameter')
D=regionprops(b,'Area','Perimeter','Eccentricity','Centroid','MajorAxisLength','MinorAxisLength');

%ratiotest=D.MinorAxisLength/D.MajorAxisLength
 compactnesstest=(4*pi*D.Area)/D.Perimeter;
 c=cell(1,4);
 g=cell(1,4);

 a=[m mean(R(:)) mean(G(:)) mean(B(:))]; b=[D.Area D.Perimeter D.Eccentricity compactnesstest];
%  c{1}=m;
%  c{2}=mean(R(:));
%  c{3}=mean(G(:));
%  c{4}=mean(B(:));
%  c{5}=D.Area;
%  c{6}=D.Perimeter;
%  c{7}=D.Eccentricity;
%  c{8}=compactnesstest;
a1=a;
a2=b;
 d=cell(1,6);
 a3=Rx;
 e=cell(1,6);
 a4=Gx;
f=cell(1,6);
 a5=Bx;
 
%  save xxx