
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%    START WRITING OF TRACKED IMAGES    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%first and last frames to write
firstFrame = 1;
lastFrame = 70;
skipFrames = trackingParameters.skipFrames;
markerSize = 3;

%read input video
vidIn = read_video([inputPath '/' inputFileName]);
nbFrames = get(vidIn,'NumberOfFrames');
[~,fileNoExt,~] = fileparts(inputFileName);

for ii=firstFrame:skipFrames:lastFrame
    imgIn = read(vidIn,ii);

    trackFile = [outputFilePath '/' fileNoExt outputFileName '_frame_' sprintf('%06d',ii) '.mat'];

    if(~exist(trackFile,'file'))
        error(['Error, no file named ' trackFile ' was found.'])
    end

    load(trackFile,'ptIn');
    ptIn = round(ptIn);
    %imgIn = insertMarker(imgIn, ptIn, 'o', 'Color', 'green','Size', 8);
    imgIn(max(ptIn(2)-markerSize,1):min(ptIn(2)+markerSize,size(imgIn,1)), ...
        max(ptIn(1)-markerSize,1):min(ptIn(1)+markerSize,size(imgIn,2)),:) = 0;
    imgIn(max(ptIn(2)-markerSize,1):min(ptIn(2)+markerSize,size(imgIn,1)), ...
        max(ptIn(1)-markerSize,1):min(ptIn(1)+markerSize,size(imgIn,2)),2) = 255;
    
    imwrite(uint8(imgIn),[outputFilePath '/' fileNoExt '_tracked_image_frame_' sprintf('%06d',ii) '.png']);
end
