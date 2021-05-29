from flask_restful import Resource, Api

api = Api()


class UserAll(Resource):
    def get(self):
        return "Users"


class User(Resource):
    def get(self, user_id):
        return {"User": user_id}


class TopicAll(Resource):
    def get(self):
        return "Topic"


class Topic(Resource):
    def get(self, topic_id):
        return {"Topic": topic_id}


api.add_resource(UserAll, "/api/user")
api.add_resource(User, "/api/user/<string:user_id>")
api.add_resource(TopicAll, "/api/topic")
api.add_resource(Topic, "/api/topic/<string:topic_id>")


def init_app(app):
    api.init_app(app)
