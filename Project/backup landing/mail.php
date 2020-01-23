<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['name'])) {$name = $_POST['name'];}
    if (isset($_POST['phone'])) {$phone = $_POST['phone'];}
    if (isset($_POST['mail'])) {$mail = $_POST['mail'];}
    // if (isset($_POST['email'])) {$email = $_POST['email'];}
    if (isset($_POST['formData'])) {$formData = $_POST['formData'];}
 
    $to = "zarukin.den@gmail.com"; /*Укажите адрес, на который должно приходить письмо*/
    $sendfrom   = "Order@SEO.com.ua"; /*Укажите адрес, с которого будет приходить письмо, можно не настоящий, нужно для формирования заголовка письма*/
    $headers  = "From: " . strip_tags($sendfrom) . "\r\n";
    $headers .= "Reply-To: ". strip_tags($sendfrom) . "\r\n";
    $headers .= "MIME-Version: 1.0\r\n";
    $headers .= "Content-Type: text/html;charset=utf-8 \r\n";
    $subject = "$formData";
    $message = "$formData
    <b>  |||Веб Сайт:</b> <b>$name</b>
    <b>  ||| Емейл</b> <b>$mail</b>
    <b>  |||Телефон:</b> <b>$phone</b>";
    $send = mail ($to, $subject, $message, $headers);
    if ($send == 'true')
    { echo '<p class="massage"> Сообщение отправлено.<br>Мы скоро свяжемся с вами.</p>';}
    else{ echo '<p class="massage><b>Ошибка. Сообщение не отправлено!</b></p>';}} 
    else {http_response_code(403); echo "Попробуйте еще раз";
}?>