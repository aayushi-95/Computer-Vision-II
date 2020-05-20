%Q1: Dimensions of image, max and min value of pixel and their locations
im1 = imread('phyllis.png');
 figure(1);
 imshow(im1),title('Original Image');
 [r,col] = size(im1);
maxVal = max(im1(:));
minVal = min(im1(:));
%[check,idx]=max(im(:));
[rowsOfMaxes colsOfMaxes] = find(im1 == maxVal);
int = im1(2,2);
int1 = im1(12,12);
fprintf("Dimensions of the image are %d %d\n",r,col);
fprintf("Max and min values %d %d\n",maxVal,minVal);
fprintf("Vale of pixel intensity at (2,2) and (12,12) is %d %d\n",int,int1);

%Q2: Apply Gaussian Filter with different boundary modifications
hsize = [3 3];
h = fspecial('gaussian',hsize,1);
int2 = h(3,3);
fprintf("Value of pixel intenstity at (3,3) for Gaussian Filter is %d\n",int2);

im2 = imfilter(im1,h);
ze = im2(1,1);
ze1 = im2(5,5);
im3 = imfilter(im1,h,'replicate');
re = im3(1,1);
re1 = im3(5,5);
im4 = imfilter(im1,h,'symmetric');
se = im4(1,1);
se1 = im4(5,5);
im5 = imfilter(im1,h,'circular');
ce = im5(1,1);
ce1 = im5(5,5);

fprintf("Vale of pixel intensity at (2,2) and (12,12) for zero padded boundary is %d %d\n",ze,ze1);
fprintf("Vale of pixel intensity at (2,2) and (12,12) for replicate boundary is %d %d\n",re,re1);
fprintf("Vale of pixel intensity at (2,2) and (12,12) for symmetric boundary is is %d %d\n",se,se1);
fprintf("Vale of pixel intensity at (2,2) and (12,12) for circular boundary is %d %d\n",ce,ce1);

subplot(2,2,1),imshow(im2),title('Zero padded boundary');
subplot(2,2,2),imshow(im3),title('Replicate boundary');
subplot(2,2,3),imshow(im4),title('Symmetric boundary');
subplot(2,2,4),imshow(im5),title('Circular boundary');

%Q3 Convolution and Correlation using filter provided
 h1 = 0.167*[1 1 0;1 0 0;1 1 1];
 im6 = imfilter(im1,h1,'corr');
 figure(6);
 imshow(im6),title('Correlation');
 
  im7 = imfilter(im1,h1,'conv');
  figure(7);
  imshow(im7),title('Convolution');

cr = im6(5,5);
co = im7(5,5);

fprintf("Vale of pixel intensity at (5,5) for correlation is %d\n",cr);
fprintf("Vale of pixel intensity at (5,5) for convolution is %d\n",co);
 
% %Q4 Convolution and Correlation using gaussian filter 
 im8 = imfilter(im1,h,'corr');
 figure(8);
 imshow(im8),title('Correlation with Gaussian Filter');
 
 im9 = imfilter(im1,h,'conv');
 figure (9);
 imshow(im9),title('Convolution with Gaussian Filter');

crg = im8(5,5);
cog = im9(5,5);

fprintf("Vale of pixel intensity at (5,5) for correlation is %d\n",crg);
fprintf("Vale of pixel intensity at (5,5) for convolution is %d\n",cog);
 
%Q5 Median Filterig to remove noise
 im10 = imread('phyllis_noise.png');
 figure(10);
 imshow(im10),title('Noise');
 no = im10(12,12);

 fprintf("Vale of pixel intensity at (12,12) for noise image is %d\n",no);
 
 im11 = medfilt2(im10);
 figure(11);
 imshow(im11),title('Median Filtering');

me = im11(12,12);
or = im1(12,12);
 fprintf("Vale of pixel intensity at (12,12) after median filtering is %d\n",me);
 fprintf("Vale of pixel intensity at (12,12) for original image is %d\n",or);

%Q6 Normalize Cross Correlation
img = imread('hiero.png');
template = imread('hiero_t.png');
c = normxcorr2(template,img);
 figure(12);
 mesh(c),title('Normalzie Cross Correlation'), shading flat;
[Xpeak, Ypeak] = find(c==max(c(:)));
matches = size(find(c>0.75));
fprintf("Number of good matches gretaer than 0.75 is %d\n",matches(1));

yoffSet = Xpeak-size(template,1);
xoffSet = Ypeak-size(template,2);

 figure(13);
 imshow(img),title('Template Matching');
imrect(gca, [xoffSet+1, yoffSet+1, size(template,2), size(template,1)]);


% Q7 Edge detectors using Canny and Sobel
blocks = imread('blocks.png');
% can = edge(blocks,'Canny');
[can, threshout_canny] = edge(blocks,'Canny');
thresh = [0.05 0.09];
can1 = edge(blocks,'Canny',thresh,1);
 figure(14);
imshow(can),title('Canny Edge detection');
fprintf("Default Canny value of High threshold : %.4f, Low Threshold : %.4f Sigma : 1.414(Sqrt(2))\n",threshout_canny(1),threshout_canny(2));
 figure(15);
imshow(can1),title('Canny Edge detection with parameter tuning');

%  sob = edge(blocks,'sobel');
[sob, threshout_sobel] = edge(blocks,'Sobel');
 figure(16);
 imshow(sob),title('Sobel Edge Detetction');
 sob1 = edge(blocks,'sobel',0.09);
 figure(17);
 imshow(sob1),title('Sobel Edge Detetction with paramter tuning');
 fprintf("Default sobel value Threshold : %.4f\n",threshout_sobel);

