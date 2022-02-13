number_of_images = 6;

images = collect_images(2, number_of_images);

for i = 1:number_of_images
    im = images{i};
    enhanced_im = enhance_contrast(im);
%     figure;myhist(im);
    figure;myhist(enhanced_im);
end
