I1=imread('images.jpg');
imshow(I1)
figure(1)


background = imopen(I1,strel('disk',15));
figure(2), surf(double(background(1:8:end,1:8:end))),zlim([0 255]);
set(gca,'ydir','reverse');


I2=I1-background;
figure(3),imshow(I2)
%imtool(I2)
figure(4)



load regioncoordinates;

nColors = 3;
sample_regions = false([size(I1,1) size(I1,2) nColors]);

for count = 1:nColors
  sample_regions(:,:,count) = roipoly(I1,region_coordinates(:,1,count),...
                                      region_coordinates(:,2,count));
end

imshow(sample_regions(:,:,2)),title('sample region for yellow');


cform = makecform('srgb2lab');
lab_I1 = applycform(I1,cform);


a = lab_I1(:,:,2);
b = lab_I1(:,:,3);
color_markers = repmat(0, [nColors, 2]);

for count = 1:nColors
  color_markers(count,1) = mean2(a(sample_regions(:,:,count)));
  color_markers(count,2) = mean2(b(sample_regions(:,:,count)));
end

disp(sprintf('[%0.3f,%0.3f]',color_markers(2,1),color_markers(2,2)));
color_labels = 0:nColors-1;

a = double(a);
b = double(b);
distance = repmat(0,[size(a), nColors]);

for count = 1:nColors
  distance(:,:,count) = ( (a - color_markers(count,1)).^2 + ...
                      (b - color_markers(count,2)).^2 ).^0.5;
end




RGB1 = imread('images.jpg');
RGB2 = imadjust(RGB1,[.2 .3 0; .6 .7 1],[]);
imshow(RGB1), figure, imshow(RGB2)

[value, label] = min(distance,[],3);
label = color_labels(label);
clear value distance;


rgb_label = repmat(label,[1 1 3]);
segmented_images = repmat(uint8(0),[size(I1), nColors]);

for count = 1:nColors
  color = I1;
  color(rgb_label ~= color_labels(count)) = 0;
  segmented_images(:,:,:,count) = color;
end

imshow(segmented_images(:,:,:,1)), title('yellow objects');

imshow(segmented_images(:,:,:,2)), title('black objects');

I3 = imadjust(I2);
imadjust(I1,stretchlim(I1))
figure(4), imshow(I3);