from django.urls import path, include
from chat import views as chat_views
from django.contrib.auth.views import LoginView, LogoutView


urlpatterns = [
    path('chats/<str:chat>/messages/', chat_views.MessageList.as_view()),
    path('chats/<str:chat>/messages/<str:message>/', chat_views.MessageDetail.as_view()),
    
    path('chats/', chat_views.ChatList.as_view()),
    path('chats/find/<str:user_1>/<str:user_2>', chat_views.ChatDetailFromUser.as_view()),
    path('chats/<str:chat>/', chat_views.ChatDetail.as_view()),

	path("<str:chat_name>/", chat_views.chatPage, name="chat-page"),
	# # login-section
	# path("auth/login/", LoginView.as_view
	# 	(template_name="chat/LoginPage.html"), name="login-user"),
	# path("auth/logout/", LogoutView.as_view(), name="logout-user"),
]
