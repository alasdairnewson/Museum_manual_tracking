

close all;
clear all;
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   INPUT AND OUTPUT FILE PATHS AND NAMES    %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if(~exist('tracking_parameters.mat'))
    error('The tracking parameters have not been set. Please run "set_tracking_parameters.m');
end
load('tracking_parameters.mat');

inputPath = trackingParameters.inputPath;
inputFileName = trackingParameters.inputFileName;
outputFilePath = trackingParameters.outputFilePath;
outputFileName = trackingParameters.outputFileName;

%read input video
vidIn = VideoReader([inputPath '/' inputFileName]);
nbFrames = get(vidIn,'NumberOfFrames');
[~,fileNoExt,~] = fileparts(inputFileName);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    START MANUAL TRACKING    %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

firstFrame = 1;
lastFrame = nbFrames;

figure;
for ii=firstFrame:lastFrame
    imgIn = read(vidIn,ii);
    imshow(imgIn);
    title(['Frame number ' sprintf('%d',ii)]);
    %click on a point
    [ptX,ptY] = getpts();
    ptIn = [ptX(1) ptY(1)];
    
    %save the tracked point
    save([outputFilePath '/' fileNoExt outputFileName '_frame_' sprintf('%06d',ii) '.mat'],'ptIn');
end
