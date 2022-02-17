function result = enhance_contrast(im, a, b)
    result = double(im);
    rmin = get_rmin(result, uint8(a*255));
    rmax = get_rmax(result, uint8(b*255));
    [row, col, rgb] = size(result);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                result(i, j, k) = map_enhance(result(i, j, k), rmin, rmax);
            end
        end
    end
    result = uint8(result);
end

function result = map_enhance(rval, rmin, rmax)
    if (rval <= rmin)
        result = 0;
    elseif (rval >= rmax)
        result = 255;
    else
        result = round((255*(rval-rmin))/(rmax-rmin));
    end
end

function result = get_rmin(im, threshold)
    result = 255;
    [row, col, rgb] = size(im);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                curr = im(i, j, k);
                if (curr > threshold)
                    result = min(curr, result);
                end
            end
        end
    end
end

function result = get_rmax(im, threshold)
    result = 0;
    [row, col, rgb] = size(im);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                curr = im(i, j, k);
                if (curr < threshold)
                    result = max(curr, result);
                end
            end
        end
    end
end