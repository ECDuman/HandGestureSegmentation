clear;
clc;

%Getting a RGB image.
D1 = 'D:\hand_data\data1\'; %Data hand klasörünün yolunu yazman gerekiyor.
D2 = 'D:\hand_data\data2\'; %Data hand klasörünün yolunu yazman gerekiyor.
D3 = 'D:\hand_data\data3\'; %Data hand klasörünün yolunu yazman gerekiyor.
pngFiles1 = dir(fullfile(D1,'*.png')); % pattern to match filenames.
pngFiles2 = dir(fullfile(D2,'*.png')); % pattern to match filenames.
pngFiles3 = dir(fullfile(D3,'*.png')); % pattern to match filenames.
numFiles1 = length(pngFiles1);
numFiles2 = length(pngFiles2);
numFiles3 = length(pngFiles3);


for k = 1:numel(pngFiles1)  %dataset1 
      F = fullfile(D1,pngFiles1(k).name);
      img = imread(F);
    
      HSV = rgb2hsv(img);
      figure; imshow(HSV);
      title('HSV');

      folder = 'D:\Outputs';    %Output dosyasýnýn yolu. Kendi bilgisayarýnda klasörü oluþturduðun yerin yolunu yazacaksýn.
      fullFileName = fullfile(folder, sprintf('Dataset1 HSV %d.png',k));    %foldera hangi isimle kaydettiði
      imwrite(HSV, fullFileName);
        
end
for k = 1:numel(pngFiles2)  %dataset2
      F = fullfile(D2,pngFiles2(k).name);
      img = imread(F);
    
      HSV = rgb2hsv(img);
      figure; imshow(HSV);
      title('HSV');

      folder = 'D:\Outputs';    %Output dosyasýnýn yolu. Kendi bilgisayarýnda klasörü oluþturduðun yerin yolunu yazacaksýn.
      fullFileName = fullfile(folder, sprintf('Dataset2 HSV %d.png',k));    %foldera hangi isimle kaydettiði
      imwrite(HSV, fullFileName);
        
end
for k = 1:numel(pngFiles3)      %dataset3
      F = fullfile(D3,pngFiles3(k).name);
      img = imread(F);
    
      HSV = rgb2hsv(img);
      figure; imshow(HSV);
      title('HSV');

      folder = 'D:\Outputs';    %Output dosyasýnýn yolu. Kendi bilgisayarýnda klasörü oluþturduðun yerin yolunu yazacaksýn.
      fullFileName = fullfile(folder, sprintf('Dataset3 HSV %d.png',k));    %foldera hangi isimle kaydettiði
      imwrite(HSV, fullFileName);
        
end



%----------------------------------------------------------------

%Illumination / Skin Detection

%R = img(:,:,1);
%G = img(:,:,2);
%B = img(:,:,3);

%Ravg = (sum(sum(R))) ./ ((size(R,1)) .* (size(R,2))); %mean(mean(R))
%Gavg = (sum(sum(G))) ./ ((size(G,1)) .* (size(G,2)));
%Bavg = (sum(sum(B))) ./ ((size(B,1)) .* (size(B,2)));

%if(Ravg == Gavg && Ravg == Bavg && Gavg == Bavg)
%        fprintf(stream,formatSpec, 'SAME');
%else 
%    Ir = (Gavg/Ravg) .* R;
%    Ib = (Gavg/Bavg) .* B;
%end

%I = cat(3,Ir,G,Ib);
%figure; imshow(I);

%----------------------------------------------------------------

% %Converting RGB to HSV.
% HSV = rgb2hsv(img);
% figure; imshow(HSV);
% title('HSV');
% 
% %Getting R, G, and B values from the HSV.
% H = HSV(:,:,1);
% S = HSV(:,:,2);
% V = HSV(:,:,3);
% 
% kernel = zeros(201,201);
% kernel(H>0.01 & H<0.1 & S>0.24 & S<0.42 & V>0.2 & V<0.5) = 1;
% figure; imshow(kernel);
% title('Thresholding Applied');
% 
% %Trying to fill the noises.
% fill = imfill(kernel, 'holes');
% figure; imshow(fill);
% title('Removed Noise');
% 
% se = strel('line',11,90);
% filled_again = imdilate(fill,se);
% figure; imshow(filled_again);
% title('Removed Noise');

%----------------------------------------------------------------

% Converting RGB to YCbCr using matlab function 'rgb2ycbcr'.
% YCbCr = rgb2ycbcr(img);
% figure; imshow(YCbCr);
% title('YCbCr');
% 
% Getting Y, Cb, and Cr values from the YCbCr.
% Y = YCbCr(:,:,1);
% Cb = YCbCr(:,:,2);
% Cr = YCbCr(:,:,3);
% 
% kernel = zeros(201,201);
% kernel(Y>50 & Y<100 & Cb>100 & Cb<130 & Cr<150) = 1;
% kernel(Cb>77 & Cb<127 & Cr>133 & Cr<173) = 1;
% figure; imshow(kernel);
% title('Thresholding Applied');
% 
% fill = imfill(kernel, 'holes');
% figure; imshow(fill);
% title('imfill()');
% 
% se = strel('line',11,90);
% filled_again = imdilate(fill,se);
% figure; imshow(filled_again);
% title('imdilate()');

%----------------------------------------------------------------

% %Converting RGB to YCbCr according to article we found.
% R = img(:,:,1);
% G = img(:,:,2);
% B = img(:,:,3);
% 
% Y = 0.299*R + 0.587*G + 0.114*B;
% Cb = -0.169*R - 0.322*G + 0.500*B;
% Cr = 0.500*R - 0.419*G - 0.081*B;
% 
% kernel = zeros(201,201);
% kernel(Y>50 & Y<100 & Cb>100 & Cb<130 & Cr<150) = 1;
% figure; imshow(kernel);
% title('Thresholding Applied');

%----------------------------------------------------------------

%Checking histogram of image.

%kernel(Y>30 & Y<180 & Cb>60 & Cb<120 & Cr>80 & Cr<155) = 1;


