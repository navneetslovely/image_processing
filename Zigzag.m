 
%% Test elements #1
Q1 = [1 2 3;
     4 5 6;
     7 8 9];
%% Test elements #2
Q = [01 02 06 07;
     03 05 08 13;
     04 09 12 14;
     10 11 15 16];
  
%% Init
tmp = reshape(1:numel(Q), size(Q));
 
%% Flip left/right -> Diagonal matrix -> Flip left/right again
afterFliplr1 = fliplr( tmp );
afterSpdiags = spdiags( afterFliplr1 );
afterFliplr2 = fliplr( afterSpdiags );
 
%% Flip up/down(odd columns)
afterFlipudOdd = afterFliplr2;
afterFlipudOdd(:,1:2:end) = flipud( afterFliplr2(:,1:2:end) );
 
%% Remove zero
orderNonZero = afterFlipudOdd;
orderNonZero( orderNonZero==0 ) = [];
 
%% Get elements (by zigzag-order)
ZigZag = Q(orderNonZero)
 
%keyboard