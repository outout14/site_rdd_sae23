<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body>

    <!-- Modal ticket -->
    {include file="./modals/ticket.tpl"}

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

    <!-- JS -->
    {include file="./frame/javascript.tpl"}

    {if $sessionUser}
        {if $sessionUser->has_paid == 0}
            <script>
              // Wait 3s before showing the modal
              setTimeout(function() {
                openModal("ticket-modal");
              }, 1500);
            </script>
        {/if}
    {/if}

    
</body>
</html>
