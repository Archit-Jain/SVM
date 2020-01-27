function [vidData, videoObj] = readVidData(pathName, fileName)
% Read and play back the movie file


%% Read the video Data

videoObj = mmreader([pathName, '\', fileName]);
nFrames = videoObj.NumberOfFrames;
vidHeight = videoObj.Height;
vidWidth = videoObj.Width;

% Read one frame at a time.
for k = 1 : nFrames
    vidData(k).cdata = read(videoObj, k);
end

