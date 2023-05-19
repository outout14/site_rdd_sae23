<section class="window-container background-wave-blue" id="annuaire-container">

    <div class="window d-flex align-items-center flex-column px-1 px-lg-5 pt-5 pt-lg-0">
        <!-- Header, à ne pas afficher sur la version mobile! -->
        <div class="my-3 ps-2 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">{$currentPage}</h4>
        </div>

        <form action="#" method="POST" class="w-100 h-auto mb-3 mt-5 mt-lg-2 px-3">
            <input type="hidden" name="actionType" value="annuaireResearch">
    
            <div class="container-fluid">
                <div class="row gap-1">
                    <div class="col-12 col-lg-2 my-1">
                        <select class="form-select px-3 py-2" name="status" id="annuaire-status">
                            <option value="student">Etudiant</option>
                            <option value="teacher">Professeur</option>
                            <option value="oldstudent">Ancien élève</option>
                            <option value="other">Autre</option>
                        </select>
                    </div>
    
                    <div class="col-12 col-lg-5 my-1">
                        <input class="form-control px-3 py-2" type="text" placeholder="Nom ou prénom" id="annuaire-name" name="name">
                    </div>
                    
                    <div class="col-12 col-lg d-flex gap-1 justify-content-between my-1">
                        <select class="form-select px-3 py-2" id="annuaire-promotion" name="promotion">
                            <option value="2AFA">2AFA</option>
                            <option value="2AFI">2AFI</option>
                            <option value="RIMS">LP RIMS</option>
                            <option value="CART">LP CART</option>
                            <option value="TSSR">LP TSSR</option>
                        </select>

                        <input class="form-control px-3 py-2" type="text" placeholder="Entreprise" id="annuaire-company" name="company">
                    </div>
    
                    <!-- <div class="col-12 col-lg-2 flex-center my-1">
                        <input class="button rounded-3 bg-blue text-white fw-bold h-100 w-100 px-3 py-2" type="submit" name="submit" value="Rechercher">
                    </div> -->
                </div>
            </div>
        </form>

        <div class="mb-0 mb-lg-5" id="annuaire-table-wrapper">
            <table class="table table-striped table-hover" id="annuaire-table">
                <thead>
                    <tr>
                        <th class="text-information ps-2 ps-lg-4 py-2">Nom</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Prenom</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Statut</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Promotion</th>
                        <th class="text-information ps-2 ps-lg-4 py-2">Entreprise</th>
                    </tr>
                </thead>
                <tbody class="overflow-scroll" id="annuaire-table-body">
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                    <tr>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Teffene</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Alexis</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Etudiant</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">2AFA</td>
                        <td class="ps-0 ps-lg-2 py-3 text-complementary">Orange</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>
