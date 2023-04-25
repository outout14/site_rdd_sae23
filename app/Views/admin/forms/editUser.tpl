<form method="post" action="#editUser">
  <div class="row">
    <div class="col col-3">
      <div class="form-group">
        <label for="nom">Nom</label>
        <input type="text" class="form-control" name="lastname" id="nom" placeholder="Nom" required value="{$user->lastname}">
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="prenom">Prénom</label>
        <input type="text" class="form-control" name="firstname" id="prenom" placeholder="Prénom" required value="{$user->firstname}">
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required value="{$user->email}">
      </div>
    </div>
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-6">
      <div class="form-group">
        <label for="status">Status</label>
        <select name="status" class="form-control" id="status" required>
          <option value="student" {if $user->role == 'student'}selected{/if}>Etudiant</option>
          <option value="teacher" {if $user->role == 'teacher'}selected{/if}>Enseignant</option>
          <option value="oldstudent" {if $user->role == 'oldstudent'}selected{/if}>Ancien élève</option>
        </select>
      </div>
    </div>
    <div class="col col-6">
      <div class="form-group">
        <label for="role">Rôle {$user->role}</label>
        <select name="role"  class="form-control" id="role" required>
          <option value="user" {if $user->role == 'user'}selected{/if}>Utilisateur</option>
          <option value="admin" {if $user->role == 'admin'}selected{/if}>Administrateur</option>
        </select>
      </div>
    </div>
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="telephone">N° de téléphone</label>
        <input type="tel" class="form-control" name="phone_number" id="telephone" placeholder="0123456789" value="{$user->phone_number}">
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="telephone">Ville</label>
        <input type="text" class="form-control" name="city" id="city" placeholder="Saint-Malo" value="{$user->city}">
      </div>
    </div>
    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-6">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="confirmed" name="confirmed" {if $user->confirmed}checked{/if}>
        <label class="form-check-label" for="confirmed">
          Utilisateur confirmé
        </label>
      </div>
    </div>
    <div class="col col-6">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="display_on_map" name="display_on_map" {if $user->display_on_map}checked{/if}>
        <label class="form-check-label" for="display_on_map">
          Afficher sur la carte ?
        </label>
      </div>
    </div>
  </div>
  <input type="text" value="{$user->id}" name="id" hidden="">
  <input type="text" value="editUser" name="action" hidden="">
  <button type="submit" class="btn btn-primary mt-2">Modifier</button>
</form>
