function [iLow, iHigh]=Intensity(RGB, deviation)
% ECE533 Project: Image Segmentation
% Written by: Mon-Ju Wu, Chin-Ya Huang
% This is a function to obtain the range of the intensity value and pass
% the high and low end values back to program "ECE533".
% Convert the intensity image from RGB into HSI format
% intensityHSI: a matrix of the information of Hue, Saturation, and Intensity.
% intensityI: a MxN matrix which only carries the information of Intensity.

%RGB = imread('F:\project\player2.jpg');
%RGB=imread('image65.jpg');
HSI = rgb2hsv(RGB);

intensityHSI = rgb2hsv(RGB);
intensityI = intensityHSI(:,:,3);
% Get the size of intensityI
% intensityRow: the number of rows of intensityI.
% intensityCol: the number of columns of intensityI.
[intensityRow, intensityCol] = size(intensityI);
% Calculate the averaged intensity value of the selected area
iTotal = 0;
for i=1:intensityRow
for j=1:intensityCol
iTotal = iTotal + intensityI(i,j);
end
end
iAverage = iTotal/(intensityRow*intensityCol);
% Create the two boundary of the certain intensity value.
% iLow: the low end of the intensity range
% iHigh: the high end of the intensity range.
%deviation=0.1;
iLow = iAverage - deviation;
iHigh = iAverage + deviation;
if iHigh>1
iHigh = 1;
end
if iLow<0
iLow = 0;
end

