<section class="window-container" id="annuaire-container">
    <div class="window d-flex align-items-center flex-column px-1 px-md-3 px-lg-5 pt-5 pt-lg-0">
        <!-- Header, à ne pas afficher sur la version mobile! -->
        <div class="my-3 ps-2 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">{$currentPage}</h4>
        </div>
        <form action="{$APP_URL}/home/annuaire" method="POST" class="w-100 h-auto mb-3 mt-5 mt-lg-2 px-3" id="annuaire-form">
            <input type="hidden" name="actionType" value="search">
    
            <div class="container-fluid">
                <div class="row gap-1">
                    <div class="col-12 col-lg-2 my-1">
                        <select class="form-select px-3 py-2 annuaire-ajax" name="status" id="annuaire-status">
                            <option value="Tous" selected>Tous</option>
                            <option value="student">Etudiant</option>
                            <option value="teacher">Professeur</option>
                            <option value="oldstudent">Ancien élève</option>
                        </select>
                    </div>

                    <div class="col-12 col-lg-4 my-1">
                        <input class="form-control px-3 py-2 annuaire-ajax" type="text" placeholder="Nom ou prénom" id="annuaire-name" name="name">
                    </div>

                    <div class="col-12 col-lg my-1">
                        <select class="form-select ps-2 py-2 annuaire-ajax " id="annuaire-promotion" name="promotion">
                            <option value="" selected>Toutes promotions</option>
                            <option value="2AFA">2AFA</option>
                            <option value="2AFI">2AFI</option>
                            <option value="RIMS">LP RIMS</option>
                            <option value="CART">LP CART</option>
                            <option value="TSSR">LP TSSR</option>
                            <option value="1990">Promotion 1990</option>
                            <option value="1990">Promotion 1991</option>
                            <option value="1990">Promotion 1992</option>
                            <option value="1990">Promotion 1993</option>
                            <option value="1990">Promotion 1994</option>
                            <option value="1990">Promotion 1995</option>
                            <option value="1990">Promotion 1996</option>
                            <option value="1990">Promotion 1997</option>
                            <option value="1990">Promotion 1997</option>
                            <option value="1990">Promotion 1999</option>
                            <option value="2000">Promotion 2000</option>
                            <option value="2001">Promotion 2001</option>
                            <option value="2002">Promotion 2002</option>
                            <option value="2003">Promotion 2003</option>
                            <option value="2004">Promotion 2004</option>
                            <option value="2005">Promotion 2005</option>
                            <option value="2006">Promotion 2006</option>
                            <option value="2007">Promotion 2007</option>
                            <option value="2008">Promotion 2008</option>
                            <option value="2009">Promotion 2009</option>
                            <option value="2010">Promotion 2010</option>
                            <option value="2011">Promotion 2011</option>
                            <option value="2012">Promotion 2012</option>
                            <option value="2013">Promotion 2013</option>
                            <option value="2014">Promotion 2014</option>
                            <option value="2015">Promotion 2015</option>
                            <option value="2016">Promotion 2016</option>
                            <option value="2017">Promotion 2017</option>
                            <option value="2018">Promotion 2018</option>
                            <option value="2019">Promotion 2019</option>
                            <option value="2020">Promotion 2020</option>
                            <option value="2021">Promotion 2021</option>
                            <option value="2022">Promotion 2022</option>
                        </select>
                    </div>

                    <div class="col-12 col-lg-2 my-1">
                        <input class="form-control px-3 py-2 annuaire-ajax" type="text" placeholder="Entreprise" id="annuaire-company" name="company">
                    </div>

                    <div class="col-12 col-lg-1 flex-center my-1">
                        <button class="button rounded-3 bg-blue text-white fw-bold h-100 w-100 px-3 py-2" type="submit" name="submit" value="submit">
                            <i class="bi bi-search"></i>
                        </button>
                    </div>
                </div>
            </div>
        </form>

        <div class="mb-0 mb-lg-5" id="annuaire-table-wrapper">
            <table class="table table-striped table-hover" id="annuaire-table">
                <thead>
                    <tr>
                        <th class="text-information ps-2 ps-lg-4 py-2">Nom</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Prénom</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Statut</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Promotion</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Entreprise</th>
                    </tr>
                </thead>
                <tbody class="overflow-scroll" id="annuaire-table-body">
                    {if empty($users) }
                    <p>Aucun utilisateur</p>
                    {/if}
                    {foreach $users as $user}
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">{$user->lastname|capitalize}</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">{$user->firstname|capitalize}</td>
                        {if $user->status == 'student'}
                          <td class="ps-0 ps-lg-2 py-3 text-complementary">Étudiant</td>
                        {elseif $user->status == 'teacher'}
                          <td class="ps-0 ps-lg-2 py-3 text-complementary">Enseignant</td>
                        {elseif $user->status == 'oldstudent'}
                          <td class="ps-0 ps-lg-2 py-3 text-complementary">Ancien élève</td>
                        {else}
                          <td class="ps-0 ps-lg-2 py-3 text-complementary">Autre</td>
                        {/if}
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">{$user->promotion}</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">{$user->company}</td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</section>


