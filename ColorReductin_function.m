

function [Y,Cb_m,Cr_m] = ColorReductin_function(I,reduction_scheme)

%%%% read image %%%%


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

if strcmpi(reduction_scheme,'4:1:1')
    Y_m = Y;
    Cb_m = Cb(1:2:end,1:2:end);
    Cr_m = Cr(1:2:end,1:2:end);

    % imshow(uint8(Y_m));title('Ym');
    % figure,imshow(uint8(Cb_m));title('Cbm');
    % figure,imshow(uint8(Cr_m));title('Crm');

    %%%% Convert back to the 4;4;4

   
end
end
