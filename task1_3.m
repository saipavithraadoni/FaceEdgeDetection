function task1_3()
    im=imread('./face.jpeg');
    sig = imresize(imread('sign.png'), 0.25);
    [r, c, d] = size(im);
    [sig_r, sig_c, dim] = size(sig);

     im(:,:,2)=10;


    r1 = round((r - sig_r) / 2);
    c1 = round((c - sig_c) / 2);
    r2 = r1 + sig_r - 1;
    c2 = c1 + sig_c - 1;

    im(r1:r2, c1:c2, 1) = im(r1:r2, c1:c2, 1) + sig(:, :, 1);
    im(r1:r2, c1:c2, 2) = im(r1:r2, c1:c2, 2) + sig(:, :, 2);
    im(r1:r2, c1:c2, 3) = im(r1:r2, c1:c2, 3) + sig(:, :, 3);

    % Adding Text
    text_str = "( Pavithra )";
    position = [r1+50 c2-40];
    im = insertText(im,position,text_str,FontSize=20,BoxOpacity=0,TextColor="white");

    % Drawing Rectangle
    rect_start = [c1, r1];
    rect_end = [c2-20, r2-150];
    im = insertShape(im, 'Rectangle', [rect_start, rect_end], 'LineWidth', 1, 'Color', 'white');
    
    % DIsplay image
    figure, imshow(im), title('Signature on image');
end
