
function jpeg_encoder

clear all
clc
%%%%%%%%%% read image %%%%%%%%%%%%%%%
I = double(imread('lena512color.tiff'));
[Y,Cb,Cr] = ColorReductin_function(I,'4:1:1');


Q = [16    11    10    16    24    40    51    61;
    12    12    14    19    26    58    60    55;
    14    13    16    24    40    57    69    56;
    14    17    22    29    51    87    80    62;
    18    22    37    56    68   109   103    77;
    24    35    55    64    81   104   113    92;
    49    64    78    87   103   121   120   101;
    72    92    95    98   112   100   103    99];
%%%%%%%%%%%%%%%%comprress Y %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y_star= zeros(size(Y));
for i = 1:8:size(Y,1)
    for j = 1:8:size(Y,2)
        
        
        
        %%%%%%%%%%%%%%% Divide into 8 by 8 blocks %%%%%%%%%%%%%%%%
        Block = Y(i:i+7,j:j+7) -128        
        
        %%%%%%%%%%%%%%%%%% DCT  %%%%%%%%%%%%%%%%%
        block_DCT = dct2(Block)
        
        %%%%%%%%Qunatiziations%%%%%%%%%%%%%%%%%%%
        block_DCT_q = round(block_DCT./Q)
        
        
        %%%%%%%inverse Qunatiziations%%%%%%%%%%%%%%%%%%%
        block_DCT_star = round(block_DCT_q.*Q)
        
        %%%%%%%%%%%%inverse DCT%%%%%%%%%%%%%
        block_star= idct2(block_DCT_star);
      
        
        
        %%%%%%%%%%%%%%%%%place recovered blok to the image%%%%%%%%%%%%%%%
        Y_star(i:i+7,j:j+7) = round(block_star) +128;
        
        
        %keyboard
    end
end


imshow(uint8(Y_star))
figure,imshow(uint8(Y))
keyboard