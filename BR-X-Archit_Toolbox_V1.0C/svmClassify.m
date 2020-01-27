function classified = svmClassify

load SVMStruct;

load TestFeature.dat;

[OutType, DecisionValue] = SVMClass(double(TestFeature'), AlphaY, SVs, Bias, Parameters, nSV, nLabel);

if DecisionValue == 1
    classified = 1;
    msgbox('Selected is Games');
    winopen('..\Dataset\Train\01\');
    
elseif DecisionValue == 2
    classified = 2;
    msgbox('Selected is News');
    winopen('..\Dataset\Train\02\');
    
elseif DecisionValue == 3
    classified = 3;
    msgbox('Selected is Animal');
    winopen('..\Dataset\Train\03\');
    
else
    classifiedFlag = -1;
    msgbox('Cant Classify');
end

%% End
disp('Done: Classification');

