

22 June 2015
Author : Alasdair Newson
Duke University
Email : alasdairnewson@gmail.com


This is the README file for the manual tracking code of the 'Museum' project. Please read this file to understand how the code works. If you have problems, please contact the author.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     SOFTWARE AND LANGUAGE OF THE CODE      %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This code is designed to be used with Matlab. You should install Matlab, and you should be able to run the code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%       GOAL AND FUNCTIONS OF THE CODE       %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The goal of this code is to manually track a person in a video. 'Manual tracking' means clicking frame-by-frame on the position of the person in the video. The 'position' is left for the user to decide (it could be the person's feet, head or torso for example).

The code has three functionalities, which are accessed through three files :

- 'manual_tracking.m' : this function allows you to manually track the position of the person. The code writes the position to a '.mat' file. This does not create any image files, because there may be many and this would take too much space.

- 'write_tracked_images.m' : this function takes the tracking point, and indicates it on the input image, then writes the annotated image. This is done so that you can check whether your tracking is done correctly. You can specify the first and last frame you would like to check.

- 'write_tracked_video.m' : this function takes the tracking point, and indicates it on a frame of the input video, then writes the annotated video. This is done so that you can check whether your tracking is done correctly. You can specify the first and last frame you would like to check.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%           TRACKING PARAMETERS              %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The first thing to do is to check the following file : 'set_tracking_parameters.m'. This file determines the input and output file paths/names. Please modify this file to suit your needs, and then run it. This will create a file named 'tracking_parameters.mat', which will save all the information. This file is needed in order to run 'manual_tracking.m', 'write_tracked_images.m' and 'write_tracked_video.m'.

If the file does not exist, or the names/paths which you have indicated do not exist, then you will receive an error when you try to run the other files.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              MANUAL TRACKING               %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

The file named 'manual_tracking.m' allows you to manually track the position of a person, by clicking on that person's position. Run the file, and an image of the video will appear. Right-click on the person, and the next image will appear. The position will be saved to the 'outputFilePath'.

You can specify the first and last frames which you want to annotate, by changing the 'firstFrame' and 'lastFrame' variables. If you want to stop the code, just close the image window.

Note : this annotation is not saved to an image or a video file, so as not to waste space. If you want to visualise your annotation, run either 'write_tracked_images.m' or 'write_tracked_video.m'.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%          VISUALISING THE TRACKING          %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

If you want to see your manual tracking, you can run 'write_tracked_images.m' or 'write_tracked_video.m'. This will save either a series of images or a video with the tracked point annotated to the output folder. You can specify the first and last frame to be saved by changing the 'firstFrame' and 'lastFrame' variables, respectively. If the tracked position does not exist for the specified frames or video file name, you will receive an error.
