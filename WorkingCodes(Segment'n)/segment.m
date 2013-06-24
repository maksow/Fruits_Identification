function HSfill=segment(RGB, hLow, hHigh, sLow, sHigh, iLow,iHigh)
% ECE533 Project: Image Segmentation
% Written by: Mon-Ju Wu, Chin-Ya Huang
% This is a function to filter the image and find out the pixels whose hue
% and saturation are within the threshhold value. It will screen through
% segment image according to the range of the hue. and
% Convert the RGB image into HSI
% HSI: a matrix with the information of Hue, Saturation, and Intensity.
% H: a MxN matrix which only carries the information of Hue.
% S: a MxN matrix which only carries the information of Saturation.
% I: a MxN matrix which only carries the information of Intensity.
%RGB = imread('G:\project\player2.jpg');
%RGB = imread('image65.jpg');
%figure(1)
%imshow(RGB)
HSI = rgb2hsv(RGB);
%figure(2)
%imshow(HSI)
H = HSI(:,:,1);
S = HSI(:,:,2);
I = HSI(:,:,3);
% Get the size of H
% Hrow: the number of rows of H.
% Hcol: the number of columns of H.
[Hrow, Hcol] = size(H);
% Perform "closing" on Hue matrix
% Screen through the Hue matrix (H), and the Saturation matrix (S). If its
% value falls within the range of the Hue and Saturation, then assign its
% value to 1. Otherwise, let its value stay zero. Afterwards, we perform
% "closing" to fill in the gap, and use "imfill" to fill in the pixels.
% HSclosing: the Hue matrix after closing.
% HSfill: the result after applying "imfill" function to "Hclosing" matrix.
% B: a 3*3 structure element
HSclosing = zeros(Hrow, Hcol);
B = ones(3,3);
%hLow= 0.624; sLow= 0.265;
%hHigh= 0.734; sHigh= 0.823;
%iLow=0.5656;iHigh=0.7656;
for i=1:Hrow
for j=1:Hcol
  if ((H(i,j)>=hLow) && (H(i,j)<=hHigh) && (S(i,j)>=sLow) && (S(i,j)<=sHigh)&& (I(i,j)>=iLow) && (I(i,j)<=iHigh))
     HSclosing(i,j) = 1;
end

end

end
HSclosing = imclose(HSclosing,B);
HSfill = imfill(HSclosing);
%figure(3)
%imshow(HSfill)
% So now we obtain the value of the Hue, Saturation, and Intensity of
% certain area within the certain range of the hue. Now we pass these
% values of "fImage" back to the main program, "ECE533".

