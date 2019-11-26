in = imread('lena.pgm');
[row,col] = size(in);
freq = zeros(256,1);
t = zeros(256,1);

for i=1:row
    for j=1:col
        freq(in(i,j)+1) = freq(in(i,j)+1) + 1;
    end
end

for i=1:256
    p(i) = double(freq(i)/(row*col));
end

for i=1:256
    m1 = 0.0;
    m2 = 0.0;
    p1 = 0.0;
    p2 = 0.0;
    for j=1:i
        p1 = p1 + p(j);
        m1 = m1 + double(j*p(j));
    end
    for j=(i+1):256
        p2 = p2 + p(j);
        m2 = m2 + double(j*p(j));
    end
    t(i) = p1*p2*((double(m1/p1)-double(m2/p2)).^2);
end

max = 0;
for i=1:256
    if max<t(i)
        x = i;
        max = t(i);
    end
end


for i=1:row
    for j=1:col
        if in(i,j)<x
            Out(i,j) =0;
        else
            Out(i,j) = 255;
        end
    end
end

imshow(Out);