from django.shortcuts import render
from .models import *


def template_page(request):

	# Модель title и desc для главной страницы
	tag = MetaTag.objects.all() 
	#---------------------------------------

	# Модель данных для меню главной страницы
	menu = Menu.objects.all() 
	#----------------------------------------

	# Модель данных для телефона главной страницы
	phone = Phone.objects.all()
	#--------------------------------------------

	# Модель данных для первого блока главной страницы
	blockOne = BlockOne.objects.all() 
	#-----------------------------------------------
	
	# Модель данных описания для второго блока
	workblock = WorkBlock.objects.all() 
	#-----------------------------------------

	#Модель данных для второго блока (Cписок)
	worklist = WorkList.objects.all()
	#---------------------------------------

	#Модель данных для второго блока (масив изображений)
	workimg = WorkImg.objects.all()
	#--------------------------------------------------

	#Модель данных для третего блока (УСЛУГИ)
	servis = ServicesBlock.objects.all()
	#--------------------------------------------------

	#Модель данных для четвертого блока (Наши портфолио)
	pr = PortfolioBlock.objects.all()
	pr_img = PortfolioImg.objects.all()
	#---------------------------------------------------

	#Модель данных для пятого блока (Отзывы)
	review = ReviewsBlock.objects.all()
	rev_item = ReviewsItem.objects.all()
	#---------------------------------------------------


	#Модель данных для шестого блока (Преимущества)
	advan = advanBlock.objects.all()
	advan_item = advanItem.objects.all()
	#--------------------------------------------------


	#Модель данных для шестого блока (Преимущества)
	team = TeamBlock.objects.all()
	team_item = TeamItem.objects.all()
	#--------------------------------------------------


	# Модель данных описания для футера
	fdesc = footer_desc.objects.all()
	#------------------------------------

	return render(request, 'home/index.html', context={
												'tags' : tag,
												'menus' : menu,
												'phones' : phone,
												'blockOnes' : blockOne,
												'workblocks' : workblock,
												'worklists' : worklist,
												'workimgs' : workimg,
												'services' : servis,
												'prs' : pr,
												'pr_imgs' : pr_img,
												'reviews' : review,
												'rev_items' : rev_item,
												'advans' : advan,
												'advan_items' : advan_item,
												'teams' : team,
												'team_items' :team_item,
												'fdescs' : fdesc
	})

