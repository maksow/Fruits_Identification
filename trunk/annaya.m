I=imread('C:/Users/ARUN1/Pictures/Camera Roll/index.jpg'); % 'fruit images/fruits2.jpg', '../fruits/index.jpg', 
imshow(I)
figure(1)

background = imopen(I,strel('disk',15));
figure(2), surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');

I2=I-background;
figure(3),imshow(I2)
%imtool(I2)
figure(4)



I3 = imadjust(I2);
imadjust(I,stretchlim(I))
figure(4), imshow(I3);