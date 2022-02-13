number_of_images = 6;

images = collect_images(1, number_of_images);

for i = 1:number_of_images
    im = images{i};
    figure();
    myhist(im);
end
