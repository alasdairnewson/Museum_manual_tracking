
function[] = write_tracked_video(varargin)

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
    %%%%%%%    START WRITING OF TRACKED VIDEO     %%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %first and last frames to write
    if (nargin == 0)
        firstFrame = 1;
        lastFrame = 80;
    else
        firstFrame = varargin{1};
        lastFrame = varargin{2};
    end
    skipFrames = trackingParameters.skipFrames;

    %read input video
    vidIn = read_video([inputPath '/' inputFileName]);
    nbFrames = get(vidIn,'NumberOfFrames');
    [~,fileNoExt,~] = fileparts(inputFileName);

    %create output video
    vidOut = VideoWriter([outputFilePath '/' fileNoExt '_tracked_video.avi']);
    open(vidOut);

    for ii=firstFrame:skipFrames:lastFrame
        imgIn = read(vidIn,ii);

        trackFile = [outputFilePath '/' fileNoExt outputFileName '_frame_' sprintf('%06d',ii) '.mat'];

        if(~exist(trackFile,'file'))
            close(vidOut);
            error(['Error, no file named ' trackFile ' was found.'])
        end

        load(trackFile,'ptIn');
        imgIn = insertMarker(imgIn, ptIn, 'o', 'Color', 'green','Size', 8);
        writeVideo(vidOut,uint8(imgIn));
    end
    close(vidOut);
end