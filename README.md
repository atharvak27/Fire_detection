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



