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
    <div class="col col-4">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Email" required value="{$user->email}">
      </div>
    </div>

    <div class="col col-2">
      <div class="form-group">
        <label for="famille">famille</label>
        <select name="family_count" class="form-control" id="famille" required>
          <option name="0"{if $user->family_count == '0'}selected{/if}>0</option>
          <option name="1"{if $user->family_count == '1'}selected{/if}>1</option>
          <option name="2"{if $user->family_count == '2'}selected{/if}>2</option>
          <option name="3"{if $user->family_count == '3'}selected{/if}>3</option>
          <option name="4"{if $user->family_count == '4'}selected{/if}>4</option>
          <option name="5"{if $user->family_count == '5'}selected{/if}>5</option>
        </select>
      </div>
    </div>

    <div class="col col-12">
      <hr>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="status">Status</label>
        <select name="status" class="form-control" id="status" required>
          <option value="student" {if $user->role == 'student'}selected{/if}>Etudiant</option>
          <option value="teacher" {if $user->role == 'teacher'}selected{/if}>Enseignant</option>
          <option value="oldstudent" {if $user->role == 'oldstudent'}selected{/if}>Ancien élève</option>
        </select>
      </div>
    </div>

    <div class="col col-3">
      <div class="form-group">
        <label for="Entreprise">Entreprise</label>
        <input type="text" class="form-control" name="company" id="company" placeholder="Orange" value="{$user->company}">
      </div>
    </div>
    <div class="col col-3">
      <div class="form-group">
        <label for="promotion">Promotion </label>  
        <select name="promotion"  class="form-control" id="promotion" required>
        <option value="2AFI" {if $user->promotion == '2AFI'}selected{/if}>BUT R&T 2 FI</option>
        <option value="2AFA" {if $user->promotion == '2AFA'}selected{/if}>BUT R&T 2 FA</option>
        <option value="CART"{if $user->promotion == 'CART'}selected{/if}>Licence professionnelle CART</option>
        <option value="RIMS"{if $user->promotion == 'RIMS'}selected{/if}>Licence professionnelle RIMS</option>
        <option value="TSSR"{if $user->promotion == 'TSSR'}selected{/if}>Licence professionnelle TSSR</option></select>
      </div>
    </div>

    <div class="col col-3">
      <div class="form-group">
        <label for="promotion_year">Année de diplome</label>
        <select name="promotion_year" class="form-control" id="promotion_year" required>
          <option value="1990"{if $user->promotion_year == '1990'}selected{/if}>Promotion 1990</option>
          <option value="1991"{if $user->promotion_year == '1991'}selected{/if}>Promotion 1991</option>
          <option value="1992"{if $user->promotion_year == '1992'}selected{/if}>Promotion 1992</option>
          <option value="1993"{if $user->promotion_year == '1993'}selected{/if}>Promotion 1993</option>
          <option value="1994"{if $user->promotion_year == '1994'}selected{/if}>Promotion 1994</option>
          <option value="1995"{if $user->promotion_year == '1995'}selected{/if}>Promotion 1995</option>
          <option value="1996"{if $user->promotion_year == '1996'}selected{/if}>Promotion 1996</option>
          <option value="1997"{if $user->promotion_year == '1997'}selected{/if}>Promotion 1997</option>
          <option value="1998"{if $user->promotion_year == '1998'}selected{/if}>Promotion 1997</option>
          <option value="1999"{if $user->promotion_year == '1999'}selected{/if}>Promotion 1999</option>
          <option value="2000"{if $user->promotion_year == '2000'}selected{/if}>Promotion 2000</option>
          <option value="2001"{if $user->promotion_year == '2001'}selected{/if}>Promotion 2001</option>
          <option value="2002"{if $user->promotion_year == '2002'}selected{/if}>Promotion 2002</option>
          <option value="2003"{if $user->promotion_year == '2003'}selected{/if}>Promotion 2003</option>
          <option value="2004"{if $user->promotion_year == '2004'}selected{/if}>Promotion 2004</option>
          <option value="2005"{if $user->promotion_year == '2005'}selected{/if}>Promotion 2005</option>
          <option value="2006"{if $user->promotion_year == '2006'}selected{/if}>Promotion 2006</option>
          <option value="2007"{if $user->promotion_year == '2007'}selected{/if}>Promotion 2007</option>
          <option value="2008"{if $user->promotion_year == '2008'}selected{/if}>Promotion 2008</option>
          <option value="2009"{if $user->promotion_year == '2009'}selected{/if}>Promotion 2009</option>
          <option value="2010"{if $user->promotion_year == '2010'}selected{/if}>Promotion 2010</option>
          <option value="2011"{if $user->promotion_year == '2011'}selected{/if}>Promotion 2011</option>
          <option value="2012"{if $user->promotion_year == '2012'}selected{/if}>Promotion 2012</option>
          <option value="2013"{if $user->promotion_year == '2013'}selected{/if}>Promotion 2013</option>
          <option value="2014"{if $user->promotion_year == '2014'}selected{/if}>Promotion 2014</option>
          <option value="2015"{if $user->promotion_year == '2015'}selected{/if}>Promotion 2015</option>
          <option value="2016"{if $user->promotion_year == '2016'}selected{/if}>Promotion 2016</option>
          <option value="2017"{if $user->promotion_year == '2017'}selected{/if}>Promotion 2017</option>
          <option value="2018"{if $user->promotion_year == '2018'}selected{/if}>Promotion 2018</option>
          <option value="2019"{if $user->promotion_year == '2019'}selected{/if}>Promotion 2019</option>
          <option value="2020"{if $user->promotion_year == '2020'}selected{/if}>Promotion 2020</option>
          <option value="2021"{if $user->promotion_year == '2021'}selected{/if}>Promotion 2021</option>
          <option value="2022"{if $user->promotion_year == '2022'}selected{/if}>Promotion 2022</option>
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

    <div class="col col-3">
      <div class="form-group">
        <label for="role">Rôle </label>
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
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="confirmed" name="confirmed" {if $user->confirmed}checked{/if}>
        <label class="form-check-label" for="confirmed">
          Utilisateur confirmé
        </label>
      </div>
    </div>
    <div class="col col-3">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="display_on_map" name="display_on_map" {if $user->display_on_map}checked{/if}>
        <label class="form-check-label" for="display_on_map">
          Afficher sur la carte ?
        </label>
      </div>
    </div>

    <div class="col col-3">
      <!-- Checkbox confirmé -->
      <div class="form-check">
        <input class="form-check-input" type="checkbox" id="display_in_list" value="1" name="display_in_list" {if $user->display_in_list}checked{/if}>
        <label class="form-check-label" for="display_in_list">
          Afficher sur la liste ?
        </label>
      </div>
    </div>


  </div>
  <input type="text" value="{$user->id}" name="id" hidden="">
  <input type="text" value="editUser" name="action" hidden="">
  <button type="submit" class="btn btn-primary mt-2">Modifier</button>
</form>
