<li class="item-p<?php if( isset($category['childs']) ) echo ' has-sub' ?>">
    <a class="list-group-item<?php if($category['category_id'] == $active) echo ' activecat' ?>" href="<?=$category['href'];?>"><?=$category['name'];?></a>
<?php if( isset($category['childs']) ): ?>
    <ul class="list-group">
        <?= catsToHtml($category['childs'], $active)?>
    </ul>
<?php endif; ?>
</li>
