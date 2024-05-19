from flask import Flask, request
import requests
import json

app = Flask(__name__)

@app.route('/data', methods=['GET'])
def getData():
    data = { "titulo": "python ha mandado esto a ruby", "notificaciones": 
        ["python ha definido estos datos","NodeJS ha definido la vista","ruby lo ha ensamblado todo"] }
    return data

if __name__ == "__main__":
    app.run(port=5000)