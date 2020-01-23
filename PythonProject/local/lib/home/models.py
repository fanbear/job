from django.db import models
from colorful.fields import RGBColorField

# Create your models here.


# Metatag Home page
class MetaTag (models.Model):

	title 			= models.CharField( max_length = 80, db_index=True, verbose_name="Тайт для главной страницы")

	description 	= models.TextField(blank=True, db_index=True, verbose_name="Описание для главной страницы")

	def __str__(self):
		return "%s %s" % (self.title, self.description)

	class Meta:
		verbose_name='Мета-теги главной (Title and desc)'
		verbose_name_plural ='Мета-теги главной'
#--------------------------------

#Menu from all site
class Menu (models.Model):

	name = models.CharField (max_length = 150, verbose_name="Заголовок меню")
	url = models.CharField (max_length = 800, verbose_name="URL адресс (http://simple.com/...")

	def __str__(self):
		return "%s %s" % (self.name, self.url)

	class Meta:
		verbose_name='Меню сайта'
		verbose_name_plural ='Меню сайта'
#---------------------------

#Phone from all site
class Phone (models.Model):

	number = models.CharField(max_length= 250, verbose_name="Номер телефона для главной")
	tag = models.CharField(max_length= 250, verbose_name="Тег телефона для ссылки (0930000000)")

	def __str__ (self):
		return "%s %s" % (self.number, self.tag)

	class Meta:
		verbose_name='Телефон - Меню (Телефон в меню)'
		verbose_name_plural ='Телефон - Меню (Телефон в меню)'
#-------------------------------

# First block in home page
class BlockOne (models.Model):

	title = models.CharField( max_length = 1000, db_index=True, verbose_name="H1 для первого блока")

	desc = models.TextField( blank=True, db_index=True, verbose_name="Описание для первого блока")

	img = models.ImageField(upload_to='images/home/blockOne/%Y', verbose_name='Задний фон блока')

	button_one_desc = models.CharField( max_length = 1000, db_index=True, verbose_name="Описания для первой кнопки")

	button_one_url	= models.CharField( max_length = 1000, verbose_name="URL для первой кнопки")

	button_two_desc	= models.CharField( max_length = 1000, db_index=True, verbose_name="Описание для второй кнопки")

	button_two_url	= models.CharField( max_length = 1000, verbose_name="URL для второй кнопки")

	def __str__(self):
		return "%s %s" % (self.title, self.desc)

	class Meta:
		verbose_name='Первый блок - Офер (H1, описание, кнопки)'
		verbose_name_plural ='Первый блок - Офер (H1, описание, кнопки)'
#------------------------------

# Two block in home page
class WorkBlock (models.Model):

	title = models.CharField (max_length= 400, verbose_name="H2 для второго блока")
	desc_top = models.TextField (blank=True, verbose_name="Описание вверху второго блока")
	desc_bottom = models.TextField(blank=True, verbose_name="Описание внизу второго блока")

	class Meta:
		verbose_name='Второй блок - Наши клиенты (Заголовко, описание)'
		verbose_name_plural ='Второй блок - Наши клиенты (Заголовко, описание)'

class WorkList (models.Model):

	strong = models.CharField(max_length=80, verbose_name="Элемент списка выделеный жирным (7 лет)")
	lists = models.CharField(max_length=200, verbose_name="Элемент списка выделеный не жырным (текс)")

	class Meta:
		verbose_name='Второй блок - Наши клиенты (Список достижений)'
		verbose_name_plural ='Второй блок - Наши клиенты (Список достижений)'

class WorkImg (models.Model):

	image = models.ImageField(upload_to="images/home/workBlock/%Y", verbose_name="Картинка второго блока")

	class Meta:
		verbose_name='Второй блок - Наши клиенты (Логотипы клиентов)'
		verbose_name_plural ='Второй блок - Наши клиенты (Логотипы клиентов)'
#-------------------------------

#Three block in home page
class ServicesBlock (models.Model):

	common_title = models.CharField(max_length=800, verbose_name="Заголовок услуг")
	common_desc = models.TextField(blank=True, verbose_name="Описание услуг")

	s_one_title = models.CharField(max_length=800, verbose_name="Заголовок первой услуги")
	s_one_desc = models.TextField(blank=True, verbose_name="Описание первой услуг")
	s_one_url = models.CharField(max_length=1000, verbose_name="Ссылка первой услуги")

	s_two_title = models.CharField(max_length=800, verbose_name="Заголовок второй услуги")
	s_two_desc = models.TextField(blank=True, verbose_name="Описание второй услуг")
	s_two_url = models.CharField(max_length=1000, verbose_name="Ссылка второй услуги")

	s_three_title = models.CharField(max_length=800, verbose_name="Заголовок третей услуги")
	s_three_desc = models.TextField(blank=True, verbose_name="Описание третей услуг")
	s_three_url = models.CharField(max_length=1000, verbose_name="Ссылка третей услуги")

	s_four_title = models.CharField(max_length=800, verbose_name="Заголовок четвертой услуги")
	s_four_desc = models.TextField(blank=True, verbose_name="Описание четвертой услуг")
	s_four_url = models.CharField(max_length=1000, verbose_name="Ссылка четвертой услуги")

	s_five_title = models.CharField(max_length=800, verbose_name="Заголовок пятой услуги")
	s_five_desc = models.TextField(blank=True, verbose_name="Описание пятой услуг")
	s_five_url = models.CharField(max_length=1000, verbose_name="Ссылка пятой услуги")

	bg_image = models.ImageField(upload_to="images/home/ServicesBlock/%Y", verbose_name="Задний фон блока услуг", blank=True)

	class Meta:
		verbose_name='Третий блок - Услуги (Описание сайта, описание услуг)'
		verbose_name_plural ='Третий блок - Услуги (Описание сайта, описание услуг)'
