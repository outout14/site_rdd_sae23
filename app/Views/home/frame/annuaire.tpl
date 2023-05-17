<section class="window-container background-wave-blue" id="annuaire-container">

    <div class="window mt-5 mb-3 w-75 h-auto" id="annuaire-search-window">
        <form action="#" method="POST" class="container-fluid">

            <div class="row gap-2">

                <div class="col-lg-4 my-2">
                    <input class="form-control px-3 py-2 rounded-pill custom-input" type="text" placeholder="Prénom">
                </div>
                
                <div class="col-lg-2 my-2">
                    <select class="form-select px-3 py-2 rounded-pill custom-input">
                        <option value="student">Etudiant</option>
                        <option value="teacher">Professeur</option>
                        <option value="oldstudent">Ancien élève</option>
                        <option value="other">Autre</option>
                    </select>
                </div>

                <div class="col-lg-2 my-2">
                    <select class="form-select px-3 py-2 rounded-pill custom-input">
                        <option value="student">2AFI</option>
                        <option value="teacher">2AFA</option>
                        <option value="oldstudent">LP RIMS</option>
                        <option value="other">LP CART</option>
                        <option value="other">LP TSSR</option>
                    </select>
                </div>

                <div class="col-lg-2 my-2">
                    <input class="form-control px-3 py-2 rounded-pill custom-input" type="text" placeholder="Entreprise">
                </div>

            </div>
                
        </form>
    </div>

    <div class="window d-flex align-items-center flex-column">
        <!-- Header, à ne pas afficher sur la version mobile! -->
        <div class="my-3 ps-lg-5 ps-3 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">{$currentPage}</h4>
        </div>

        <table class="table" id="annuaire-table-head">
            <thead>
                <tr>
                    <th class="text-information ps-2 ps-lg-4 py-2">Nom</th>
                    <th class="text-information ps-2 ps-lg-4 py-2">Prenom</th>
                    <th class="text-information ps-2 ps-lg-4 py-2">Statut</th>
                    <th class="text-information ps-2 ps-lg-4 py-2">Promotion</th>
                    <th class="text-information ps-2 ps-lg-4 py-2">Entreprise</th>
                </tr>
            </thead>
        </table>

        <div class="mb-5" id="annuaire-table-wrapper">
            <table class="table table-striped table-hover" id="annuaire-table">
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
