from flask_restful import Api

from webapp.ext.api.views import ApiThing, ApiThingId, ApiUser, ApiUserId

api = Api()


api.add_resource(ApiUser, "/api/user")
api.add_resource(ApiUserId, "/api/user/<string:user_id>")
api.add_resource(ApiThing, "/api/thing")
api.add_resource(ApiThingId, "/api/thing/<string:thing_id>")


def init_app(app):
    api.init_app(app)
