from django.urls import include, path
from . import views

urlpatterns = [
    path('users/', views.UserDetail.as_view()),

    path('technicians/', views.TechnicianList.as_view()),
    path('technicians/user/', views.get_object),
    path('technicians/<str:pk>/', views.TechnicianDetail.as_view()),
    # path('technicians/<str:pk>/user', views.get_from_user),
    path('technicians/<str:pk>/chat/', include('chat.urls')),
    
    path('orders/', views.OrderList.as_view()),
    path('orders/<str:user_1>/<str:user_2>', views.OrderListFromUser.as_view()),
    path('orders/<str:pk>/', views.OrderDetail.as_view()),
        
]
