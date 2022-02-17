## OpenRA Resource Center Development Environment

# Requirements:

You will need both docker and docker-compose installed for this to work. It also assumes that you have added your user to the docker group so that docker commands can be run without root privilages. If no, you may need to use sudo for the docker commands.

# Initial Setup:

1. Clone using the following command:

git clone https://github.com/dsimmons87/OpenRA-Resources-Dev.git openra_resources --recurse-submodules

2. Create a folder called "engines" and put any openra versions you'll be using in there. This can be left until later, but you wont be able to upload any maps until this is done - for help with this see Engines further down.

3. If you are using any engines that use "mono" (pre 2021), uncomment the relevant lines from the Dockerfile to install mono on the python docker image.

4. Copy settings.py.example from the root folder into the src/openra directory and update src/requirements.txt so that psycopg2 is set to version 2.8.

5. Open a terminal and run the following command from the root of the project directory to bring up the docker containers:

docker-compose up

6. In another terminal determine the container_id of the "django" docker container:

docker container ls

7. Load an interactive bash shell on the django container (replace <container_id> with the first few characters of the container_id from step 4):

docker container exec -i -t <container_id> bash

8. You are now in an interactive bash shell within the docker container running django.

9. Migrate the database to create any tables required:

python manage.py migrate

10. If all has gone well, you should now be able to see a local version of the resource center on http://localhost:8000;

11. Create a superuser:

python manage.py createsuperuser

12. You should now be able to log in on your local resource center using the username and password you set here.

# Usage

To close down all containers, just press ctrl+c on the main terminal that you ran docker-compose up in.

To start the containers again, run "docker-compose up" from the root directory of the project.

If you need to run any django or python commands, access the python container by following steps 4 to 6 from the initial setup.

If you are working on the resource center, you will likely need to change the "remote" of src to point to your fork of the project.

# Engines

## Current Versions

For current versions of openra:

Download the AppImage files from https://github.com/OpenRA/OpenRA/releases

Create a directory within engines for the release, for example release-20210321.

Copy the AppImage files into the new folder.

Extract the AppImage contents, and rename the squashfs-root folder to the mod name that was just extracted (ra, td or d2k)

In linux the process would look like this:

cd ~/wherever/engines

mv ~/Downloads/OpenRA-Red-Alert-x86_64.AppImage ra.AppImage

chmod +x ra.AppImage

./ra.AppImage --appimage-extract

mv squashfs-root ra

rm ra.AppImage

Then repeat this process for td and d2k

## Legacy Versions

For versions listed as legacy in the settings.py:

First you will need to make sure you have mono installed on the python image. To do this, make sure you uncomment the relevant lines from the Dockerfile, then rebuild the image with the following command:

docker-compose build

If you get an error, you may need to give your user ownership of the data directory recursively (replace youruser with your user):

chmod youruser:youruser data -R

Clone a shallow copy of the version you need:

git clone https://github.com/OpenRA/OpenRA.git --depth 1 -b release-20171014 release-20171014

Follow the INSTALL.md file for that version of OpenRA to build it correctly. For example:

https://github.com/OpenRA/OpenRA/blob/release-20171014/INSTALL.md

Once built, you should then be able to upload maps for that version inside your local copy of the resource center.

# Other Notes