function [featurePattern] = featuresFile(imgRGB)

[M N P] = size(imgRGB);
if P == 3
    imgGray = rgb2gray(imgRGB);
else
    imgGray = imgRGB;
end

[glcmFeature] = GLCMfeatures(imgGray);

% shapeFeat = shapeFeatures(imgR);
% 
% F1 = shapeFeat.Rectangularity;
% F2 = shapeFeat.Circularity;
% F3 = shapeFeat.Sphericity;
% F4 = shapeFeat.Convexity;
% F5 = shapeFeat.ConvexityPerimeter;

% featurePattern = [F1 F2 F3 F4 F5];

[gaborFeature] = gaborConvolve(imgGray);
gaborFeature = gaborFeature.gabMag;
gaborFeature = mean(gaborFeature);
gaborFeature = [];

featurePattern = [glcmFeature, gaborFeature];

disp('Feature vector F');
% featurePattern

