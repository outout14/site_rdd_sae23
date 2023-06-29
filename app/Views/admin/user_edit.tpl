{include file="./frame/header.tpl"}
<div class="container mt-5">
  <h1>Gestion des utilisateurs</h1>
  <a href="javascript:history.back()" class="btn btn-secondary mb-3">Retour</a>
  <hr>
  
</div>

<!-- Card ajout utilisateur -->
<div class="container">
  <div class="card">
    <h3 class="card-header">Modifier un utilisateur</h3>
    <div class="card-body">
      <!-- Formulaire -->
      <form action="#editUser" method="post">
          {include file="./forms/editUser.tpl"}
      </form>
    </div>
  </div>
</div>

{include file="./frame/footer.tpl"}
