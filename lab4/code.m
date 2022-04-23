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

subplot(2,2,1), imshow(Image), title('Original Image')
subplot(2,2,2), imshow(red), title('Red layer color image')
subplot(2,2,3), imshow(green), title('Green layer color image')
subplot(2,2,4), imshow(blue), title('Blue layer color image')