#-------------------------------

#Four block in home page
class PortfolioBlock (models.Model):

	title = models.CharField(max_length=800, verbose_name="Заголовок блока")
	desc = models.TextField(blank=True, verbose_name='Описание блока')
	desc_width = models.IntegerField(default=100, verbose_name="Размер описания в %")
	button_url = models.CharField(max_length=800, verbose_name="Все проекты url")

	class Meta:
		verbose_name='Четвертый блок - Портфолио (Заголово, описание)'
		verbose_name_plural ='Четвертый блок - Портфолио (Заголово, описание)'

class PortfolioImg (models.Model):

	item_title =  models.CharField(max_length=800, verbose_name="Заголовок элемента")
	item_desc = models.TextField(blank=True, verbose_name='Описание элемента')
	button_url =  models.CharField(max_length=800, verbose_name="Ссылка кнопки", blank=True)
	item_color = RGBColorField(default='#fff', verbose_name='Цвет подложки')
	img = models.ImageField(upload_to="images/home/portfolioBlock/%Y", verbose_name="Картинка элемента")

	class Meta:
		verbose_name='Четвертый блок - Портфолио (Элементы, изображения)'
		verbose_name_plural ='Четвертый блок - Портфолио (Элементы, изображения)'
#-----------------------------


#Five block in home page 
class ReviewsBlock (models.Model):

	title = models.CharField(max_length=800, verbose_name='Заголовок блока')
	desc = models.TextField(blank=True, verbose_name='Описание блока')
	desc_width = models.IntegerField(default=100, verbose_name='Размер описания в %')
	img_bg = models.ImageField(upload_to="images/home/ReviewsBlock/%Y", verbose_name='Задний фон блока')
	btn_url = models.CharField(max_length=2000, verbose_name='Ссылка на все отзывы')

	class Meta:
		verbose_name='Пятый блок - Отзывы (Заголовок, описание, задний фон)'
		verbose_name_plural ='Пятый блок - Отзывы (Заголовок, описание, задний фон)'

class ReviewsItem (models.Model):

	img = models.ImageField(upload_to="images/home/ReviewsBlock/%Y", verbose_name='Фото клиента')
	fln = models.CharField(max_length=800, verbose_name='ФИО клиента')
	position = models.CharField(max_length=2000, verbose_name='Должность клиента')
	review = models.TextField(blank=True, verbose_name='Отзыв клиента')
	awesome = models.CharField(max_length=200, verbose_name='Иконка fa-facebook-f')
	awesome_url = models.CharField(max_length=2000, verbose_name='Сылка соц. сети')
	button_name = models.CharField(max_length=800, verbose_name='Название кнопки')
	button_url = models.CharField(max_length=2000, verbose_name='Ссылка кнопки')

	class Meta:
		verbose_name ='Пятый блок - Отзывы (Отзыв клиента)'
		verbose_name_plural = 'Пятый блок - Отзывы (Отзыв клиента)'
#-------------------------------

#Sixs block in home page
class advanBlock (models.Model):

	title = models.CharField(max_length=800, verbose_name='Заголовок блока')
	desc = models.TextField(blank=True, verbose_name='Описание блока')

	class Meta:
		verbose_name ='Шестой блок - Преимущества (Заголовок, Описание)'
		verbose_name_plural ='Шестой блок - Преимущества (Заголовок, Описание)'

class advanItem (models.Model):

	name = models.CharField(max_length=300, verbose_name='Название элемента')
	img = models.ImageField(upload_to="images/home/advanBlock/%Y", verbose_name='Картинка элемента')
	title = models.CharField(max_length=800, verbose_name='Заголовок элемента')
	desc = models.TextField(blank=True, verbose_name='Описание элемента')
	int_circl = models.IntegerField(default=100, verbose_name='Число круга')
	name_circl = models.CharField(max_length=800, verbose_name='Название круга')
	bar = models.IntegerField(default=0, verbose_name='Прогрессбар')

	class Meta:
		verbose_name ='Шестой блок - Элементы блока)'
		verbose_name_plural ='Шестой блок - Элементы блока'
#-------------------------------


#Seven block in home page
class TeamBlock (models.Model):

	title = models.CharField(max_length=800, verbose_name='Заголовок блока')
	desc = models.TextField(blank=True, verbose_name='Описание блока')
	desc_width = models.IntegerField(default=100, verbose_name='Описание блока - размер')
	img = models.ImageField(upload_to="images/home/TeamBlock/%Y", verbose_name='Задний фон блока')
	button_url = models.CharField(max_length=5000, verbose_name='Ссылка кнопки')

	class Meta:
		verbose_name = "Наша команда"
		verbose_name_plural = "Седьмой блок - Наша команда"

class TeamItem (models.Model):

	img = models.ImageField(upload_to="image/home/TeamBlock/%Y/people")
	name = models.CharField( max_length=800, verbose_name='Имя')
	position = models.CharField(max_length=2000, verbose_name='Должность')
	social_inst = models.CharField(max_length=500, verbose_name='Ссылка instagram')
	social_face = models.CharField(max_length=2000, verbose_name='Ссылка на facebook')

	class Meta:
		verbose_name = "Наша команда - элементы"
		verbose_name_plural = "Седьмой блок - Элементы команды"

#---------------------------------


#Footer left block info
class footer_desc (models.Model):

	description = models.TextField( blank=True )
	facebook_url = models.CharField( max_length=10000)
	instagram_url = models.CharField( max_length=10000)
	youtube_url = models.CharField( max_length=10000)

	class Meta:
		verbose_name='Футер сайта (Лого, описание, соц. сети)'
		verbose_name_plural ='Футер сайта (Лого, описание, соц. сети)'
		
#---------------------------------