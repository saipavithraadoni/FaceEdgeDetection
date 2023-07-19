function task1_1()
    % Reading the image from local storage and assigning it into a variable 
    face=imread(".\face.jpeg");
    
    % Displaying the image
    imshow(face),title('Original Image');
end