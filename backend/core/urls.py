from django.urls import path
from . import views

urlpatterns = [
    path('technicians/', views.TechnicianList.as_view()),
    path('technicians/<str:pk>/', views.TechnicianDetail.as_view()),
    
    path('orders/', views.OrderList.as_view()),
    path('orders/<str:pk>/', views.OrderDetail.as_view()),

    path('messages/', views.MessageList.as_view()),
    path('messages/<str:pk>/', views.MessageDetail.as_view()),
    
]
