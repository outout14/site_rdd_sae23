{include file="./frame/header.tpl"}

<div class="container mt-5">
  <h1>Editeur JSON</h1>
  <hr>
  <a href="javascript:history.back()" class="btn btn-secondary mb-2">Retour</a>

</div>

<!-- Card ajout utilisateur -->
<div class="container">
  <div class="card">
    <h3 class="card-header">Modifier l'entrée </h3>
    <div class="card-body">
      <!-- Formulaire -->
      <h3>"{$url_id}"</h3>
      {include file="./forms/editJSON.tpl"}
    </div>
  </div>
</div>

{include file="./frame/footer.tpl"}
