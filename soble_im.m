img = imread('lena.pgm');
x=[1 0 -1; 1 0 -1; 1 0 -1];
y=[1 1 1; 0 0 0; -1 -1 -1];
[row, col] = size(img);


for i=1:row
    for j=1:col
        gx = 0;
        gy = 0;
        for k=-1:1
            for l = -1:1
                if(i+k>0 &&  j+l>0 && i+k<=row && j+l<=col)
                    gx = gx + double(img(i+k,j+l))*double(x(k+2,l+2));
                    gy = gy + double(img(i+k,j+l))*double(y(k+2,l+2));
                end
            end
        end
        g = sqrt(gx.^2 + gy.^2);
        Out(i,j) = uint8(g);
    end
end
imshow(Out);