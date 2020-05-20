im = imread('Lego_Helicopter.jpg');
im1 = imresize(im,0.5);
img = rgb2gray(im1);
tic
points = detectHarrisFeatures(img);
toc
imshow(im1); hold on;
plot(points.selectStrongest(50));