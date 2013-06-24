function [sLow, sHigh]=Saturation(RGB, deviation)
% ECE533 Project: Image Segmentation
% Written by: Mon-Ju Wu, Chin-Ya Huang
% This is a function to obtain the range of the saturation value and pass
% the high and low end values back to program "ECE533".
% Convert the saturation image from RGB into HSI format
% hueHSI: a matrix with the information of Hue, Saturation, and Intensity.
% saturationS: a MxN matrix which only carries the information of Saturation.
% Read in the whole image and get its size
% RGB: the image in RGB format
%RGB = imread('G:\project\player2.jpg');
%RGB=imread('image65.jpg');
HSI = rgb2hsv(RGB);
%H = HSI(:,:,1);
S = HSI(:,:,2);
%I = HSI(:,:,3);
%[row, col, layer] = size(RGB);

saturationHSI = rgb2hsv(S);

% Get the size of saturationS
% saturationRow: the number of rows of saturationS.
% saturationCol: the number of columns of saturationS.
[saturationRow, saturationCol] = size(saturationHSI);
% Calculate the averaged saturation value of the selected area
sTotal = 0;
for i=1:saturationRow
for j=1:saturationCol
sTotal = sTotal + S(i,j);
end
end
sAverage = sTotal/(saturationRow*saturationCol);
% Create the two boundary of the certain saturation value.
% sLow: the low end of the saturation range
% sHigh: the high end of the saturation range.
%deviation=0.2;
sLow = sAverage - deviation;
sHigh = sAverage + deviation;
if sHigh>1
sHigh = 1;
end
if sLow<0
sLow = 0;
end



