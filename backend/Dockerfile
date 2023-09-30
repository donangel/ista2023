# Use the official Dart image as a parent image
FROM google/dart:latest

# Set the working directory in the container
WORKDIR /app

# Copy the local package files to the container's workspace
ADD pubspec.yaml /app/pubspec.yaml
RUN pub get --offline

ADD . /app
RUN pub get --offline

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
CMD ["dart", "bin/main.dart"]
