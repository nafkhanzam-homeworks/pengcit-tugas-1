number_of_images = 6;

images = arrayfun( ...
    @(x) imread(append("res/1/",num2str(x),".jpg")), ...
    1:number_of_images, ...
    'UniformOutput', ...
    false ...
);

for i = 1:number_of_images
    im = images{i};
    figure();
    myhist(im);
end