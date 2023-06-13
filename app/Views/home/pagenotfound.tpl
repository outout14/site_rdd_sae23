<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body>

    <!-- Modal connexion -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <section class="window-container background-wave-blue flex-center">
        <div class="flex-center flex-column tada">
            <p class="error-title">404</p>
            <p class="error-title">Oops... Cette page n'existe pas.</p>
            <div class="flex-center flex-column-reverse flex-lg-row gap-3 gap-lg-5 mt-5">
                <a href="{$APP_URL}/home/#questions-container"><button class="button border border-3 border-bonewhite text-bonewhite py-2 px-5">Nous contacter</button></a>
                <a href="{$APP_URL}/home/"><button class="button border border-3 border-bonewhite bg-bonewhite text-dark py-2 px-5">Page d'accueil</button></a>
            </div>
        </div>
    </section>

    {include file="./frame/javascript.tpl"}
</body>
</html>
