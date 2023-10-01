FROM python:3.9-slim as builder
WORKDIR /app

RUN mkdir templates static && \ 
    python -m venv venv

ENV PATH=/app/venv/bin/:$PATH
RUN pip install flask

COPY templates templates/
COPY static static/
COPY app.py ./


FROM gcr.io/distroless/python3
WORKDIR /app
COPY --from=builder /app ./


ENV PYTHONPATH=/app/venv/lib/python3.9/site-packages
ENV PATH=/app/venv/bin/:$PATH

EXPOSE 8000/TCP

CMD ["app.py"]
