# Use the official Dart image as a parent image
FROM dart:stable

# Set the working directory in the container
WORKDIR /app

# Install SQLite3
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev

# Copy the local package files to the container's workspace
ADD pubspec.yaml /app/pubspec.yaml
RUN dart pub get

ADD . /app
RUN dart pub get

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
CMD ["dart", "bin/main.dart"]
