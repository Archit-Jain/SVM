function featurePattern = videoFeatures(pathName, fileName)

[vidData, videoObj] = readVidData(pathName, fileName);

featurePattern = [];
for i = 1:10:100
    imgRGB = vidData(i).cdata;
    [featPattern] = featuresFile(imgRGB);
    featurePattern = [featurePattern, featPattern];
end

