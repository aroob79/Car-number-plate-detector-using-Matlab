clc;
clear all;
close all;

%% reading img charecter

 Q=imread('charecter_picture\Q.bmp');
 W=imread('charecter_picture\W.bmp');
 E=imread('charecter_picture\E.bmp');
 R=imread('charecter_picture\R.bmp');
 T=imread('charecter_picture\T.bmp');
 Y=imread('charecter_picture\Y.bmp');
 U=imread('charecter_picture\U.bmp');
 I=imread('charecter_picture\I.bmp');
 O=imread('charecter_picture\O.bmp');
 P=imread('charecter_picture\P.bmp');
 A=imread('charecter_picture\A.bmp');
 S=imread('charecter_picture\S.bmp');
 D=imread('charecter_picture\D.bmp');
 F=imread('charecter_picture\F.bmp');
 G=imread('charecter_picture\G.bmp');
 H=imread('charecter_picture\H.bmp');
 J=imread('charecter_picture\J.bmp');
 K=imread('charecter_picture\K.bmp');
 L=imread('charecter_picture\L.bmp');
 Z=imread('charecter_picture\Z.bmp');
 X=imread('charecter_picture\X.bmp');
 C=imread('charecter_picture\C.bmp');
 V=imread('charecter_picture\V.bmp');
 B=imread('charecter_picture\B.bmp');
 N=imread('charecter_picture\N.bmp');
 M=imread('charecter_picture\M.bmp');
 one=imread('charecter_picture\1.bmp');
 two=imread('charecter_picture\2.bmp');
 three=imread('charecter_picture\3.bmp');
 four=imread('charecter_picture\4.bmp');
 five=imread('charecter_picture\5.bmp');
 six=imread('charecter_picture\6.bmp');
 seven=imread('charecter_picture\7.bmp');
 eight=imread('charecter_picture\8.bmp');
 nine=imread('charecter_picture\9.bmp');
 zero=imread('charecter_picture\0.bmp');
 
 %% read filled image
  
Afill=imread('charecter_picture/fillA.bmp');
Bfill=imread('charecter_picture/fillB.bmp');
Dfill=imread('charecter_picture/fillD.bmp');
Ofill=imread('charecter_picture/fillO.bmp');
Pfill=imread('charecter_picture/fillP.bmp');
Qfill=imread('charecter_picture/fillQ.bmp');
Rfill=imread('charecter_picture/fillR.bmp');
zerofill=imread('charecter_picture/fill0.bmp');
fourfill=imread('charecter_picture/fill4.bmp');
sixfill=imread('charecter_picture/fill6.bmp');
sixfill2=imread('charecter_picture/fill6_2.bmp');
eightfill=imread('charecter_picture/fill8.bmp');
ninefill=imread('charecter_picture/fill9.bmp');
ninefill2=imread('charecter_picture/fill9_2.bmp');

%% storing them in a array

letter=[A Afill B Bfill C D Dfill E F G H I J K L M N O Ofill P Pfill Q Qfill R Rfill S T U V W X Y Z];

number=[one two three four fourfill five six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill];

character=[letter number];

allcharecter=mat2cell(character,42,[ones(1,50)*24]);

save('template_for_matching','allcharecter');

 
 

