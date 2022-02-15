function result = myhisteq(im)
    result = im;
    fmap = freq_map(result);
    sarr = sum_array(fmap);
    [row, col, rgb] = size(result);
    n = double(numel(result));
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                result(i, j, k) = round(sarr(result(i, j, k)+1)*256/n);
            end
        end
    end
    result = uint8(result);
end

function m = freq_map(im)
    m = zeros(1, 256);
    [row, col, rgb] = size(im);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                m(im(i, j, k) + 1) = m(im(i, j, k) + 1) + 1;
            end
        end
    end
end

function m = sum_array(arr)
    m = arr;
    for i=2:256
        m(i) = m(i-1) + m(i);
    end
end
