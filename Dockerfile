# The base image
FROM ubuntu:latest

# Install python and pip
RUN apt-get update -y && apt-get install -y python python-pip

# Copy files required for the app to run
ADD . /home/ubuntu/ca-project

# Install Python modules needed by the Python app
RUN pip install --no-cache-dir -r /home/ubuntu/ca-project/requirements.txt

# Declare the port number the container should expose
EXPOSE 6000

# Run the application
CMD ["python", "/home/ubuntu/ca-project/run.py"]

