in = imread('lena.pgm');
[row,col] = size(in);

t = 100.0;
t1 = 0.0;

while(t~=t1)
    l = 0.0;
    lc = 0;
    r = 0.0;
    rc = 0;
    for i = 1:row
        for j= 1:col
            if in(i,j) <t
                l = l+ double(in(i,j));
                lc = lc + 1;
            else
                r = r + double(in(i,j));
                rc = rc + 1;
            end
        end
    end
    t1 = t;
    t = double(((l/lc)+(r/rc))/2);
end

for i=1:row
    for j=1:col
        if in(i,j)<t
            Out(i,j) =0;
        else
            Out(i,j) = 255;
        end
    end
end

imshow(Out);