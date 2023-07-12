# from channels.auth import AuthMiddlewareStack
# from channels.routing import ProtocolTypeRouter, URLRouter
# from django.urls import re_path
# from chat import consumers

# # URLs that handle the WebSocket connection are placed here.
# websocket_urlpatterns=[
#         re_path(
#             r"ws/api/technicians/<str:pk>/chat/(?P<chat_name>\w+)/$", consumers.ChatConsumer.as_asgi(),
#         ),
#         re_path(
#             r"ws/chat/(?P<chat_name>\w+)/$", consumers.ChatConsumer.as_asgi(),
#         )
#     ]

from django.urls import path , include, re_path
from chat.consumers import ChatConsumer

# Here, "" is routing to the URL ChatConsumer which
# will handle the chat functionality.
websocket_urlpatterns = [
 re_path(
            r"ws/chat/(?P<chat_name>\w+)/$", ChatConsumer.as_asgi(),
        ),
]
