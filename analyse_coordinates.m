
%
%%%% inputs:
%1/ The homography. This can be a .mat file or a matrix (3 x 3)
%2/ The input points path. This can be a matrix or a file path
%3/ The input video.
%%%% outputs:
%1/ The output, transformed, coordinates

function[coordsOut] = analyse_coordinates(varargin)
    
    homographyIn = varargin{1};
    coordsIn = varargin{2};
    %vidIn = varargin{3};
    
    if (ischar(homographyIn))
        load(homographyIn);
    else
        H = homographyIn;
    end
    
    if (ischar(coordsIn))
        ptsList = dir([coordsIn '*.mat']);
        ptIn = zeros(length(ptsList),2);
        for ii=1:length(ptsList)
            ptsTemp = load([coordsIn ptsList(ii).name]);
            ptIn(ii,:) = ptsTemp.ptIn;
        end
    else
        ptIn = coordsIn;
    end
    
    ptIn = ptIn';
    
    ptOut = H * [ptIn;ones(1,size(ptIn,2))];
    coordsOut = ptOut./(repmat(ptOut(3,:),[3 1]));
    
    %set up colours
    
    figure;
    s = 6;
    c = linspace(0,1,size(coordsOut,2));
    c = [c' flipud(c') ones(length(c),1)];
    %scatter3(coordsOut(1,:),coordsOut(2,:),(1:size(coordsOut,2)),s,c,'fill','markertype','o');
    plot3(coordsOut(1,:),coordsOut(2,:),(1:size(coordsOut,2)),'Marker','o','MarkerEdgeColor','red',...
            'MarkerFaceColor','red','MarkerSize',s,'LineWidth',3);%,'Color',c
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Time');
    %,s,c);%,'fill','markertype','o');
    
    coordsOut = coordsOut(1:2,:)';
end



