{include file="./frame/header.tpl"}
<div class="container mt-5">
  <h1>Gestion des utilisateurs</h1>
  <p>Vous pouvez gérer les utilisateurs de votre site ici.</p>
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
