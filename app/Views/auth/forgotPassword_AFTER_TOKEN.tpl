{include file="./../home/header.tpl"}
<div class="container mt-5">
  <div>
    <h3>Connexion</h3>
    <form action="#forgotPassword" method="POST">
        {if isset($error)}
          <div class="alert alert-danger" role="alert">
              {$error}
          </div>
        {/if}
      <div class="form-group">
        <label for="password">Mot de passe</label>
        <input type="password" class="form-control" id="password" required name="password" placeholder="Entrez votre mot de passe">
      </div>
      <div class="form-group">
        <label for="password">Répétez le mot de passe</label>
        <input type="password" class="form-control" id="password" required name="password_confirm" placeholder="Entrez votre mot de passe">
      </div>
      <input type="text" name="action" value="resetPassword" hidden>
      <button type="submit" class="btn btn-primary mt-2">Se connecter</button>
    </form>
  </div>
</div>
{include file="./../home/footer.tpl"}
