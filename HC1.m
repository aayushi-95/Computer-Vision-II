
im = imread('Lego_helicopter.jpg');
img = rgb2gray(im);
fprintf('With Filter Size 21\n');
tic
points = detectHarrisFeatures(img, 'FilterSize', 21);
toc
imshow(im); hold on;
plot(points.selectStrongest(50));