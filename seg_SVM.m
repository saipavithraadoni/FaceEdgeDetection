function seg_SVM()
    im0 = imread('./face.jpeg');
    im0 = imresize(im0,0.25); % for fast processing. 
    [M, N, dim] = size(im0)
    im = rgb2hsv(im0); 
    figure(1),
    subplot(2,3,1), imshow(im0), title('RGB');
    subplot(2,3,2), imshow(im), title('HSV');
    % Converting an image into a 2D table with each row has RGB values
    hs =[reshape(im(:,:,1),1,[]);
        reshape(im(:,:,2),1,[]);
        reshape(im(:,:,3),1,[]);];

    [dim,no]=size(hs)
    X = hs';
    X(1:10,:)

    Y = zeros(no,1);
    Y = (X(:,1)<0.066);

    svm = fitcsvm(X,Y); 		% SVM training
    cv = crossval(svm) 		% 10-fold cross-validation
    loss = kfoldLoss(cv) 		% 10-fold loss/accuracy
    
    [~, score] = kfoldPredict(cv); 	% Predict using the data not for training
    
    predX = (score(:,2)>0); 	% score=1 for GT and score=0 for bg
    predX = X .* predX;
    
    im_pred(:, :,1) = reshape(predX(:,1), M, N);
    im_pred(:, :,2) = reshape(predX(:,2), M, N);
    im_pred(:, :,3) = reshape(predX(:,3), M, N);
    %crop only face
    im_pred(55:end,:,:)=0;

    im_pred_rgb=hsv2rgb(im_pred);    
    subplot(2,3,3),imshow(mat2gray(im_pred)),title("Predicted HSV (Face)");
    subplot(2,3,4),imshow(mat2gray(im_pred_rgb)),title("Predicted RGB");


    %Display edges
    %im eg - rgb2gray (im pred_rgb); 
    im_eg= rgb2gray (im_pred);

    subplot (2,3,5), imshow (edge(im_eg, 'sobel')); title('Edge: Sobel');
    subplot (2,3,6), imshow(edge(im_eg, 'roberts')); title("Edge: Roberts");
end