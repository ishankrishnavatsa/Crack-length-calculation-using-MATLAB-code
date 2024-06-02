clc
clear all
raw_image=imread('calibration.jpg');
resized_image=imresize(raw_image,[72 128]);
imshow(resized_image)
matrix_all = im2double(resized_image);
matrix_blue=matrix_all(:,:,3);
matrix_blue(matrix_blue>0)=1;
first = find(matrix_blue,1,'first');
last = find(matrix_blue,1,'last');

j=1;
for i=ceil(first/72):ceil(last/72)
  
    shuru(j)=find(matrix_blue(:,i),1,"first");
    khatm(j)=find(matrix_blue(:,i),1,"last");

    length(j)=khatm(j)-shuru(j)+1;

    j=j+1;
end

disp("The Crack length is: "+mean(length,"all"));

