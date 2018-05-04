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

r1=img1(:,:,1);     %��ȡͼ���R����
g1=img1(:,:,2);     %��ȡͼ���g����
b1=img1(:,:,3);     %��ȡͼ���b����
r2=img2(:,:,1);     %��ȡͼ���R����
g2=img2(:,:,2);     %��ȡͼ���g����
b2=img2(:,:,3);     %��ȡͼ���b����

d1=sum(sum((r1-r2).^2))/(h*w);                        %R������MSE%psnr1=10*log10(255*255/d1);                       %R������PSNR
d2=sum(sum((g1-g2).^2))/(h*w);                        %G������MSE                    %R������PSNR
d3=sum(sum((b1-b2).^2))/(h*w);
psnr1=20*log10(255/sqrt(d1));   
psnr2=20*log10(255/sqrt(d2));%B������MSE
psnr3=20*log10(255/sqrt(d3));                       %R������PSNR
psnr=(psnr1+psnr2+psnr3)/3                        %psnrΪ��������psnr�ľ�ֵ
mse = (d1+d2+d3)/3
m(i,:)=mse;
p(i,:)=psnr;
xlswrite('C:\Users\asus\Desktop\mseresultDCP.xls',m,1);
xlswrite('C:\Users\asus\Desktop\psnrresultDCP.xls',p,1);
end