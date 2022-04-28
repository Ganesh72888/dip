function [code,compression]=huffman(p)
%HUFFMAN
%HUFFMAN CODER FOR V5
% Format [CODE,COMPRESSION]=HUFFMAN(P)
%
% P is the probability (or number of occurences) of each alphabet symbol
% CODE gives the huffman code in a string format of ones and zeros
% COMPRESSION gives the compression rate
%
p=p(:)/sum(p);    %normalises probabilities
c=huff5(p);       
code=char(getcodes(c,length(p)));
compression=ceil(log(length(p))/log(2))/ (sum(code' ~= ' ')*p);
%---------------------------------------------------------------
function c=huff5(p);
% HUFF5 Creates Huffman Tree
% Simulates a tree structure using a nested cell structure 
% P is a vector with the probability (number of occurences)
%   of each alphabet symbol
% C is the Huffman tree.
c=cell(length(p),1);			% Generate cell structure 
for i=1:length(p)				% fill cell structure with 1,2,3...n 
   c{i}=i;						%	(n=number of symbols in alphabet)
end
while size(c)-2					% Repeat till only two branches
	[p,i]=sort(p);					% Sort to ascending probabilities
	c=c(i);							% Reorder tree.
	c{2}={c{1},c{2}};c(1)=[];	% join branch 1 to 2 and prune 1
	p(2)=p(1)+p(2);p(1)=[];		% Merge Probabilities
end
%---------------------------------------------------------------
function y= getcodes(a,n)
% Y=GETCODES(A,N)
% Pulls out Huffman Codes for V5
% a is the nested cell structure created by huffcode5
% n is the number of symbols
global y
y=cell(n,1);
getcodes2(a,[])
%----------------------------------------------------------------
function getcodes2(a,dum)
% GETCODES(A,DUM) 
%getcodes2
% called by getcodes
% uses Recursion to pull out codes
global y
if isa(a,'cell')
         getcodes2(a{1},[dum 0]);
         getcodes2(a{2},[dum 1]);
else   
   y{a}=setstr(48+dum);   
end