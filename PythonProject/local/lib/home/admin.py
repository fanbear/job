from django.contrib import admin
from .models import *


# Register your models here.

# Админ панель главной страницы Описание head
class MetaTagAdmin(admin.ModelAdmin): 

	list_display = ["title", "description"]
	class Meta:
		model = MetaTag
		verbose_name = 'Мета теги'
		verbose_name_plural = 'Мета теги'

admin.site.register(MetaTag, MetaTagAdmin)
#-------------------------------------------------------------------



# Админ панель главной страницы Меню
class menuAdmin(admin.ModelAdmin): 

	list_display = ["name", "url"]
	class Meta:
		model = Menu

admin.site.register(Menu, menuAdmin)
#-------------------------------------------------------------------------



# Админ панель главной страницы телефон
class phoneAdmin(admin.ModelAdmin): 
	
	list_display = ["number", "tag"]
	class Meta:
		model = Phone

admin.site.register(Phone, phoneAdmin)
#-------------------------------------------------------------------------


# Админ панель главной страницы первый блок
class BlockOneAdmin(admin.ModelAdmin):

	list_display = ["title", "desc"]
	class Meta:
		model = BlockOne

admin.site.register(BlockOne, BlockOneAdmin)
#---------------------------------------------------------------------------------



# Админ панель главной страницы описание второго блока
class WorkBlockAdmin(admin.ModelAdmin):

	list_display = ['title', 'desc_top', 'desc_bottom']
	class Meta:
			model = WorkBlock
admin.site.register(WorkBlock, WorkBlockAdmin)

class WorkListAdmin(admin.ModelAdmin):

	list_display = ['strong', 'lists']
	class Meta:
			model = WorkList
admin.site.register(WorkList, WorkListAdmin)

class WorkImgAdmin(admin.ModelAdmin):

	list_display = ['image']
	class Meta:
			model = WorkImg
admin.site.register(WorkImg, WorkImgAdmin)
#--------------------------------------------------------------------



#Админ панель третего блока (Услуги)
class ServicesBlockAdmin(admin.ModelAdmin):

	list_display = ['common_title','s_one_title', 's_two_title', 's_three_title', 's_four_title', 's_five_title']
	class Meta:
		model = ServicesBlock
admin.site.register(ServicesBlock, ServicesBlockAdmin)
#---------------------------------------------------------------------


#Админ панель четвертого блока (Портфолио)
class PortfolioBlockAdmin(admin.ModelAdmin):

	list_display = ['title', 'desc']
	class Meta:
		model = PortfolioBlock
admin.site.register(PortfolioBlock, PortfolioBlockAdmin)

class PortfolioImgAdmin(admin.ModelAdmin):
	list_display = ['item_title', 'item_desc', 'button_url', 'item_color']
	class Meta:
		model = PortfolioImg
admin.site.register(PortfolioImg, PortfolioImgAdmin)
#------------------------------------------------------------------


#Админ панель пятого блока (Отзывы)
class ReviewsBlockAdmin (admin.ModelAdmin):

	list_display = ['title','desc']

	class Meta:
		model = ReviewsBlock
admin.site.register(ReviewsBlock, ReviewsBlockAdmin)

class ReviewsItemAdmin (admin.ModelAdmin):

	list_display = ['fln', 'position', 'review']

	class Meta:
		model = ReviewsItem
admin.site.register (ReviewsItem, ReviewsItemAdmin)
#------------------------------------------------------------------

#Админ панель шестого блока (Преимуществ)
class advanBlockAdmin (admin.ModelAdmin):

	list_display = ['title', 'desc']

	class Meta:
		model = advanBlock
admin.site.register(advanBlock, advanBlockAdmin)

class advanItemAdmin (admin.ModelAdmin):

	list_display = ['name', 'title', 'desc']

	class Meta:
		model = advanItem
admin.site.register(advanItem, advanItemAdmin)
#------------------------------------------------------------------

#Админ панель седьмого блока (Наша команда)
class TeamBlockAdmin(admin.ModelAdmin):

	list_display = ['title', 'desc']

	class Meta:
		model = TeamBlock
admin.site.register(TeamBlock, TeamBlockAdmin)

class TeamItemAdmin (admin.ModelAdmin):

	list_display = ['name', 'position', 'social_inst', 'social_face']

	class Meta:
		model = TeamItem
admin.site.register(TeamItem, TeamItemAdmin)

#------------------------------------------------------------------


# Админ панель главной страницы описание футера и сслыка на соц сети.
class footer_descAdmin(admin.ModelAdmin):

	list_display = ['description', 'facebook_url', 'instagram_url', 'youtube_url']
	class Meta:
			model = footer_desc
admin.site.register(footer_desc, footer_descAdmin)
#--------------------------------------------------------------------


