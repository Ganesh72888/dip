Img1 = imread('imgn.jpg');

r = Img1(:,:,1);
g = Img1(:,:,2);
b = Img1(:,:,3);
Img1 = uint8(double(r/3)+double(g/3)+double(b/3));

s = size(Img1);
Img2 = Img1;

for i = 166:270
    for j= 150:250
        Img2(i,j)=0;
    end
end

Img3 = Img1 - Img2;

subplot(3,1,1), imshow(Img1); title('Original Gray Scale Image - Image1')
subplot(3,1,2), imshow(Img2); title('Gray Scale with some zero intensity pixels - Image2')
subplot(3,1,3), imshow(Img3); title('Image3 = Image1 - Image2')