pip freeze > src/requirements.txt

pip install -r src/requirements.txt

docker compose up --build


python3 -m venv .venv; source .venv/bin/activate

uvicorn app.main:app --reload

