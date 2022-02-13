number_of_images = 4;

images = collect_images(2, number_of_images);

for i = 1:number_of_images
    im = images{i};
    figure();
    myhist(im);
end
