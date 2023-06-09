{include file="./frame/header.tpl"}

<div class="container mt-5">
  <h1>Editeur JSON</h1>
</div>

<!-- Card ajout utilisateur -->
<div class="container">
  <div class="card">
    <h3 class="card-header">Modifier l'entrée "{$url_id}"</h3>
    <div class="card-body">
      <!-- Formulaire -->
      <form action="#editUser" method="post">
          {include file="./forms/editJSON.tpl"}
      </form>
    </div>
  </div>
</div>

{include file="./frame/footer.tpl"}
