clear;close all; clc;
addpath(genpath('.'));

% This MatConvNet is compiled under Win7, you can also compile MatConvNet
% under Linux, Mac, and Windows, then run our "demo_MSCNNdehazing.m".

run(fullfile(fileparts(mfilename('fullpath')), './matlab/vl_setupnn.m')) ;

% if the input is very hazy, use large gamma to amend T. (0.8-1.5)

ImagePath = './testimgs/';
ResultPath = './results/';
ImageDir = dir(strcat(ImagePath,'*.bmp'));
%ResultDir = dir(strcat(ResultPath,'*.bmp'));
LenDir = size(ImageDir,1);
for i = 1:LenDir
    Image_name = ImageDir(i).name;
    img=imread(strcat(ImagePath,Image_name))
    gamma = 1.0;
% img = 'newyork.png'; gamma = 1.0;
% img = 'IMG_0752.png'; gamma = 1.3;
% img = 'canyon.png'; gamma = 1.3;
%imagename = [strcat(ImagePath,Image_name)];
dehazedImageRGB = mscnndehazing(Image_name, gamma);
imshow(dehazedImageRGB);
imwrite(dehazedImageRGB,strcat(ResultPath,ImageDir(i).name));
end