clear all;
close all;
clc;
% Reading the Image
Img = imread('imgn.jpg');
% Increasing and decreasing the contrast of color image
inc = Img*2;
dec = Img/2;
% Converting the RGB image to gray scale
gray = rgb2gray(Img);
% Increasing and decreasing the contrast of gray image
ginc = gray*2;
gdec = gray/2;

% Plotting all the images found
subplot(231); imshow(Img); title('Original RGB image')
subplot(232); imshow(inc); title('RGB image with increased contrast')
subplot(233); imshow(dec); title('RGB image with decreased contrast')
subplot(234); imshow(gray); title('Original gray scale image')
subplot(235); imshow(ginc); title('Gray image with increased contrast')
subplot(236); imshow(gdec); title('Gray image with decreased contrast')