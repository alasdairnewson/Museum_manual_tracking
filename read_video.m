
%function to read a video
function[vidIn] = read_video( fileName )

    %vidIn = mmreader(fileName);
    vidIn = VideoReader(fileName);

end

