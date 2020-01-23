<?php

function catsToHtml($tree, $active = null){
    $str = '';
    foreach ($tree as $category) {
        $str .= catToTemplate($category, $active);
    }
    return $str;
}

function catToTemplate($category, $active){;
    ob_start();
    require __DIR__ . '/cats_template.tpl';
    return ob_get_clean();
}
$cats = catsToHtml($categories_tree, $active);
?>

<script>
    $(function(){
        $('.catalog').dcAccordion();
    })
</script>

<style>
    .list-group-root .list-group{
        margin-bottom: 0;
    }
    .list-group-root{
        border: 1px solid #e3e3e3;
        border-radius: 4px;
    }
    .list-group-root .list-group > li > .list-group-item {
        padding-left: 30px;
    }
    .list-group-root .list-group .list-group > li > .list-group-item {
        padding-left: 45px;
    }
    .list-group-root .list-group .list-group > .list-group > li > .list-group-item {
        padding-left: 60px;
    }
    .list-group-root > li > .list-group > li > .list-group > li > .list-group > li > .list-group-item {
        padding-left: 75px;
    }
    .list-group-root .list-group-item {
        border-radius: 0;
        border-width: 1px 0;
    }
    .catalog li{
        list-style: none;
    }
    .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover{
        color: #444444;
        background: #eeeeee;
        border: 1px solid #DDDDDD;
        text-shadow: 0 1px 0 #FFF;
        outline: none;
    }
</style>

<ul class="list-group list-group-root catalog">
    <?=$cats;?>
</ul>