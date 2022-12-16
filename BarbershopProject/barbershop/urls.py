from django.urls import path

from barbershop.views import index, add_service, delete_service, info

urlpatterns = [
    path('', index, name='home'),
    path('add_service/', add_service, name='add_service'),
    path('delete_service/', delete_service, name='delete_service'),
    path('info/', info, name='info')

]
