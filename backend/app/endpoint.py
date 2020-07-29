from flask_restful import Resource

class External(Resource):
    def get(self):
        return {'status': 200, "message": "External"}



class Internal(Resource):
    def get(self):
        return {'status': 200, "message": "Internal"}


class Cached(Resource):
    def get(self):
        return {'status': 200, "message": "Cached"}
