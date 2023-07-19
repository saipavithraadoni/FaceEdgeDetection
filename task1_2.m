function task1_2()
    im=imread(".\face.jpeg");
        
    %Adding Blue border on top and left edges
    im(1:60,:, 3) = 180; 
    im(:,10:30, 3) = 180; 
    
    %Adding initial A, S, P
    % Adding "A"
    for i = 10:50		
        im(i,100:102, 1) = 255;		
        im(10:12,100:130, 1) = 255;	
        im(i,128:130, 1) = 255;		
        im(30:32,100:130, 1) = 255;	
    end
    % Adding "S"
    for i = 50:80
        im(10:12,140:170, 1) = 255;	
        im(10:30,140:142, 1) = 255;
        im(30:32,140:170, 1) = 255;	
        im(30:50,168:170, 1) = 255;
        im(48:50,140:170, 1) = 255;	
    end
    % Adding "P"
    for i = 90:120
        im(10:50,178:180,1) = 255;
        im(10:12,180:210,1) = 255;	
        im(10:30,208:210,1) = 255;
        im(30:32,180:210,1) = 255;	
    end
    
    %Displaying Final Image
    figure, imshow(im),title('Inserting Initials on image'); 
end
