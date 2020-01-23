
<div class="row" id="news">
	<div class="col-sm-12 news-title">Последние новости<hr class="tab-line"></div>
	<div class="container">
		<div class="row">
			<?php foreach ($news as $news_item) { ?>
			<div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="product-thumb transition">
					<?php if($news_item['thumb']) { ?>
					<div class="image"><a href="<?php echo $news_item['href']; ?>"><img src="<?php echo $news_item['thumb']; ?>" alt="<?php echo $news_item['title']; ?>" title="<?php echo $news_item['title']; ?>" class="img-responsive" /></a></div>
					<?php } ?>
					<div class="caption">
						<a href="<?php echo $news_item['href']; ?>"><?php echo $news_item['title']; ?></a>
						<p><?php echo $news_item['description']; ?></p>
					</div>
					<div class="button-group">
						<button onclick="location.href = ('<?php echo $news_item['href']; ?>');" data-toggle="tooltip" title="Читать подробней">Подробней</span></button>
						<!-- <button type="button" data-toggle="tooltip" title="<?php echo $news_item['posted']; ?>"><i class="fa fa-clock-o"></i></button>
						<button type="button" data-toggle="tooltip" title="<?php echo $news_item['viewed']; ?>"><i class="fa fa-eye"></i></button> -->
					</div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	
</div>