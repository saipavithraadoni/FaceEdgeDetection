function Final_hsv_svm()
    imRGB = imread("./face.jpeg");
    imRGB = imlocalbrighten(imRGB,0.12);
    imRGB = imresize(imRGB,0.25); % for fast processing. 
    imHSV = rgb2hsv(imRGB);

    [M, N, dim] = size(imRGB)

    % define thresholds that can be found using "improfile"
    hT = 0.45;
    sT = 0.9;
    vT = 0.1;
    Lface= imHSV(:,:,3) > hT & imHSV(:,:,1) <vT & imHSV(:,:,2) < sT;
    imFace(:,:,1) = imRGB(:,:,1).* uint8 (Lface);
    imFace(:,:,2) = imRGB(:,:,2).* uint8 (Lface);
    imFace(:,:,3) = imRGB(:,:,3).* uint8 (Lface);

    figure(1),
    subplot(2,4,1), imshow(imRGB), title('Original RGB');


    imFace = rgb2hsv(imFace);


    % Converting an image into a 2D table with each row has RGB values
    hs =[reshape(imFace(:,:,1),1,[]);
        reshape(imFace(:,:,2),1,[]);
        reshape(imFace(:,:,3),1,[]);];

    [dim,no]=size(hs)
    X = hs';
    X(1:10,:)

    Y = zeros(no,1);
    Y = (X(:,1)<0.07);

    svm = fitcsvm(X,Y); 		% SVM training
    cv = crossval(svm) 		% 10-fold cross-validation
    loss = kfoldLoss(cv) 		% 10-fold loss/accuracy
    
    [~, score] = kfoldPredict(cv); 	% Predict using the data not for training
    
    predX = (score(:,2)>0); 	% score=1 for GT and score=0 for bg
    predX = X .* predX;
    
    im_pred(:, :,1) = reshape(predX(:,1), M, N);
    im_pred(:, :,2) = reshape(predX(:,2), M, N);
    im_pred(:, :,3) = reshape(predX(:,3), M, N);
    im_pred_rgb=hsv2rgb(im_pred);
    subplot(2,4,2),imshow(mat2gray(im_pred_rgb)),title("HSV and SVM");


    %Display edges
    im_eg= rgb2gray (im_pred_rgb);

    %only face
    im_eg(1:23,:,:)=0;
    im_eg(54:end,:,:)=0;
    im_eg(50:54,52:end,:)=0;
    
    %Filter data only for face
    subplot(2,4,3),imshow(im_eg),title("Only Face");

    subplot (2,4,4), imshow (edge(im_eg, 'sobel')); title('Edge: Sobel');
    im22 = edge (im_eg, 'canny' );
    [row, col] = size(im22);
    im22 (end-20: end, :) = 0;
    subplot (2,4,5), imshow(edge(im_eg, 'zerocross')); title('Edge: zerocross');
    subplot (2,4,6), imshow (im22); title("Edge: Canny");
    subplot (2,4,7), imshow(edge(im_eg, 'roberts')); title("Edge: Roberts");
    subplot (2,4,8), imshow(edge(im_eg, 'log')); title('Edge: LOG');
    
    figure(2),
    i1 = edge(im_eg, 'canny') % logical matrix, where "true" indicates an edge.
    g = reshape(uint8([255 0 0]),[1,1,3]) .* uint8(i1)    
    imshow(g);title("Final Face Edges");

    figure(3),
    i2= bitand(edge(im_eg, 'canny'),edge(im_eg, 'sobel'))
    g = reshape(uint8([255 255 0]),[1,1,3]) .* uint8(i2)    
    imshow(g);title("Final Face Edges with eyes and Mouth");



end