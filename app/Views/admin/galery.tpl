{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <h1>Bonjour {$sessionUser->firstname} {$sessionUser->lastname}</h1>
  <p>Bienvenue sur la partie livre d'or, vous pouvez ici gérer les entrées du livre d'or.</p>
  <hr>
  {include file="./forms/editPhotos.tpl"}
</div>
{include file="./frame/footer.tpl"}


