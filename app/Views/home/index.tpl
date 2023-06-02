<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body>

    <!-- Modal connexion -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Page d'accueil -->
    {include file="./frame/home.tpl"}

    <!-- Organisation -->
    {include file="./frame/organisation.tpl"}

    <!-- Organisateurs -->
    {include file="./frame/creators.tpl"}

    <!-- Questions -->
    {include file="./frame/questions.tpl"}

    <!-- Notifications -->
    {include file="../utils/notifications.tpl"}

    <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
    <script src="https://js.hcaptcha.com/1/api.js?hl=fr" async defer></script>
</body>
</html>
