function [hLow, hHigh]=Hue(hue, deviation)

% ECE533 Project: Image Segmentation
% Written by: Mon-Ju Wu, Chin-Ya Huang
% This is a function to obtain the range of the hue value and pass the high
% and low end values back to program "ECE533".
% Convert the hue image from RGB into HSI format
% hueHSI: a matrix with the information of Hue, Saturation, and Intensity.
% hueH: a MxN matrix which only carries the information of Hue.

RGB=imread('F:\project\fruits\wtrmlnvf.jpg');

HSI = rgb2hsv(RGB);
%H = HSI(:,:,1);
%S = HSI(:,:,2);
%I = HSI(:,:,3);
%hue = HSI(:,:,1);
hueHSI = rgb2hsv(hue);
hueH = hueHSI(:,:,1);


% Get the size of hueH
% hueRow: the number of rows of hueH.
% hueCol: the number of columns of hueH.
[hueRow, hueCol] = size(hueH);
% Calculate the averaged hue value of the selected area
hTotal = 0;
for i=1:hueRow
for j=1:hueCol
hTotal = hTotal + hueH(i,j);
end
end
hAverage = hTotal/(hueRow*hueCol);
% Create the two boundary of the certain hue value.
% hLow: the low end of the hue range
% hHigh: the high end of the hue range.
%deviation=0.2;
hLow = hAverage - deviation;
hHigh = hAverage + deviation;
end



