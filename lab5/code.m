img = imread('imgn.jpg'); % Reads the image
gray = rgb2gray(img);
[m,n] = size(gray);
x = 0:255;
y = 0:255;
for i=1:256
    z = 0;
    for j=1:m
        for k=1:n
            if (gray(j,k) == i-1)
                z = z + 1;
            end
        end
    end
    y(i) = z;
end
pdf = zeros(1,256);
cdf = zeros(1,256);
s = sum(y);
for i = 1:256
    pdf(i) = (y(i))/s;
end
cdf = cumsum(pdf);
mul = cdf*255;
y1 = round(mul);
subplot(2,1,1); bar(y); title('Original histogram');
xlabel('Pixel values'); ylabel('Number of pixels');
subplot(2,1,2); bar(y1); title('Equalised histogram');
xlabel('Pixel values'); ylabel('Number of pixels');