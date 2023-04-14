FROM python:3.6-alpine

RUN pip install flask

COPY /app /opt/

EXPOSE 8080

RUN adduser -D worker

WORKDIR /opt

USER worker

ENTRYPOINT ["python", "app.py"]