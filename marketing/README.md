python3 -m venv .venv
source .venv/bin/activate
pip install fastapi uvicorn

pip freeze > requirements.txt

pip install -r requirements.txt