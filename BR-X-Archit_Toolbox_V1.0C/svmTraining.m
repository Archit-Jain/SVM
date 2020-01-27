function svmTraining
% function SVM Train

% Load the featrue data.
load Features.dat
load Outtype.dat

[AlphaY, SVs, Bias, Parameters, nSV, nLabel] = SVMTrain(double(Features'), Outtype');

save SVMStruct AlphaY SVs Bias Parameters nSV nLabel

disp('Done');

