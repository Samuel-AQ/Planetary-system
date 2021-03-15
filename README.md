# Planetary system using Processing
## Description
This is an applicaton that emulates an imaginary planetary system using 3D shapes provided by Processing.
## How it works
In order to use the application you just have to run the main file. It will show you the system I coded and the visualization controls you can use, which are:
* Mouse wheel to adjust the zoom
* Press 'L' to show or hide the legend
* Press 'C' to activate or deactivate the camera mode
* Press 'I' to open the help

When the camera mode is enabled you can control the spacecraft using this keys: 
* Press 'w' to move forward
* Press 'd' to move to the right
* Press 's' to move backwards
* Press 'a' to move to the left
* Press 'c' to exit camera mode
* Press the arrow keys to rotate the camera

## Implementation decisions
This application has been developed according to the principles of Jakob Nielsen. It's easy to use, makes the user feels the control at every moment and uses a minimalist and simple design. It is not possible for the user to generate any programming error so it hasn't been necessary to control the user's movements. The controls are at hand at every moment so it's not possible for the user to get lost using the application.
A camera mode has been added in order to allow the user to navigate through the system freely. This camera is seeing by the user as a little spacecraft if they see it from the normal view mode.
## Application demonstration
![Example](https://github.com/Samuel-AQ/Planetary-system/blob/master/data/Demonstration/example.gif?raw=true)
## References
[Processing documentation](https://processing.org/reference/)
## Other info
* Author: Samuel Arrocha Quevedo
* Version: 15/03/2021