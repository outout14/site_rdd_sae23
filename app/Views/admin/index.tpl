{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <h1>Bonjour {$sessionUser->firstname} {$sessionUser->lastname}</h1>
  <p>Bienvenue sur l'espace administrateur du site: vous pouvez ici gérer les utilisateurs et autres.</p>
  <hr>
  <a href="./users" class="btn btn-primary">Gérer les utilisateurs</a>
</div>
{include file="./frame/footer.tpl"}
