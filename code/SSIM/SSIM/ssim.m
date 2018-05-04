close all;
clear;clc;
ImagePath = 'C:\Users\asus\Desktop\NYU50GT\';
ResultPath = 'C:\Users\asus\Desktop\NYU50ResultDCP\';
ImageDir = dir(strcat(ImagePath,'*.bmp'));
ResultDir = dir(strcat(ResultPath,'*.bmp'));
LenDir = size(ImageDir,1);
for i = 1:LenDir
 img1=imread(strcat(ImagePath,ImageDir(i).name));         %reference image
 img2=imread(strcat(ResultPath,ResultDir(i).name));         %test image
 img1=rgb2gray(img1);
 img2=rgb2gray(img2);           %color image convert to gray  image
  K=[0.01 0.03];
  L=255;
  window=fspecial('gaussian', 11, 1.5);      
  [mssim,ssim_map] = ssim_index(img1, img2, K, window, L);
  g(i,:)=mssim;
  xlswrite('C:\Users\asus\Desktop\ssimresultDCP.xls',g,1);
end