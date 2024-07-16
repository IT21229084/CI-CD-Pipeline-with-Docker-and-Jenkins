FROM node:latest

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

# Start the application by running the "npm start" command
CMD [ "npm", "start" ]  
