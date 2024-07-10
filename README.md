In this work, I have performed car number plate detection using MATLAB. The task is accomplished using only image processing techniques. If the image contains a car picture with a visible number plate, the program will first detect and extract the region of the number plate. After that, using image processing techniques, it will crop the region of every character of the plate. Finally, it will match those characters with the template characters (in the character picture folder) and find the similarity. Based on the maximum similarity, it will determine which character it is.

Input picture containing car:
![image](https://github.com/aroob79/Car-number-plate-detector-using-Matlab/assets/107660687/666e3712-102c-46fe-bcc4-0b02941683a6) 

Template character picture:
![image](https://github.com/aroob79/Car-number-plate-detector-using-Matlab/assets/107660687/6af95d03-6761-4795-b683-65a246ebac57)

In the folder (character_picture), it contains all capital letters of the English alphabet and numbers from 0 to 9.

The overall task can be summarized as follows:
First, read the image and convert it into a binary image based on a threshold value.
Perform some morphological transformations like filling, eroding, dilating, and filtering using a median filter.
Find the region of interest using the regionprops function and some threshold values.
Finally, find the characters by matching them with the template characters.
