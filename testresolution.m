%% Purpose of this script
% this script writes down the current resolution on the screen and refresh rate. This script
% has, thus, only testing purposes.

function testresolution


%% general settings
% Clear the workspace and the screen
close all;
clearvars;
sca;

% Setup Psychtoolbox for OpenGL 3D rendering support and initialize the mogl OpenGL for Matlab wrapper:
InitializeMatlabOpenGL;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

Screen('Preference','Verbosity',1);


% Select the external screen if it is present, else revert to the native
screenid = max(Screen('Screens'));
stereoMode = 0;
multiSample = 0;

% Define black, white and grey
black = BlackIndex(screenid);
white = WhiteIndex(screenid);
grey = white / 2;

% Open an on screen window and color it black
[win, winRect] = PsychImaging('OpenWindow', screenid, 0, [], [], [], stereoMode, multiSample); %full screen. If you want to change the screen size of your window, just change the code. For instance: PsychImaging('OpenWindow', screenid, 0, [0 0 800 600], [], [], stereoMode, multiSample);
[win_xcenter, win_ycenter] = RectCenter(winRect);
xwidth=RectWidth(winRect);
yheight=RectHeight(winRect);

screen_height= 198; %24.07; %physical height of display in cm
screen_width= 248; %34.93; %physical width of display in cm
screen_distance=100;%30; %physical viewing distance in cm
screen_distance_in_pixels=xwidth/screen_width*screen_distance; %physical viewing distance in pixel


% Set the blend funciton for the screen
Screen('BlendFunction', win, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Get the size of the on screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', win);

% Get the centre coordinate of the window in pixels
[xCenter, yCenter] = RectCenter(winRect);

fps=Screen('FrameRate', win);   %use PTB framerate if its ok. otherwise....
if fps == 0
    flip_count = 0;                 %rough estimate of the frame rate per second
    timerID=tic;                    
    while (toc(timerID) < 1)        
        Screen('Flip',win);
        flip_count=flip_count+1;
    end
    frame_rate_estimate=flip_count;
    fps = frame_rate_estimate;
end


%% Draw text on the screen

buttons = 0;
[~, ~, buttons]=GetMouse(screenid);

numberxwidth = num2str(winRect(3));
numberyheight = num2str(winRect(4));

framespersecond = num2str(fps);

while ~buttons
    % Measure the vertical refresh rate of the monitor
    ifi = Screen('GetFlipInterval', win);
    refreshrate = num2str(ifi);

    line1 = 'current screen resolution';
    line2 = '\nwidth: ';
    line3 = '\nheight: ';
    line4 = '\nrefresh rate: ';
    line5 = '\nframes per second: ';
    line6 = '\n\nPress the left or right mouse buttom to close the window.';
    Screen('TextSize',win, 20);
    DrawFormattedText(win, [line1 line2 numberxwidth line3 numberyheight line4 refreshrate line5 framespersecond line6],win_xcenter-200,win_ycenter, white);
    Screen('DrawingFinished', win);
    Screen('Flip', win);
    [~, ~, buttons]=GetMouse(screenid);
end


if any(buttons)
     [~, ~, buttons]=GetMouse(screenid);
     responseleft = buttons(1);
     responseright = buttons(2);
end




%% Done.
% Clear the screen
sca;


return
