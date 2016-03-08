

close all;
clear all;
restoredefaultpath;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   INPUT AND OUTPUT FILE PATHS AND NAMES    %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%put input file path here
trackingParameters.inputPath = '/home/alasdair/Alasdair/Postdoc/2015_descartes/Codes/Tracking/Museum/Automatic_tracking';
%put the input file name here :
trackingParameters.inputFileName = 'Museum_front_resized.mp4';
%put the path where you want to save the file info here
trackingParameters.outputFilePath = '/home/alasdair/Alasdair/Postdoc/2015_descartes/Codes/Tracking/Museum/Manual_tracking/test_output';
%the generic name of the tracking files
trackingParameters.outputFileName = '_tracking';
%number of frames you wish to skip in the annotation
trackingParameters.skipFrames = 15;

save('tracking_parameters.mat','trackingParameters');