
clear all
clc

%%%% read image %%%%

I = double(imread('lena512color.tiff'));

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

%%%% convert to Y Cb Cr %%%%%

Y = floor(0.299*R + 0.587*G +0.114*B);
Cb = floor(128 - 0.168736*R - 0.331264*G +0.5*B);
Cr = floor(128 +0.5*R -0.418688*G - 0.081312*B);

% subplot(1,3,1);imshow(uint8(Y));title('Y');
% subplot(1,3,2);imshow(uint8(G));title('Cb');
% subplot(1,3,3);imshow(uint8(B));title('Cr');


%%%%%%  Color reduction scheme (4:1:1)
Y_m = Y;
Cb_m = Cb(1:4:end,1:4:end);
Cr_m = Cr(1:4:end,1:4:end);

% imshow(uint8(Y_m));title('Ym');
% figure,imshow(uint8(Cb_m));title('Cbm');
% figure,imshow(uint8(Cr_m));title('Crm');

%%%% Convert back to the 4;4;4

Cb_star=zeros(512,512);
Cr_star=zeros(512,512);

Cb_star(1:4:end,1:4:end)=Cb_m;  %%%%%
Cb_star(1:4:end,2:4:end)=Cb_m;
Cb_star(1:4:end,3:4:end)=Cb_m;
Cb_star(1:4:end,4:4:end)=Cb_m;

Cb_star(2:4:end,1:4:end)=Cb_m;  %%%%%
Cb_star(2:4:end,2:4:end)=Cb_m;
Cb_star(2:4:end,3:4:end)=Cb_m;
Cb_star(2:4:end,4:4:end)=Cb_m;

Cb_star(3:4:end,1:4:end)=Cb_m;  %%%%%
Cb_star(3:4:end,2:4:end)=Cb_m;
Cb_star(3:4:end,3:4:end)=Cb_m;
Cb_star(3:4:end,4:4:end)=Cb_m;

Cb_star(4:4:end,1:4:end)=Cb_m;  %%%%%
Cb_star(4:4:end,2:4:end)=Cb_m;
Cb_star(4:4:end,3:4:end)=Cb_m;
Cb_star(4:4:end,4:4:end)=Cb_m;

Cr_star=zeros(512,512);

Cr_star(1:4:end,1:4:end)=Cr_m;  %%%%%
Cr_star(1:4:end,2:4:end)=Cr_m;
Cr_star(1:4:end,3:4:end)=Cr_m;
Cr_star(1:4:end,4:4:end)=Cr_m;

Cr_star(2:4:end,1:4:end)=Cr_m;  %%%%%
Cr_star(2:4:end,2:4:end)=Cr_m;
Cr_star(2:4:end,3:4:end)=Cr_m;
Cr_star(2:4:end,4:4:end)=Cr_m;

Cr_star(3:4:end,1:4:end)=Cr_m;  %%%%%
Cr_star(3:4:end,2:4:end)=Cr_m;
Cr_star(3:4:end,3:4:end)=Cr_m;
Cr_star(3:4:end,4:4:end)=Cr_m;

Cr_star(4:4:end,1:4:end)=Cr_m;  %%%%%
Cr_star(4:4:end,2:4:end)=Cr_m;
Cr_star(4:4:end,3:4:end)=Cr_m;
Cr_star(4:4:end,4:4:end)=Cr_m;

%%%% Get the color RGB image
R_m= Y+1.402*(Cr_star-128);
G_m= Y-0.344136*(Cb_star-128)-0.714136*(Cr_star-128);
B_m= Y+1.772*(Cb_star-128);

I_m(:,:,1)=floor(R_m);
I_m(:,:,2)=floor(G_m);
I_m(:,:,3)=floor(B_m);



imshow(uint8(I));title('original');
figure,imshow(uint8(I_m));title('RGB reduced colors');





keyboard