function result = enhance_contrast(im)
    result = double(im);
    rmin = get_rmin(result);
    rmax = get_rmax(result);
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
    if (rval < rmin)
        result = 0;
    elseif (rval > rmax)
        result = 255;
    else
        result = round((255*(rval-rmin))/(rmax-rmin));
    end
end

function result = get_rmin(im)
    result = 255;
    [row, col, rgb] = size(im);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                result = min(result, im(i, j, k));
            end
        end
    end
end

function result = get_rmax(im)
    result = 0;
    [row, col, rgb] = size(im);
    for i=1:1:row
        for j=1:1:col
            for k=1:1:rgb
                result = max(result, im(i, j, k));
            end
        end
    end
end