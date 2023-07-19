function edges()
    xg = imread(".\face.jpeg");
        
    [row ,col,dim]= size(xg) 
    if dim >1
        xg0 =rgb2gray(xg);
    else
        xg0 =xg;
    end
    xg1 = edge(xg0,'sobel');
    xg2 = edge(xg0,'canny');
    xg3 = edge(xg0,'roberts');
    xg4 = edge(xg0,'log');
    xg5 = edge(xg0,'zerocross');
    xg6 = edge(xg0,'Prewitt');
    
    figure(1),
    subplot(2,4,1),imshow(xg) , title('original')
    subplot(2,4,3),imshow(xg1),title('sobel')
    subplot(2,4,4),imshow(xg2),title('canny')
    subplot(2,4,8),imshow(xg3),title('roberts ')
    subplot(2,4,5),imshow(xg4),title('log')
    subplot(2,4,6),imshow(xg5),title('zerocross')
    subplot(2,4,7),imshow(xg6),title('Prewitt ')
    subplot(2,4,2),imshow(xg0),title('Gray ')
    
end