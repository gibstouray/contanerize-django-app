FROM python:3.12-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN apt-get update

RUN apt-get install -y curl


# copy project files

COPY . .

EXPOSE 8084

CMD ["python" , "manage.py", "runserver", "0.0.0.0:8084"]
