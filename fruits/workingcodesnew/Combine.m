function cImage=Combine(RGB, fImage, edge)
% Combine the information of the "fImage" matrix and the "edge" matrix.


%i=1;str2='.jpg';
% for i=6:6
%     RGB =imread( strcat(strcat(num2str(i)),str2)); 
%RGB = imread('F:\project\applered.jpg');
%RGB=imread('C:\Users\Anil\Downloads\GitHub\Fruits_Identification\working codes for segmentation\2.jpg');

%figure(1)

%imshow(RGB)
HSI = rgb2hsv(RGB);
%figure(2)
%imshow(HSI)
H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);

%hLow= 0.624;sLow= 0.265;
%hHigh= 0.734;sHigh= 0.823;
%iLow= 0.2146;iHigh= 0.4146;
% fImage=zeros(500,500);
% edge=zeros(500,500);
% fImage=segment(RGB,hLow,hHigh,sLow,sHigh,iLow,iHigh);
% result=EdgeDetection(RGB);
% edge = result;
%figure(3)
%imshow(result)
[Hrow, Hcol] = size(H);
% Now caompare the "fImage" matrix with the "edge" matrix from
% "EdgeDetection.m", and then perform and "imfill" again. Aftwerwards,
% return the combined and filled image.
% Create a matrix "cImage" to combine the pixel information of the "fImage"
% matrix and the "edge" matrix. If the pixel vale in any of these two
% matrices is greater than 0, then we assgin the pixel valeu in the
% "cImage" matrix to 1. Otherwise, it stays 0.
cImage = zeros(Hrow, Hcol);
% Create a matrix "fImage" to restore the filtered image.
% fImage: the filtered image
%HSfill = zeros(Hrow, Hcol);
%edge=EdgeDetection(RGB);
for i=1:Hrow
    for j=1:Hcol
      if (fImage(i,j)>0) || (edge(i,j)>0)
          cImage(i,j) = 1;
      end
     end
end
cImage = imfill(cImage);
%figure(4)
%imshow(cImage)

end