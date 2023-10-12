# Fire Detection


- test folder - contains images on which inference is going to be performed
- my_model folder - contains our saved model
- output folder - it is empty and is created to store output images
Steps for docker containerization:

First start the docker application
Use the Dockerfile from here

Setup this Dockerfile in the working folder which also contains the model folder.
Run the command after navigating to the working folder to create a docker image which copies all the contents from demo (inference.py, label_map.pbtxt, test, my_model,output(empty)) to image.


`docker build -t fire_detection .`


After creating the 'fire_detection' we start a docker container using the following command (takes some time for installations)


`docker run -ti fire_detection /bin/bash`


Navigate to the model directory and execute the inference.py using


`python3 inference.py`


After running the inference.py output images are generated and they are stored in the output folder that is been copied from host and was empty at begining.
The output images should be copied to the host from the container, open a new terminal and use the below command with paths file paths accordingly,


`docker cp {container_id}:{path_in_container} {path_in_host}`


Example: docker cp c78563b67gj8:output my_files/


The images can be seen in output folder in the {myfiles} directory in the host machine.


OR

You can just download the image by using command : 

`docker pull niketan1604/fire_detection_2022:model`

then you will have create container using : 

`docker run -ti fire_detection /bin/bash`

and then just run the command : `python3 inference.py` ,which will execute the inference file and output will be saved to output folder

Output images can be copied from container to host using :

`docker cp {container_id}:{path_in_container} {path_in_host}`


You can also clone the model using github link - `git clone https://github.com/Niketan1604/Fire-Detection.git`
and then install tensorflow and then run the inference file
