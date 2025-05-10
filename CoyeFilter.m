
%% Computer Assisted Retinal Blood Vessel Segmentation Algorithm
% Developed and Copyrighted by Tyler L. Coye (2015)
%
% Read Image
close all;
I = imread("D:\Study\Matlab\Basics\sample\all Dataset\images\01_dr.JPG")
% Resize image for easier computation
B = imresize(I, [584 565])
% Read image
im = im2double(B);
% Convert RGB to Gray via PCA
lab = rgb2lab(im);
f = 0;
wlab = reshape(bsxfun(@times,cat(3,1-f,f/2,f/2),lab),[],3);
[C,S] = pca(wlab);
S = reshape(S,size(lab));
S = S(:,:,1);
gray = (S-min(S(:)))./(max(S(:))-min(S(:)));
%% Contrast Enhancment of gray image using CLAHE
J = adapthisteq(gray,'numTiles',[8 8],'nBins',128);
%% Background Exclusion
% Apply Average Filter
h = fspecial('average', [9 9]);
JF = imfilter(J, h);
figure, imshow(JF)
% Take the difference between the gray image and Average Filter
Z = imsubtract(JF, J);
figure, imshow(Z)
%% Threshold using the IsoData Method
level=isodata(Z) % this is our threshold level
%level = graythresh(Z)
%% Convert to Binary
BW = im2bw(Z, level - 0.008);

%% Remove small pixels (Increase the threshold to remove smaller vessels)
BW2 = bwareaopen(BW, 10000); % Increased from 800 to 1500 to remove tiny vessels

%% Overlay
BW2_cleaned = imcomplement(BW2_cleaned); % Complement the binary mask
out = imoverlay(B, BW2_cleaned, [0 0 0]); % Overlay on the original image
figure, imshow(out);










%% Load Ground Truth Image
groundTruth = imread("D:\Study\Matlab\Basics\sample\all Dataset\images\01_dr.tif");
groundTruth = imresize(groundTruth, [584, 565]); % Resize to match the segmentation output
groundTruthBW = im2bw(groundTruth, 0.5); % Convert to binary (assuming ground truth is grayscale)

%% Compare Segmentation with Ground Truth
segmentationResult = imcomplement(BW2); % BW2 is the segmentation output

% Calculate metrics
TP = sum((segmentationResult == 1) & (groundTruthBW == 1), 'all');
TN = sum((segmentationResult == 0) & (groundTruthBW == 0), 'all');
FP = sum((segmentationResult == 1) & (groundTruthBW == 0), 'all');
FN = sum((segmentationResult == 0) & (groundTruthBW == 1), 'all');

% Calculate accuracy
accuracy = (TP + TN) / (TP + TN + FP + FN);

%% Display Accuracy
disp(['Segmentation Accuracy: ', num2str(accuracy)]);
