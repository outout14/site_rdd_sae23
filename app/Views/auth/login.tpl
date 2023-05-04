{include file="./../home/header.tpl"}
<div class="container mt-5">
  <div>
    <h3>Connexion</h3>
    <form action="#login" method="POST">
      <!-- Formulaire bootstrap de connexion -->
      {if isset($error)}
      <div class="alert alert-danger" role="alert">
        {$error}
      </div>
      {/if}
      <div class="form-group">
        <label for="email">Adresse email</label>
        <input type="email" class="form-control" id="email" required name="email" placeholder="Entrez votre adresse email">
      </div>
      <div class="form-group">
        <label for="password">Mot de passe</label>
        <input type="password" class="form-control" id="password" required name="password" placeholder="Entrez votre mot de passe">
      </div>
      <input type="text" name="action" value="login" hidden>
      <button type="submit" class="btn btn-primary mt-2">Se connecter</button>
    </form>
  </div>
</div>
{include file="./../home/footer.tpl"}
