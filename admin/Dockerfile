FROM python:3.12

WORKDIR /code

COPY ./src/requirements.txt /code/requirements.txt

#RUN python3 -m venv .venv
#RUN source .venv/bin/activate
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./src/app /code/app

CMD ["fastapi", "run", "app/main.py", "--port", "80"]