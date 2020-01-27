function playVideo(mov, videoObj)
% Play the Video Data

nFrames = videoObj.NumberOfFrames;

% Read one frame at a time.
for k = 1 : nFrames
    imgData = imresize(mov(k).cdata, [240 320]);
    imshow(imgData);
end
