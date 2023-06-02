<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body>

    <!-- Modal connexion -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Inscription -->
    {include file="./frame/annuaire.tpl"}

    <!-- Notifications -->
    {include file="../utils/notifications.tpl"}

    
    <!-- <script src="{$APP_URL}/assets/js/ajaxResearch.js"></script> -->
    <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
    <script src="https://js.hcaptcha.com/1/api.js?hl=fr" async defer></script>
</body>
</html>
