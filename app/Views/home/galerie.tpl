<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body class="background-wave-blue" onload="titleAnimation('gallery-title')">

    <!-- Modal affichage photo -->
    {include file="./modals/photo.tpl"}

    <!-- Modal depot photo  -->
    {include file="./modals/addphoto.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Gallerie -->
    {include file="./frame/gallery.tpl"}

    <!-- JavaScript -->
    {include file="./frame/javascript.tpl"}
    
</body>
</html>
