{include file="./frame/header.tpl"}
<div class="container mt-5">
  <h1>Gestion des utilisateurs</h1>
  <p>Vous pouvez gérer les utilisateurs de votre site ici.</p>
</div>

<!-- Card ajout utilisateur -->
<div class="container">
  <div class="card">
    <h3 class="card-header">Ajouter un utilisateur</h3>
    <div class="card-body">
      {include file="./forms/addUser.tpl"}
    </div>
  </div>

  <div class="card mt-5" id="quserList">
    <h3 class="card-header">Liste des utilisateurs</h3>

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


    <div class="card-body">
      <table class="table table-hover">
        <thead>
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Prénom</th>
          <th scope="col">Nom</th>
          <th scope="col">Tél.</th>
          <th scope="col">A payé ?</th>
          <th scope="col">Listé ?</th>
          <th scope="col">Confirmé ?</th>
          <th scope="col">Status</th>
          <th scope="col">Rôle</th>
          <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        {foreach $users as $user}
          <tr class="table-active">
            <th scope="row">{$user->id}</th>
            <td>{$user->firstname}</td>
            <td>{$user->lastname}</td>
            <td>{$user->email}</td>
            <td>{if $user->has_paid == 1}
                <i class="bi bi-check-all text-success table-icon"></i>
                {else}
                <i class="bi bi-x text-danger table-icon"></i>
                {/if}</td>
            <td>{if $user->display_in_list == 1}
                <i class="bi bi-check-all text-success table-icon"></i>
                {else}
                <i class="bi bi-x text-danger table-icon"></i>
                {/if}</td>
            <td>{if $user->confirmed == 1}
                <i class="bi bi-check-all text-success table-icon"></i>
              {else}
                <i class="bi bi-x text-danger table-icon"></i>
              {/if}</td>
            <td>{$user->status}</td>
            <td>{$user->role}</td>
            <td>
            <a class="btn btn-primary" href="{$APP_URL}/admin/user_edit/{$user->id}">Modifier</a> 
            <a class="btn btn-danger" href="{$APP_URL}/admin/user_delete/{$user->id}">Supprimer</a>
            {if $user->has_paid == 0}
              <a class="btn btn-success" href="{$APP_URL}/admin/user_paid/{$user->id}">A Payé</a>
            {/if}
            </td>
          </tr>
        {/foreach}
        {if $users == null}
          <tr>
            <td colspan="11" class="text-center text-danger">Aucun utilisateur n'a été trouvé.</td>
          </tr>
        {/if}

        
        </tbody>
      </table>
    </div>
  </div>
</div>

{include file="./frame/footer.tpl"}
