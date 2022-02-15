function histspec = myhistspec(inputImg, targetImg)
    input = inputImg;
    [rowI, columnI, rgbI] = size(input);
    histInput = myhisteq(input);
    sEq = histInput;
    sArr = double(sum_array(freq_map(sEq))) * 256 / (rowI * columnI * rgbI);
    
    target = targetImg;
    [rowT, columnT, rgbT] = size(target);
    histTarget = myhisteq(target);
    vEq = histTarget;
    vArr = double(sum_array(freq_map(vEq))) * 256 / (rowT * columnT * rgbT);

    invArr = zeros(1, 256);
    for i = 1:256
        minVal = abs(sArr(i) - vArr(1));
        minIdx = 1;
        for j = 2:256
            if (minVal > abs(sArr(i) - vArr(j)))
                minVal = abs(sArr(i) - vArr(j));
                minIdx = j;
            end
        end
        invArr(i) = minIdx;
    end
    
    for m = 1:rowI
        for n = 1:columnI
            for k = 1:rgbI
                input(m, n, k) = invArr(input(m, n, k));
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