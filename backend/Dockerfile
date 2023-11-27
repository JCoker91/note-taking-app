FROM python:3.8 AS Builder
WORKDIR /App
# install dependencies
COPY requirements.txt /App
RUN pip3 install -r requirements.txt
# copy the content of the local src directory to the working directory
COPY . /App
RUN chmod +x docker-entrypoint.sh
RUN python3 manage.py migrate
CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]
EXPOSE 80