from flask import Flask, request
from flask_restful import Resource, Api
import config
from endpoint import External, Internal, Cached

app = Flask(__name__)
api = Api(app)

app_config = config.read_config()

api.add_resource(External, '/external')
api.add_resource(Internal, '/internal')
api.add_resource(Cached, '/cached')

app.run(port=app_config['application_port'], host='0.0.0.0',debug=True)
