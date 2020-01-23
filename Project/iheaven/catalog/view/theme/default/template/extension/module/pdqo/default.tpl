<div class="pdqo-window" style="max-width: <?=$window['width'];?>px;">
    <div class="pdqo-wrapper">
        <div class="pdqo-header">
            <?=$t['quick_order'];?>
        </div>
        <div class="pdqo-content">
            <div class="pdqo-section pdqo-group">
                <div class="pdqo-col pdqo-span-12-of-12">
                    <div id="pdqo-f">
                        <div class="pdqo-section pdqo-group">
                            <div class="pdqo-col pdqo-span-6-of-12">
                                <label for="pdqo-n"><?php if($fields['name']['required']) { ?><i class="pdqo-required">*</i><?php } ?> <?=$t['name'];?></label>
                                <input name="pdqo-n-field" id="pdqo-n" class="pdqo-field" type="text" placeholder="<?=$fields['name']['placeholder'];?>" value="<?=$fields['name']['value'];?>" />
                            </div>
                            <div class="pdqo-col pdqo-span-6-of-12">
                                <label for="pdqo-p"><?php if($fields['phone']['required']) { ?><i class="pdqo-required">*</i><?php } ?> <?=$t['phone'];?></label>
                                <input name="pdqo-p-field" id="pdqo-p" class="pdqo-field" type="text" placeholder="<?=$fields['phone']['placeholder'];?>" value="<?=$fields['phone']['value'];?>" />
                            </div>
                        </div>
                        <?php if($fields['email']['status']) { ?>
                            <div class="pdqo-section pdqo-group">
                                <div class="pdqo-col pdqo-span-12-of-12">
                                    <label for="pdqo-e"><?php if($fields['email']['required']) { ?><i class="pdqo-required">*</i><?php } ?> <?=$t['email'];?></label>
                                    <input name="pdqo-e-field" id="pdqo-e" class="pdqo-field" type="text" placeholder="<?=$fields['email']['placeholder'];?>"  value="<?=$fields['email']['value'];?>" />
                                </div>
                            </div>
                        <?php } ?>
                        <?php if($fields['comment']['status']) { ?>
                            <div class="pdqo-section pdqo-group">
                                <div class="pdqo-col pdqo-span-12-of-12">
                                    <label for="pdqo-c"><?php if($fields['comment']['required']) { ?><i class="pdqo-required">*</i><?php } ?> <?=$t['comment'];?></label>
                                    <textarea name="pdqo-c-field" id="pdqo-c" class="pdqo-field" type="text" rows="3" placeholder="<?=$fields['comment']['placeholder'];?>"></textarea>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="pdqo-section pdqo-group">
                        <div class="pdqo-col pdqo-span-12-of-12">
                            <table class="pdqo-products"></table>
                        </div>
                    </div>
                    <div class="pdqo-section pdqo-group">
                        <div class="pdqo-col pdqo-span-3-of-12">
                            <button class="pdqo-button pdqo-confirm"><?=$t['checkout'];?></button>
                        </div>
                        <div class="pdqo-col pdqo-span-6-of-12">&nbsp;</div>
                        <div class="pdqo-col pdqo-span-3-of-12">
                            <button class="pdqo-button pdqo-cancel"><?=$t['continue_shopping'];?></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?=$js;?>