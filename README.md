# FaceEdgeDetection
-- Finding the Edges of a face

Over the years, the field of computer vision has undergone significant advancements, revolutionizing various industries and applications. One of the fundamental challenges in computer vision is facial segmentation and edge detection, which plays a crucial role in face recognition, augmented reality, emotion analysis, and others.

Traditional methods for facial segmentation and edge detection, such as Sobel, Roberts, and Canny, have long been the go-to techniques. While these methods have provided valuable insights in the past, they often suffer from limitations like Noisy outputs and difficulties in handling complex backgrounds.

To overcome these, researchers have explored various machine learning techniques. One such technique "The HSV (Hue, Saturation, Value)" is used in this example. It provides an alternative way of representing RGB (Red, Green, Blue). By thresholding the intensity values in each channel, it becomes possible to isolate the target(face) region effectively.

Current FACE EDGE DETECTION is done using MATLAB desktop version which can be downloaded from Download MATLAB, Simulink, Stateflow and Other MathWorks Products and online version (MATLAB (mathworks.com)) works equally fine.

Let's get started...

\**Part 1: Image Preprocessing and Annotation**
#### Here, we have uploaded an image having a face from Local And I have just Signed and add text over the image to prevent unauthorized use.


\**Part 2: Segmentation of the Face**
#### Our initial focus was on separating the face from the background of the image. Using substantial threshold values of RED, GREEN, and BLUE obtained using  "improfile," we devised a novel approach to identify the boundaries of the face. By carefully selecting these threshold values, we successfully separated the face from the background.


\**Part 3: Edge Detection Techniques**
#### Now, we explore several in-built edge detection techniques, such as Sobel, Canny, Log, Zero-cross, Prewitt, and Roberts and use the one that suits the image well. 


\**Part 4: Identifying the Best Approaches**

#### To determine the best approaches among the edge detection techniques, we employed a combination of HSV color space and SVM classification. Through thorough experimentation, we found that HSV combined with Sobel and Roberts delivered superior results. K-Means clustering with K=9 also showed promise. However, we acknowledged that these results were not perfect and further refinement was necessary for precise edge detection.

\**Part 5: Introducing a Revolutionary Fusion Algorithm**

#### Driven by the need for a more accurate edge detection technique, we decided to combine the strengths of HSV and SVM with the popular Canny edge detection method. The fusion of these three approaches resulted in groundbreaking improvements in face segmentation. Canny edge detection proved particularly effective in capturing fine facial features while maintaining the overall structural integrity of the face.

Note that these results may not be same for any image because, the threshold values of each image vary from each other.

This is not an in-depth explanation as this was an academic course work task
