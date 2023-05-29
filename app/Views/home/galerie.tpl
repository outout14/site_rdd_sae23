<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body onload="titleAnimation('gallery-title')">

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Modal affichage photo -->
    {include file="./modals/photo.tpl"}

    <!-- Modal depot photo  -->
    {include file="./modals/addphoto.tpl"}

    <!-- Gallerie -->
    {include file="./frame/gallery.tpl"}

    <!-- Gallerie <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script> -->
</body>
</html>
