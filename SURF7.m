I = imread('peppers.png');
I1 = imrotate(I,90);
Is = imresize(I1,0.5);
Ig=rgb2gray(Is);
points=detectSURFFeatures(Ig);
[da,fa]=extractFeatures(Ig,points);
imshow(Is)
hold on
plot(fa.selectStrongest(2), 'showOrientation',true)
hold off