{include file="./frame/header.tpl"}
<div class="container mt-5">
  <h1>Editeur JSON</h1>

  <!-- Organisation --> 
  <div class="card-body">
  <h3>Fichier <code>organisation.json</code></h3>
  <table class="table table-hover">
    <thead>
    <tr>
      <th scope="col">Clé</th>
      <th scope="col">Valeur</th>
      <th scope="col">Actions</th>
    </tr>
    </thead>
    <tbody>
      {foreach from=$json_organisation key=$key item=$item}
        <tr class="table-active">
          <th scope="row">{$key}</th>
          <th>{$item}</th>
          <th><a href="{$APP_URL}/admin/modifyjson/organisation.json/{$key}" class="btn btn-primary">Modifier</a></th>
        </tr>
      {/foreach}
    </tbody>
  </table>

  
  <div class="card-body">
  <h3>Fichier <code>organisators.json</code></h3>
  <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">Prénom</th>
        <th scope="col">Nom</th>
        <th scope="col">Tâche</th>
        <th scope="col">Lien</th>
        <th scope="col">Photos</th>
        <th scope="col">Actions</th>
      </tr>
    </thead>
    <tbody>
      {foreach from=$json_organisators key=$key item=$item}
      <tr class="table-active">
        <th>{$item['firstname']}</th>
        <th>{$item['lastname']}</th>
        <th>{$item['task']}</th>
        <th><a href="https://{$item['link']}">{$item['link']}</a></th>
        <th><img width="50px" src="{$APP_URL}/assets/images/creators/creator_{$item['firstname']}.png"></th>
        <th><a href="{$APP_URL}/admin/modifyjson/organisators.json/{$key}" class="btn btn-primary">Modifier</a> <a href="?delete={$key}&file=organisators.json" class="btn btn-danger">Supprimer</a></th>
      </tr>
      {/foreach}
    </tbody>
  </table>

  <!-- Formulaire pour ajouter un nouvel organisateur -->
  <h4>Ajouter un nouvel organisateur :</h4>
  <form action="" method="POST">
    <div class="form-group">
      <label for="inputFirstname">Prénom :</label>
      <input type="text" class="form-control" id="inputFirstname" name="firstname" required>
    </div>
    <div class="form-group">
      <label for="inputLastname">Nom :</label>
      <input type="text" class="form-control" id="inputLastname" name="lastname" required>
    </div>
    <div class="form-group">
      <label for="inputTask">Tâche :</label>
      <input type="text" class="form-control" id="inputTask" name="task" required>
    </div>
    <div class="form-group">
      <label for="inputLink">Lien :</label>
      <input type="text" class="form-control" id="inputLink" name="link" required>
    </div>
    <button type="submit" class="btn btn-primary">Ajouter</button>
  </form>
</div>


  <!-- Sponsors -->
    <!-- Organisation --> 
    <div class="card-body">
    <h3>Fichier <code>sponsors.json</code></h3>
    <table class="table table-hover">
      <thead>
      <tr>
        <th scope="col">Nom</th>
        <th scope="col">Lien</th>
        <th scope="col">photos</th>
        <th scope="col">Actions</th>
      </tr>
      </thead>
      <tbody>
        {foreach from=$json_sponsors key=$key item=$item}
          <tr class="table-active">
            <th>{$item["name"]}</th>
            <th><a href="https://{$item['link']}">{$item['link']}</a></th>
            <th><img width="50px" src="{$APP_URL}/assets/images/sponsors/{$item['name']}.png"></th>
           
            <th><a href="{$APP_URL}/admin/modifyjson/sponsors.json/{$key}" class="btn btn-primary">Modifier</a> <a href="?delete={$key}&file=sponsors.json" class="btn btn-danger">Supprimer</a></th>
          </tr>
        {/foreach}
      </tbody>
    </table>
</div>
{include file="./frame/footer.tpl"}


