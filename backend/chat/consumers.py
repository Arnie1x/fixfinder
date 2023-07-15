import datetime
import json
from channels.generic.websocket import AsyncWebsocketConsumer
from chat import models
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from asgiref.sync import sync_to_async
from channels.db import database_sync_to_async

# class ChatConsumer(AsyncWebsocketConsumer):
# 	async def connect(self):
# 		self.roomGroupName = self.scope["url_route"]["kwargs"].get('chat_name')
# 		await self.channel_layer.group_add(
# 			self.roomGroupName ,
# 			self.channel_name
# 		)
# 		await self.accept()
# 	async def disconnect(self , close_code):
# 		await self.channel_layer.group_discard(
# 			self.roomGroupName ,
# 			self.channel_layer
# 		)
# 	async def receive(self, text_data):
# 		text_data_json = json.loads(text_data)
# 		message = text_data_json["message"]
# 		author = text_data_json["author"]
# 		await self.channel_layer.group_send(
# 			self.roomGroupName,{
# 				"type" : "sendMessage" ,
# 				"message" : message ,
# 				"author" : author ,
# 			})
# 	async def sendMessage(self , event) :
# 		message = event["message"]
# 		author = event["author"]
# 		await self.send(text_data = json.dumps({"message":message ,"author":author}))
  

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.chat_name = self.scope["url_route"]["kwargs"]["chat_name"]
        self.pk = self.scope["url_route"]["kwargs"]["pk"]
        self.roomGroupName = "chat_%s" % self.chat_name
        await self.channel_layer.group_add(
            self.roomGroupName,
            self.channel_name
        )
        await self.accept()
    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.roomGroupName,
            self.channel_layer
        )
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json["message"]
        author = text_data_json["author"]
        technician = self.pk
        # user_1 = await getUserModel(author) # type: ignore
        user_1 = await getUserModel(author) # type: ignore
        user_2 = await getTechnicianUserModel(technician) # type: ignore
        chat = models.Chat(
            id = self.chat_name,
            user_1 = user_1,
            user_2 = user_2,
            created_at = datetime.datetime.now(),
            updated_at = datetime.datetime.now()
        )
        messageModel = models.Message(
            chat = chat,
            author = user_1,
            body = message,
            created_at = datetime.datetime.now(),
            updated_at = datetime.datetime.now()
        )
        await saveModels(chat, messageModel)
        await self.channel_layer.group_send(
            self.roomGroupName,{
                "type" : "sendMessage",
                "message" : message,
                "author" : author,
            }
        )
    async def sendMessage(self, event):
        message = event["message"]
        author = event["author"]
        await self.send(text_data = json.dumps({"message":message, "author":author}))
    
@sync_to_async
def getUserModel(id):
    user = User.objects.get(pk=id)
    return user

@sync_to_async
def getTechnicianUserModel(id):
    user = User.objects.get(technician__pk=id)
    return user

@sync_to_async
def saveModels(model1, model2):
    model1.save()
    model2.save()