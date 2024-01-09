#Stage1
#Set parent image 
FROM ubuntu:22.04 as build 

#Set working directory in the container 
WORKDIR /app

#Copy the local scripts and file to the container 
COPY lyrics.sh .
COPY all_I_want_for_christmas_is_you.txt ./lyrics/

# Install any needed packages
RUN apt-get update && apt-get install -y \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*  
#Make scripts executable and execute to generate html file
RUN chmod +x lyrics.sh && ./lyrics.sh

#Stage2
FROM nginx

#Set working directory in the container
WORKDIR /app

# Copy app from stage 1
COPY --from=build /app .
#The COPY command copies our custom index.html page into the Nginx image
COPY --from=build /app/lyrics.html /usr/share/nginx/html/index.html
# Expose the port
EXPOSE 80
#Run nginx 
#CMD ["nginx", "-g", "daemon off;"]
