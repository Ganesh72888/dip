Image = imread('imgn.jpg');
s = size(Image);

Img1 = Image;
Img1(:,:,2)=0;
Img1(:,:,3)=0;
red = Img1;

Img2 = Image;
Img2(:,:,1)=0;
Img2(:,:,3)=0;
green = Img2;

Img3 = Image;
Img3(:,:,1)=0;
Img3(:,:,2)=0;
blue = Img3;

r = Image(:,:,1);
g = Image(:,:,2);
b = Image(:,:,3);
gray = uint8(double(r/3)+double(g/3)+double(b/3));

for i = 1:s(1)
    for j = 1:s(2)
        if gray(i,j) > 180
            bin(i,j) = 1;
        else
            bin(i,j) = 0;
        end
        I1(i,j) = uint8(gray(i,j) + bin(i,j));
        I2(i,j) = uint8(gray(i,j) + 20);
    end
end

subplot(3,5,3), imshow(Image), title('Original Image')
subplot(3,5,6), imshow(red), title('Red layer color image')
subplot(3,5,7), imshow(green), title('Green layer color image')
subplot(3,5,8), imshow(blue), title('Blue layer color image')
subplot(3,5,9), imshow(r), title('Red layer from RGB')
subplot(3,5,10), imshow(g), title('Green layer from RGB')
subplot(3,5,11), imshow(b), title('Blue layer from RGB')
subplot(3,5,12), imshow(gray), title('Gray scale Image')
subplot(3,5,13), imshow(bin), title('Binary Image')
subplot(3,5,14), imshow(I1), title('Addition of gray and binary images')
subplot(3,5,15), imshow(I2), title('20 added to gray scale image')