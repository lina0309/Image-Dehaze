close all;
clear;
clc;
ImagePath = 'C:\Users\asus\Desktop\NYU50GT\';
ResultPath = 'C:\Users\asus\Desktop\NYU50ResultDCP\';
ImageDir = dir(strcat(ImagePath,'*.bmp'));
ResultDir = dir(strcat(ResultPath,'*.bmp'));
LenDir = size(ImageDir,1);
for i = 1:LenDir   
img1=imread(strcat(ImagePath,ImageDir(i).name));
img2=imread(strcat(ResultPath,ResultDir(i).name));
[h w ~]=size(img1);
img1=im2double(img1);
img2=im2double(img2);

r1=img1(:,:,1);     %提取图像的R分量
g1=img1(:,:,2);     %提取图像的g分量
b1=img1(:,:,3);     %提取图像的b分量
r2=img2(:,:,1);     %提取图像的R分量
g2=img2(:,:,2);     %提取图像的g分量
b2=img2(:,:,3);     %提取图像的b分量

d1=sum(sum((r1-r2).^2))/(h*w);                        %R分量的MSE%psnr1=10*log10(255*255/d1);                       %R分量的PSNR
d2=sum(sum((g1-g2).^2))/(h*w);                        %G分量的MSE                    %R分量的PSNR
d3=sum(sum((b1-b2).^2))/(h*w);
psnr1=20*log10(255/sqrt(d1));   
psnr2=20*log10(255/sqrt(d2));%B分量的MSE
psnr3=20*log10(255/sqrt(d3));                       %R分量的PSNR
psnr=(psnr1+psnr2+psnr3)/3                        %psnr为三个分量psnr的均值
mse = (d1+d2+d3)/3
m(i,:)=mse;
p(i,:)=psnr;
xlswrite('C:\Users\asus\Desktop\mseresultDCP.xls',m,1);
xlswrite('C:\Users\asus\Desktop\psnrresultDCP.xls',p,1);
end