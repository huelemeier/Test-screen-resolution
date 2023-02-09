# Test screen resolution of your Psychtoolbox window 

The purpose of this script is to test the screen resolution and refresh rate of your Psychtoolbox window. When running experiments with externally connected screens, it can be useful to check the technical set-up. For instance, if you run create a world using OpenGL and you want to interact with the world by marking a spot using Psychtoolbox directly, you must make sure the aspect ratio of your OpenGL world (always 4:3 ratio) and your Psychtoolbox window harmonize. Sometimes, the pc detects the wrong aspect ratio of your externally connected screen.  

## Technical requirements and set-up
These scripts are optimized for MatLab 2021b with Psychtoolbox (http://psychtoolbox.org/download.html) with OpenGL add-ons. So what needs to be installed on you computer are Matlab and Psychtoolbox.

## Set-up
Download the file and add it to your Matlab folder. 

## Explanation of the scripts
- testresolution.m: this script measures the resolution, refresh rate and frames per second

## Run the script
Type into your command window 'testresolution' and press the enter buttom. Psychtoolbox automatically opens a window and runs the script in that window. You will see information about window's height, width, refresh rate, and frames per second. 

<img width="800" alt="window" src="https://user-images.githubusercontent.com/69513270/217747002-c3ba747a-4db7-4c0d-831f-38e290bc98b9.png">


By clicking either the left or the right buttom of your computer mouse, you terminate the script and the Psychotoolbox window closes. Matlab's command window will provide information whether you pressed the left or right buttom. The pressed buttom is coded by the number 1. 
![matlab](https://user-images.githubusercontent.com/69513270/217747070-d2d6e579-bcbb-4718-bfa2-5d6dcd3f2b30.png)


## Change the size of the on screen window
By the way, you can change the size of the window. Open the script of the function to change the window size. The following line opens an on screen window of full size:  
```matlab
[win, winRect] = PsychImaging('OpenWindow', screenid, 0, [], [], [], stereoMode, multiSample); 
```

If you want a smaller window just change the code like this. You can type in any resolution you want:
```matlab
[win, winRect] = PsychImaging('OpenWindow', screenid, 0, [0 0 800 600], [], [], stereoMode, multiSample); 
```
Either click on 'run' or type 'testresolution' into the command window.
