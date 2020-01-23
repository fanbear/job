# Импортируем паф
# Импортируем из views все данные

from django.urls import path
from .views import *


urlpatterns = [
	path('', post_list) # Call function home (Вызываем функцию шаблона страницы)
]