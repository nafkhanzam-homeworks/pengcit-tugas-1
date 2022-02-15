number_of_images = 6;

images = collect_images(3, number_of_images);

for i = 4:4
    a = myhistspec(images{1}, images{2});
    figure;myhist(images{1})
    figure;myhist(a);
    figure;imshow(a);
end
