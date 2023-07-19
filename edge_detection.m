function edge_detection()
    im = imread('./face.jpeg');
    [row, col, dim] = size(im);    
    for i = 1:row
        for j = 1:col
            if ((im(i, j, 1) < 155 & im(i, j, 2) < 105 & im(i, j, 3) < 85) & (abs(im(i, j, 1) - im(2, 3, 2))>0))
                im_edge (i,j,:) = im(i, j,:);
            end
        end
    end
    im_sobel = edge(im_edge (:,:, 2)) ;
    im_zerocross = edge(im_edge(:, :, 2), 'zerocross');
    im_log = edge(im_edge(:, :, 2), 'log');
    im_canny = edge(im_edge (:,:, 2),'canny');
    im_roberts = edge(im_edge(:, :, 2), 'roberts');
    im_Prewitt = edge(im_edge (:,:, 2),'prewitt');

    figure(10),
    subplot(2, 4, 1), imshow(uint8(im)), title('Original');
    subplot(2, 4, 2), imshow(uint8(im_edge)), title('Threshold');
    subplot(2, 4, 3), imshow(im_zerocross), title('Zerocross');
    subplot (2, 4, 4), imshow (im_sobel), title ('Sobel')
    subplot(2, 4, 5), imshow(im_log), title('Log');
    subplot (2, 4, 6), imshow (im_canny), title ('Canny');
    subplot(2, 4, 7), imshow(im_roberts), title('Roberts');
    subplot (2, 4, 8), imshow (im_Prewitt), title ('Prewitt');
end
