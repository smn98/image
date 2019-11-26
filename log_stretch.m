img = imread('land_dull.pgm');
[row, col] = size(img);
rmin = 256;
rmax = 0;

for i = 1:row
    for j = 1:col
        if img(i,j)<rmin
            rmin = img(i,j);
        end
        if img(i,j)>rmax
            rmax = img(i,j);
        end
    end
end

for i=1:row
    for j=1:col
        Out(i,j) = 255* log(double(img(i,j)-rmin +1))/log(double(rmax -rmin+1));
    end
end
imshow(Out);