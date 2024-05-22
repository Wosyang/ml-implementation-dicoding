# Use an official Node runtime as a parent image
FROM node:18-buster

# Set the working directory
WORKDIR /src

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install @hapi/hapi @tensorflow/tfjs-node@4.14.0 @google-cloud/firestore dotenv

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

ENV PORT 3000

COPY .env .
# Define the command to run the application
CMD [ "npm", "run", "start" ] 