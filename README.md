## Procedure to get a column of depth values in real time from minecraft on Ubuntu 16.04

1. Download Minecraft through the (Minecraft launcher)[https://launcher.mojang.com/download/Minecraft.deb] (create a free account, this should be enough for our use)

2. Launch minecraft and create a new user profile with version 1.13.2

3. Download (Optifine.jar 1.13.2)[https://optifine.net/downloads] and launch it with `java -jar optifine.jar` command (this should install optifine in your minecraft folder /home/user/.minecraft)

4. Download the Depth map shader (here)[http://www.mediafire.com/file/5tan9hrgjhr3vu4/CPDepthMap.zip] (no need to unzip it)

5. Launch Minecraft and select the optifine profile that has been automatically created

6. Go to options -> video settings -> shaders and select the depth map shader

7. Launch a game, it should be in black and white

8. Download and install grabc (from source, not from the official repo). To do so, you need first some dependencies that you can install with `sudo apt-get -y install libx11-dev`. after that open a shell and type `git clone https://github.com/muquit/grabc.git`, then `cd grabc` then `make` and finally `sudo make install` (you'll need git, if you do not have it already install with `sudo apt-get install git`)

9. In a shell execute `grabc -W` and then click on your minecraft tab, it should give you the id of the window in hexadecimal.

8. In the script pixels.sh, replace the window id in the 10th line by the one you found in step 9.

9. Make sure that the script is executable (right-click->permissions-> check "autoriser l'execution du fichier comme un programme")

10. Launch the script by typing `./script.sh` in a shell, it should now write all the values wanted in the console and in the txt file (if you did not disable this feature)

11. You might want to change some parameters, as the pixels position depend on the screen resolution

## Script parameters description

my screen resolution is 1366*768  
I consider the width to be 1300 because of the right dock of Linux (approx 66 pixels) so the width is from 66 to 1366  
the middle is then at (66+1366)/2 = 716 pixels from the left of the screen  

we should then take all the point with coordinates going from (716,0) to (716,768) to have the middle column  
in order to reduce the execution time i take only 1 out of 12 pixels, and only on 2/3rd of the screen (that way i avoid getting false values due to the item bar color in the game)  

768/6=128, so we pick points between 128 and 768-128 = 640 as y coordinate  
that represents 512 points, divided by 12 because of what i previously said which lets us with only 42 points  
to sum up, the point will have the coordinates  
x=716  
y from 128 to 640 by steps of 12  
