function selectQuery

%% Query Image Reader
close all;

[fileName folderName] = uigetfile({'*.avi'}, 'Select an Video for Retrival', '..\Dataset\Test');

if ~fileName
    warndlg('File not Selected');
    
    return;
end

featurePattern = videoFeatures(folderName, fileName);

%% writing in files
fidF = fopen('TestFeature.dat', 'w');

%% writing in file
fprintf(fidF, '%f ', featurePattern);
fprintf(fidF, '\n');

fclose(fidF);

