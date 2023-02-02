FROM python:3.10-slim

RUN mkdir /app
WORKDIR /app

RUN mkdir templates static

COPY templates templates/
COPY static static/
COPY app.py ./

RUN pip install flask 

EXPOSE 8000/TCP

CMD ["/usr/local/bin/python3","app.py"]
