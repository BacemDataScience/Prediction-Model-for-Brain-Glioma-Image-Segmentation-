function [ P, R, F ] = evaluation(Iseg ,Ians)
% Evaluation


Iseg = imread('111.png');
Ians = imread('result.png');

[~,~,c] = size(Iseg);
if c==3
    Iseg = rgb2gray(Iseg);
end
 
[~,~,c] = size(Ians);
if c==3
    Ians = rgb2gray(Ians);
end

a = max(max(Iseg));
b = max(max(Ians));
Iseg = uint8(Iseg/a);
Ians = uint8(Ians/b);
[m,n] = size(Iseg);
c11 = 0; c01 = 0; c10 = 0;
for i = 1:m
    for j = 1:n
        if  (Ians(i,j) == 1 && Iseg(i,j) == 1) 
            c11 = c11 + 1;
        end
        if  (Ians(i,j) == 0 && Iseg(i,j) == 1) 
            c01 = c01 + 1;
        end
         if  (Ians(i,j) == 1 && Iseg(i,j) == 0) 
            c10 = c10 + 1;
         end
    end
end

P = c11 / (c11+c10)
R = c11 / (c11+c01)
F = 2 * P * R / (P + R)

Ians = Ians*255;
Iseg = Iseg*255;
% IansS = zeros(m,n,3);
% IsegS = zeros(m,n,3);
% IansS(:,:,1) = Ians;
% IsegS(:,:,3) = Iseg;
% figure;imshow(uint8(IansS));
% hold on
% imshow(uint8(IsegS));
I = zeros(m,n,3);
I(:,:,1) = Ians;
I(:,:,3) = Iseg;
figure;
imshow(uint8(I));
title('Results: red (standard answer), blue (our results)');
        
end

