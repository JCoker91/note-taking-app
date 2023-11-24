# syntax=docker/dockerfile:1.4

# FROM python:3.8 AS Builder
# EXPOSE 8000
# WORKDIR /app 
# COPY requirements.txt /app
# RUN pip3 install -r requirements.txt --no-cache-dir
# COPY . /app 
# ENTRYPOINT ["./docker-entrypoint.sh"]

FROM python:3.8 AS Builder
# RUN addgroup app && adduser -S -G app app
# USER app
# set the working directory in the container
WORKDIR /App
# install dependencies
COPY requirements.txt /App
RUN pip3 install -r requirements.txt
# copy the content of the local src directory to the working directory
COPY . /App
# run server
ENTRYPOINT ["./docker-entrypoint.sh"]
# CMD ["python3", "manage.py", "runserver", "0:8000"]
EXPOSE 80