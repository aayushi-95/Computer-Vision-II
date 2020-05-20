img = imread('eye.jpg');
h_im = imshow(img);
circ = drawcircle('Center',[380,201],'Radius',150);
BW = createMask(circ);
imshow(BW)