FROM python:3.9
WORKDIR /var/www
COPY . /var/www
RUN pip install -r requirements.txt
EXPOSE 80
CMD ["python", "app.py"]