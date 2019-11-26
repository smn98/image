img = imread('land_dull.pgm');
[row, col] = size(img);
freq = zeros(256,1);
for i=1:row
    for j=1:col
        freq(img(i,j)+1) = freq(img(i,j)+1) + 1;
    end
end

for i = 2:256
    freq(i) = freq(i) + freq(i-1);
end

for i = 1:row
    for j=1:col
        Out(i,j) = uint8(255*double(freq(img(i,j)+1))/(row*col));
    end
end
imshow(Out);