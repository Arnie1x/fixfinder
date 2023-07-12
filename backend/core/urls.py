from django.urls import include, path
from . import views

urlpatterns = [
    path('technicians/', views.TechnicianList.as_view()),
    path('technicians/<str:pk>/', views.TechnicianDetail.as_view()),
    path('technicians/<str:pk>/chat/', include('chat.urls')),
    
    path('orders/', views.OrderList.as_view()),
    path('orders/<str:pk>/', views.OrderDetail.as_view()),
        
]
