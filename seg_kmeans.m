function seg_kmeans()
Irgb = imread('./face.jpeg');
I = rgb2hsv(Irgb);
% segment the image into k=2,3,5
figure(1),
subplot(3,4,1), imshow(I),title('original');

I = uint8(I);


[L,centers] = imsegkmeans(I,2);
B = labeloverlay(I,L);
subplot(3,4,2),imshow(B),title('k=2');

[L,centers] = imsegkmeans(I,3);
B = labeloverlay(I,L);
subplot(3,4,3),imshow(B),title('k=3');

[L,centers] = imsegkmeans(I,5);
B = labeloverlay(I,L);
subplot(3,4,4),imshow(B),title('k=5');

[L,centers] = imsegkmeans(I,6);
B = labeloverlay(I,L);
subplot(3,4,5),imshow(B),title('k=6');

[L,centers] = imsegkmeans(I,8);
B = labeloverlay(I,L);
subplot(3,4,6),imshow(B),title('k=8'); 

[L,centers] = imsegkmeans(I,9);
B = labeloverlay(I,L);
subplot(3,4,7),imshow(B),title('k=9');



figure (2),
L8 = (L==6); %best 6

% class 4 is for face
im4 = double(Irgb).* double(L8);
subplot (2,2,2), imshow (mat2gray (im4))
title('Class 4')
subplot (2,2,1), imshow (Irgb)
title('original')
eg = edge(rgb2gray (uint8 (im4)));

subplot (2,2,3), imshow(eg)
title("Edge")

%only Face
eg(210:end,:,:)=0;
eg = reshape(uint8([0 255 0]),[1,1,3]) .* uint8(eg)    
subplot (2,2,4), imshow(eg)
title("Edge")


