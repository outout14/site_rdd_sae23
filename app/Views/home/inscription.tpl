<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body>

    <!-- Modal connexion -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Inscription -->
    {include file="./frame/register.tpl"}

    <!-- Notifications -->
    {include file="../utils/notifications.tpl"}

    <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
</body>
</html>
