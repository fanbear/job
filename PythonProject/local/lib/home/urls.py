# Импортируем паф
# Импортируем из views все данные

from django.urls import path
from .views import *


urlpatterns = [
	path('', template_page) # Call function home (Вызываем функцию шаблона страницы)
]