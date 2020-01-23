========================================================================================================================
Product Statuses PRO v2.0
Author sv2109 (sv2109.com) 
Copyright (c) 2013, sv2109 (sv2109@gmail.com)
========================================================================================================================

What is Product Statuses?

The module gives you ability to add custom image statuses for the products. 

Requirements:

• OpenCart 2.09.x (if you have another version of OpenCart and need this module - please email me at sv2109[at]gmail.com)

Installation Steps:

1. Copy the contents of the "upload" folder to your store's top level directory, preserving the directory structure.
   The contents will not overwrite anything due to new files.
2. Login to your OpenCart Admin
3. Select "Admin->Extensions->Modules"
4. Install the module
5. Go to Extension Installer and select "install.ocmod.xml", then, refresh cache from Modifications menu
6. Edit module and change settings
7. Add statuses on the module page
8. Add statuses for the products on the product edit page in the "Statuses" tab.
9. For display statuses on the product page:
- open the file /catalog/view/theme/your_theme/template/product/product.tpl
- In the right place, for example, after "<h1><?php echo $heading_title; ?></h1>", add:

<div class="statuses"><?php echo $statuses; ?></div>

- for stickers after 
  "<ul class="thumbnails">
    <?php if ($thumb) { ?>
      <li>" 
add: 

<?php echo $stickers; ?>


9. For display statuses on the category page:
- open the file /catalog/view/theme/your_theme/template/product/category.tpl
- after "<p><?php echo $product['description']; ?></p>" add:

<div class="statuses"><?php echo $product['statuses']; ?></div>

- for stickers after "<div class="image">" add: 

<?php echo $product['stickers']; ?>

The examples of these files are in the templates folder.
