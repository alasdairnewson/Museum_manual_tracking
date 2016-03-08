
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
vidIn = read_video([inputPath '/' inputFileName]);
nbFrames = get(vidIn,'NumberOfFrames');
[~,fileNoExt,~] = fileparts(inputFileName);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    START MANUAL TRACKING    %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

firstFrame = 1;
lastFrame = 700;
skipFrames = trackingParameters.skipFrames;

figure;
for ii=firstFrame:skipFrames:lastFrame
    imgIn = read(vidIn,ii);
    imshow(imgIn);
    title(['Frame number ' sprintf('%d',ii)]);
    %click on a point
    [ptX,ptY] = getpts();
    ptIn = [ptX(1) ptY(1)];
    
    %save the tracked point as a .mat file
    save([outputFilePath '/' fileNoExt outputFileName '_frame_' sprintf('%06d',ii) '.mat'],'ptIn');
    %save the tracked point as a .txt file
    dlmwrite([outputFilePath '/' fileNoExt outputFileName '_frame_' sprintf('%06d',ii) '.txt'],ptIn);
end
