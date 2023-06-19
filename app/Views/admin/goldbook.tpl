{include file="./frame/header.tpl"}
<div class="container mt-5">
  <!-- Alert bonjour -->
  <p>Bienvenue sur la partie livre d'or, vous pouvez ici gérer les entrées du livre d'or.</p>
  <hr>
  <div class="container">
  <div class="form-group mt-3">
    <form action="#userList" method="GET">
      <div class="row">
        <div class="col">
          <input type="text" class="form-control" name="search" placeholder="Rechercher un utilisateur..." value="{$searchQuery}">
        </div>
        <div class="col">
          <button type="submit" class="btn btn-primary">Rechercher</button>
        </div>
      </div>
    </form>
  </div>
</div>



  {foreach $goldbook as $message}
    <div class="card border m-2 p-2">
      <div class="card-header">{$message->author->lastname} {$message->author->firstname}</div>
      <div class="card-body">
        <p class="card-text">{$message->content}</p>
        <p class="card-text">{$message->date}</p>
        <p class="card-text">{$message->id}</p>
      </div>
      <div class="card-footer">
        <a href="{$APP_URL}/admin/goldbook/?validate={$message->id}" class="btn btn-success">Valider</a>
        <a href="{$APP_URL}/admin/goldbook/?nonvalidate={$message->id}" class="btn btn-danger">Supprimer</a>
      </div>
    </div>
  {/foreach}

</div>
{include file="./frame/footer.tpl"}
