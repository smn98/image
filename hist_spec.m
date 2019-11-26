function hist_spec()
    p1 = hist_eq('land_dull.pgm');
    p2 = hist_eq('lena.pgm');
    A = imread('land_dull.pgm');
    [row,col] = size(A);
    for i=1:256
        for j=1:256
            if  p1(i)==p2(j)
                t(i) = j;
                break
            elseif p1(i)<p2(j)
                t(i) = j-1;
                break
            end
        end
    end
    
    for i=1:row
        for j=1:col
            Out(i,j) = uint8(t(A(i,j)+1));
        end
    end
    
    imshow(Out);
end
   
            
function ret = hist_eq(imagename)
    in = imread(imagename);
    [row,col] = size(in);
    freq = zeros(256,1);
    
    for i = 1:row
        for j=1:col
            freq(in(i,j) + 1) = freq(in(i,j) + 1) + 1;
        end
    end
    
    for i = 2:256
        freq(i) = freq(i) + freq(i-1);
    end
    
    for i=1:256
        p(i) = uint8(255*double(freq(i)/(row*col)));
    end
    ret = p;
end