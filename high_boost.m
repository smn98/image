a=imread('land.pgm');
[row, col] = size(a);

kernel=[0 -1 0; -1 8 -1; 0 -1 0];
b = conv2(double(a), double(kernel),'same');
        

%disp(size(out));    
 imshow(uint8(b));