
clc;
close all;
clear all;
format short;

%%  reading image
[file,path]=uigetfile();
img_name=fullfile(path,file);
im_read=imread(img_name);
im_read=imresize(im_read,[400,600]);
subplot(221);
imshow(im_read);
title('original');

%% converting it into binary img

%im_bw=im2bw(im_bw1);
im_gray=rgb2gray(im_read);  % converting rgb imager into gray pixel value  0-255
thresh=graythresh(im_gray);   % 0-1
thresh1=graythresh(im_read);
if (thresh1<0.4)|(thresh1==thresh)
    im_bw1=imbinarize(im_gray,0.65);
else
   im_bw1=imbinarize(im_gray,thresh);
end
subplot(222);
imshow(im_bw1);
title('binary');

%% morphological operation and filtering

im=imfill(im_bw1,'holes'); % it removes black spot in a hole
m=strel('disk',5);
im1=imerode(im,m);
%im1=imerode(im,m);
im1=imdilate(im1,m);
i=medfilt2(im1);
i=medfilt2(i);
subplot(223);
imshow(i);
title('medifit');
% impixelinfo;

%% finding the region of intereste

bbx=regionprops(i,'BoundingBox','Area','Image');
area=0;
cor=0;
for i=1:length(bbx)
    if (bbx(i).Area>area)&(bbx(i).BoundingBox(3)<600)&(bbx(i).BoundingBox(4)<190)&(~(bbx(i).BoundingBox(1)<5))&(~(bbx(i).BoundingBox(2)<5))
        area=bbx(i).Area;
        cor=bbx(i).BoundingBox;
    end
end
 
%% croping the number plate region and resize it
if cor==0
    im_c1=im_bw1;
    [m,n]=size(im_c1);
else
im_c1=(imcrop(im_bw1,cor));
[m,n]=size(im_c1);
end

% im_c=medfilt2(im_c1);
if (m<120)&(n<250)
im_c1=(imresize(im_c1,[120,250]));

end
subplot(224);
imshow(im_c1);
figure;
imshowpair(~im_c1,im_c1,'montage');


im_c1=~im_c1;
[m,n]=size(im_c1);

%% extracting all charecter and matching it

bbx1=regionprops(im_c1,'BoundingBox','Area','Image');
count=numel(bbx1);
lttr=[];
for i=1:count
    if ((bbx1(i).BoundingBox(4)>(0.39*m)))&(bbx1(i).BoundingBox(3)<(0.2*n))&(bbx1(i).BoundingBox(3)>(0.035*n))&(bbx1(i).Area>((0.99*area)/100))
        crp=bbx1(i).BoundingBox;%0.45
        im_crt=imcrop(im_c1,crp);
        ltr=read_letter(bbx1(i).Image);
        lttr=[lttr ltr];
        figure;
        imshow(bbx1(i).Image);
        %imshow(im_crt);
        
        
    end
end
lttr;

%% storing the data in notepad

t = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss ');
fileid=fopen('car_number.txt','a');
fprintf(fileid,"\nimage name= %s   car number=%s  time=%s",file,lttr,t);
fclose('all');
% fprintf("\n");


