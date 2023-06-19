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

    <!-- JavaScript -->
    {include file="./frame/javascript.tpl"}
    
</body>
</html>
