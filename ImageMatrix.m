%% Pixel Region analyzer for matlab
% Git: DaveCalaway - V0.1
% The script analyze the central part of picture, and fills the x-by-3 matrix
% with RBG colors. Does not matter if the pic is BW.
clc
clear all
close all
image_name = '420nm.jpeg';
tic
pos=1;
%% Show image and read the dimension
himage = imshow(image_name);
image = imread(image_name);
info=imfinfo(image_name);

%% Divide the image in X part
Width=round(info.Width/7);
Height=round(info.Height/7);

%Preallocate Memory matrix
rgbColor=zeros(Width*Height, 3);

%new windows called figure
for x=(Width*3):(Width*4)
    for y=(Height*3):(Height*4)
        rgbColor(pos,:) = impixel(image, x, y);
        pos=pos+1;
    end
end
%Find the mean value of each column.
RGB = mean(rgbColor);
disp('Done!')
toc
