function result = myhistspec(input, target)
    temp = input;
    histInput = myHistogram(input);
    InputEq = floor(sumArray(histInput) * 255);

    histTarget = myHistogram(target);
    TargetEq = floor(sumArray(histTarget) * 255);
    
    InvHist = zeros(1, 256);
    for i = 1:256
        minIdx = 1;
        minVal = abs(InputEq(i) - TargetEq(1));

        for j = 2:256
            diff = abs(InputEq(i) - TargetEq(j));
            if (diff < minVal)
                minVal = diff;
                minIdx = j - 1;
            end
        end

        InvHist(i) = minIdx;
    end

    [row, col, rgb] = size(input);
    for i = 1:row
        for j = 1:col
            for k = 1:rgb
                temp(i, j, k) = InvHist(input(i, j, k));
            end
        end
    end

    result = temp;
end

function result = sumArray(arr)
    temp = zeros(1, 256);
    sum = 0;
    for i = 1:256
        sum = sum + arr(i);
        temp(i) = sum;
    end
    
    result = temp;
end

function histogram = myHistogram(img)
    [row, col, rgb] = size(img);
    
    histogram = zeros(1, 256);
    for i = 1:row
        for j = 1:col
            for k = 1:rgb
                pixVal = img(i, j, k);
                histogram(pixVal + 1) = histogram(pixVal + 1) + 1;
            end
        end
    end

    histogram = histogram / (row * col * rgb);
end
