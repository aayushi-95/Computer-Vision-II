I = imread('peppers.png');
Ig=rgb2gray(I);
points=detectSURFFeatures(Ig);
[da,fa]=extractFeatures(Ig,points);
imshow(I)
hold on
plot(fa.selectStrongest(2), 'showOrientation',true)
hold off