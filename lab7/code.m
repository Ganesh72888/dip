clear all; close all; clc;

% Reading the image
Img = imread('imgn.jpg');
% Converting the image into gray scale
gray = rgb2gray(Img);
% Extracting the size of the image
[m,n] = size(gray);
% Converting the unsigned integer to a double type
gray1 = double(gray);
% Decimal to binary converter
bin = de2bi(gray1);

% Extracting LSB plane
plane1 = bin(:,1);
p1 = reshape(plane1,m,n);
% Extracting 2 bit(from the left) plane
plane2 = bin(:,2);
p2 = reshape(plane2,m,n);
% Extracting 3 bit(from the left) plane
plane3 = bin(:,3);
p3 = reshape(plane3,m,n);
% Extracting 4 bit(from the left) plane
plane4 = bin(:,4);
p4 = reshape(plane4,m,n);
% Extracting 5 bit(from the left) plane
plane5 = bin(:,5);
p5 = reshape(plane5,m,n);
% Extracting 6 bit(from the left) plane
plane6 = bin(:,6);
p6 = reshape(plane6,m,n);
% Extracting 7 bit(from the left) plane
plane7 = bin(:,7);
p7 = reshape(plane7,m,n);
% Extracting MSB plane
plane8 = bin(:,8);
p8 = reshape(plane8,m,n);

% Plotting all the bit plane results
subplot(2,5,1);
imshow(Img);title('Original Image');
subplot(2,5,2);
imshow(gray);title('Gray scale Image');
subplot(2,5,3);
imshow(p1);title('LSB Bit Plane');
subplot(2,5,4);
imshow(p2);title('2nd Bit Plane');
subplot(2,5,5);
imshow(p3);title('3rd Bit Plane');
subplot(2,5,6);
imshow(p4);title('4th Bit Plane');
subplot(2,5,7);
imshow(p5);title('5th Bit Plane');
subplot(2,5,8);
imshow(p6);title('6th Bit Plane');
subplot(2,5,9);
imshow(p7);title('7th Bit Plane');
subplot(2,5,10);
imshow(p8);title('MSB Bit Plane');