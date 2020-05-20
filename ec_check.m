clc;
clear all;

vidReader = VideoReader('sheepsC.avi','CurrentTime',6);

vidObj = VideoReader('sheepsC.avi');
numFrames = ceil(vidObj.FrameRate*vidObj.Duration);
fprintf('Number of frames is %d \n',numFrames);

opticFlow = opticalFlowHS;
h = figure;
movegui(h);
hViewPanel = uipanel(h,'Position',[0 0 1 1],'Title','Plot of Optical Flow Vectors');
hPlot = axes(hViewPanel);
i=0;

fprintf('Checking for 2 frames');
% while  hasFrame(vidReader)
while numFrames>339
    i=i+1;
    numFrames = numFrames-1;
    frameRGB = readFrame(vidReader);
    frameGray = rgb2gray(frameRGB);  
    flow = estimateFlow(opticFlow,frameGray);
    imshow(frameRGB)
    hold on
    plot(flow,'DecimationFactor',[5 5],'ScaleFactor',60,'Parent',hPlot);
    hold off
    pause(10^-3)
end



% %Count number of frames
%  videoFileReader = vision.VideoFileReader('visiontraffic.avi');
%  count= 0;
%  while ~isDone(videoFileReader)
%  
%        % Read a video frame and run the detector.
%        videoFrame = step(videoFileReader);
%        count= count+1;
%  end