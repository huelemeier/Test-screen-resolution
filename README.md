# Test screen resolution of your screen window // Matlab and Psychtoolbox

The purpose of this script is to test the screen resolution and refresh rate. When running experiments with externally connected screens, it can be useful to check the technical set-up.

## Technical requirements and set-up
These scripts are optimized for MatLab 2021b with Psychtoolbox (http://psychtoolbox.org/download.html) with OpenGL add-ons. So what needs to be installed on you computer are Matlab and Psychtoolbox.

## Set-up
Download the file and add it to your Matlab folder. 

## Explanation of the scripts
- testresolution.m: this script measures the resolution, refresh rate and frames per second

## Run the script
Open the script in Matlab and click on 'run'. Psychtoolbox automatically opens a window and runs the script in that window. You will see information about window's height, width, refresh rate, and frames per second. 
<img width="800" alt="Bildschirmfoto 2022-08-02 um 14 43 55" src="https://user-images.githubusercontent.com/69513270/182377612-d9735692-082f-49a6-ae4d-d8099a2383d0.png">



By clicking either the left or the right buttom of your computer mouse, you terminate the script and the Psychotoolbox window closes. Matlab's command window will provide information whether you pressed the left or right buttom. The pressed buttom is coded by the number 1. 

![Bildschirmfoto 2022-08-02 um 13 50 11](https://user-images.githubusercontent.com/69513270/182368116-3d380e82-5be3-437b-9a1b-ab338b29e7c0.png)

## Change the size of the on screen window
By the way, you can change the size of the window. The following line opens an on screen window of full size:  
```matlab
[win, winRect] = PsychImaging('OpenWindow', screenid, 0, [], [], [], stereoMode, multiSample); 
```

If you want a smaller window just change the code like this. You can type in any resolution you want:
```matlab
[win, winRect] = PsychImaging('OpenWindow', screenid, 0, [0 0 800 600], [], [], stereoMode, multiSample); 
```
