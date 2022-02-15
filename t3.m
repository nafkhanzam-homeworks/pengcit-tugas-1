number_of_images = 6;

images = collect_images(3, number_of_images);

for i = 4:4
    im = images{i};
    histeq_im = myhisteq(im);
    figure;myhist(im);
    figure;imshow(im);
    figure;myhist(histeq(im));
    figure;imshow(histeq(im));
    figure;myhist(histeq_im);
    figure;imshow(histeq_im);
end
