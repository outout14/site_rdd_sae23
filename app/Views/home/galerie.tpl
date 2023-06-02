<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body class="background-wave-blue" onload="titleAnimation('gallery-title')">

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Modal affichage photo -->
    {include file="./modals/photo.tpl"}

    <!-- Modal depot photo  -->
    {include file="./modals/addphoto.tpl"}

    <!-- Gallerie -->
    {include file="./frame/gallery.tpl"}

    <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
    <script src="https://js.hcaptcha.com/1/api.js?hl=fr" async defer></script>
</body>
</html>
