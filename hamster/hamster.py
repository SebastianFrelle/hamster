from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)


class TodoResource(Resource):
    def get(self):
        return f"Well, hello, there"

class Link(Resource):
    def get(self):
        pass

    def put(self):
        print(request.form)
        return {"data": "hej"}


api.add_resource(Link, '/link')
api.add_resource(TodoResource, '/todo')

if __name__ == '__main__':
    app.run(debug=True)
