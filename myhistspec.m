function histspec = myhistspec(inputImg, targetImg)
    input = inputImg;
    [rowI, columnI, rgbI] = size(input);
    histInput = myhisteq(input);
    sEq = histInput;
    sArr = floor(sum_array(hist(sEq(:), 0:255) / (rowI * columnI * rgbI)) * 255);
    
    target = targetImg;
    [rowT, columnT, rgbT] = size(target);
    histTarget = myhisteq(target);
    vEq = histTarget;
    vArr = floor(sum_array(hist(vEq(:), 0:255) / (rowT * columnT * rgbT)) * 255);

    invArr = zeros(1, 256);
    for i = 1:256
        minVal = abs(sArr(i) - vArr(1));
        minIdx = 1;
        for j = 2:256
            if (minVal > abs(sArr(i) - vArr(j)))
                minVal = abs(sArr(i) - vArr(j));
                minIdx = j - 1;
            end
        end
        invArr(i) = minIdx;
    end

    for m = 1:rowI
        for n = 1:columnI
            for k = 1:rgbI
                input(m, n, k) = invArr(input(m, n, k) + 1);
            end
        end
    end

    histspec = uint8(input);
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