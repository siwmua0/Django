FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/siwmua0/Django.git

WORKDIR /home/Django/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py makemigrations

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn", "project.wsgi", "--bind", "0.0.0.0:8000"]


