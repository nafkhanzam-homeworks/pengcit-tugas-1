number_of_images = 6;

images = collect_images(2, number_of_images);

for i = 5:5
    im = images{i};
    enhanced_im = enhance_contrast(im, 0.8, 1);
    figure;myhist(im);
    figure;imshow(im);
    figure;myhist(enhanced_im);
    figure;imshow(enhanced_im);
end
