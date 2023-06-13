
<section class="window-container" id="inscription-container">

    <div class="window d-flex align-items-center flex-column">
        <!-- Header, à ne pas afficher sur la version mobile! -->
        <div class="mt-3 ps-lg-5 ps-3 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">{$currentPage}</h4>
        </div>

        <!-- Content -->
        <div class="container-fluid h-100 overflow-hidden" id="inscription-scrollable">
            <!-- !!!!!!!!!!!!!!!!!! DEBUT FORMULAIRE !!!!!!!!!!!!!!!!!!!!!! -->
            <form action="{$APP_URL}/auth/register" method="POST" class="h-100" id="register_form">
            <input type="hidden" name="actionType" value="register">

                <!-- Etudiant / Professeur / Ancien eleve / Autre -->
                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden px-4">
                    <div class="container-fluid">
                        <!-- Texte d'information -->
                        <div class="row">
                            <div class="col-lg-4 flex-center">
                                <div class="avatar-md border-lightgrey">
                                    <img src="{$APP_URL}/assets/images/creators/creator_hello.png" alt="creator_hello" class="avatar-img">
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <p class="fw-bolder title-3 mt-3 mb-2 my-lg-2 inscription-typeit" id="register_title">
                                    <script>
                                        const register_title = new Typewriter('#register_title', {
                                            strings: 'Hello world!',
                                            autoStart: true,
                                            loop: true,
                                        });
                                    </script>
                                </p>
                                <p class="inscription-info-text">
                                    Afin de pouvoir au mieux adapter le formulaire d'inscription,
                                    nous avons besoin d'en savoir un peu plus sur vous. Veuillez choisir une des options
                                    proposées ci-dessous.
                                </p>
                            </div>
                        </div>

                        <!-- Select -->
                        <div class="row">
                            <div class="col">
                                <select class="form-select mt-5 p-2 w-100 custom-input" id="input-status" name="status">
                                    <option value="student">Je suis un élève...</option>
                                    <option value="teacher">Un professeur</option>
                                    <option value="oldstudent">Un ancien élève</option>
                                    <option value="other">Autres ( entreprises, sponsors )</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Bouton continuer-->
                        <div class="row justify-content-center">
                            <button type="button" class="button bg-blue py-2 px-5 mt-5 inscription-btn-continue" type="button" onclick="firstContinue()">Continuer</button>
                        </div>

                    </div>
                </div>

                <!-- Premiere partie du formulaire ( Informations générales ) -->
                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden px-4">
                    <div class="container-fluid">
                        
                        <!-- Informations / Erreurs   -->
                        <div class="row flex-center" id="register_1_error_container">
                            <div class="col-lg-4 flex-center avatar-d-none">
                                <div class="avatar-md border-lightgrey my-2">
                                    <img src="{$APP_URL}/assets/images/creators/creator_info.png" alt="creator" class="avatar-img" id="register_1_error_img">
                                </div>
                            </div>

                            <div class="col-lg-8 d-flex align-items-center align-items-lg-start flex-column">
                                <p class="text-information fw-bold mb-3" id="register_1_error_title">
                                    <script>
                                        const register_1_error_title = new Typewriter('#register_1_error_title', {});
                                        register_1_error_title
                                            .typeString("Parfait! Continuons.")
                                            .start()
                                    </script>
                                </p>
                                <p class="inscription-info-text" id="register_1_error_text">
                                    Il ne vous reste plus qu'à cocher quelques cases et choisir un mot de passe
                                    assez robuste pour que personne puisse vous voler votre place à la cérémonie!
                                </p>
                            </div>
                        </div>

                        <!-- Nom + Prenom -->
                        <div class="row justify-content-between mt-4 gap-2">
                            <div class="col-12 col-lg">
                                <input autocomplete="given-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Nom" name="lastname" id="input-lastname">
                            </div>

                            <div class="col-12 mt-1 col-lg mt-lg-0">
                                <input autocomplete="family-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Prenom" name="firstname" id="input-firstname">
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="row justify-content-around my-3">
                            <div class="col-12">
                                <input autocomplete="email" type="email" class="form-control ps-2 py-1 custom-input" placeholder="Adresse mail" name="email" id="input-email">
                            </div>
                            <div class="col-12">
                                <div class="form-text px-2" id="help-email"></div>
                            </div>
                        </div>

                        <!-- Numéro de téléphone et promotion -->
                        <div class="row justify-content-between">
                            <div class="col col-lg-12">
                                <div class="input-group">
                                    <span class="input-group-text px-2 py-1 d-flex align-items-center">
                                        <object data="{$APP_URL}/assets/images/svg/france.svg" class="pe-1 svg-france"></object>
                                        +33
                                    </span>
                                    <input type="tel" class="form-control ps-2 py-1 custom-input custom-input-border" placeholder="0668139057" name="phone_number" id="input-phone_number">
                                </div>                            
                            </div>

                            <div class="col-5 col-lg-12 my-lg-2 d-none" id="container-promotion">
                                <select class="form-select ps-2 py-1" name="promotion" id="input-promotion" disabled>
                                    <option value="2AFI">BUT R&T 2 FI</option>
                                    <option value="2AFA">BUT R&T 2 FA</option>
                                    <option value="CART">Licence professionnelle CART</option>
                                    <option value="RIMS">Licence professionnelle RIMS</option>
                                    <option value="TSSR">Licence professionnelle TSSR</option>
                                </select>
                            </div>
                        </div>

                        <!-- Selection de la promotion pour les anciens étudiants -->
                        <div class="row d-none" id="container-oldpromotion">
                            <div class="col-12 mt-lg-2">
                                <select disabled class="form-select ps-2 py-1 custom-input" name="oldpromotion" id="input-oldpromotion" disabled>
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
                        </div>

                        <!-- Input entreprise pour les alternants, anciens eleves, autres  -->
                        <div class="row mt-1 mt-lg-0 d-none" id="container-company">
                            <div class="col-12">
                                <input type="text" class="form-control ps-2 py-1 custom-input" placeholder="Entreprise" name="company" id="input-company" disabled>
                            </div>
                            <div class="col-12">
                                <div class="form-text text-justify px-2 mt-2">
                                    Votre entreprise sera affiché dans la liste des participants
                                </div>
                            </div>
                        </div>

                        <!-- Boutons envoyer / revenir -->
                        <div class="row flex-center flex-column-reverse flex-lg-row mt-4 gap-2 gap-lg-3">
                            <button class="button bg-lightgrey py-2 px-5" type="button" onclick="location.reload()">Revenir</button>
                            <button type="button" class="button bg-blue py-2 px-5" onclick="secondContinue()">Continuer</button>
                        </div>
                    </div>
                </div>

                <!-- Deuxieme partie du formulaire ( checkboxs pour être affiché ou pas sur la carte, mot de passe, infos payement) -->
                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden px-4">
                    <div class="container-fluid">
                        <!-- Informations / Erreurs   -->
                        <div class="row flex-center" id="register_2_error_container">
                            <div class="col-lg-4 flex-center avatar-d-none">
                                <div class="avatar-md border-lightgrey my-2">
                                    <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img" id="register_2_error_image">
                                </div>
                            </div>

                            <div class="col-lg-8 d-flex align-items-center align-items-lg-start flex-column">
                                <p class="text-information fw-bold mb-3" id="register_2_error_title">
                                    <script>
                                        const register_2_error_title = new Typewriter('#register_2_error_title', {});
                                        register_2_error_title
                                            .typeString("Une derniere étape!")
                                            .start()
                                    </script>
                                </p>
                                <p class="inscription-info-text" id="register_2_error_text">
                                    Il ne vous reste plus qu'à cocher quelques cases et choisir un mot de passe
                                    assez robuste pour que personne puisse vous voler votre place à la cérémonie!
                                </p>
                            </div>
                        </div>

                        <!-- Checkbox si affiché dans la liste des participants -->
                        <div class="row mt-4 align-items-center">
                            <div class="col-lg-12">
                                <div class="form-check d-flex align-items-center">
                                    <input type="hidden" value=false name="displayed_in_list">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true name="displayed_in_list" id="ListVisibilityCheck">
                                    <label class="form-check-label text-complementary" for="ListVisibilityCheck" id="label-ListVisibilityCheck">
                                        Je souhaite apparaître dans la liste des participants
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Checkbox si affiché sur la carte, pour les élèves en alternance, les anciens eleves et les "autres" -->
                        <!-- <div class="row mb-1 align-items-center d-none" id="container-map">
                            <div class="col-lg-12">
                                <div class="form-check d-flex align-items-center">
                                    <input type="hidden" value=false name="displayed_on_map">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true name="displayed_on_map" id="input-checkmap">
                                    <label class="form-check-label ms-2 text-complementary" for="input-checkmap" id="label-MapVisibilityCheck">
                                        Je souhaite faire apparaître l'endroit où je travaille sur la carte
                                    </label>
                                </div>
                            </div> -->

                        <!-- Choix de la ville à afficher sur la carte ( alternance ), à desactiver si check d'avant est désactivé -->
                            <!-- <div class="col-lg-12 mt-2">
                                <div class="input-group">
                                    <span class="input-group-text px-2 py-1 d-flex align-items-center">
                                        <img src="{$APP_URL}/assets/images/svg/pin.svg">
                                    </span>
                                    <input type="text" class="form-control ps-2 py-1 custom-input custom-input-border" placeholder="Rennes" name="city" disabled id="input-map">
                                </div>
                            </div>
                        </div> -->

                        <div class="row mt-1 align-items-center d-none" id="container-family">
                            <!-- Checkbox si parents viennent ou pas -->
                            <div class="col-lg-9">
                                <div class="form-check d-flex align-items-center">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true id="input-checkfamily" name="family_comes">
                                    <label class="form-check-label my-2" for="input-checkfamily">
                                        Ma famille participe à la cérémonie
                                    </label>
                                </div>
                            </div>

                            <!-- Select pour savoir le nombre de parents ( désactivé par défaut, 0 par défaut) -->
                            <div class="col-lg-3" id="container-countfamily">
                                <input type="hidden" name="family_count" value="0">
                                <select class="form-select ps-2 py-1 custom-input" name="family_count" id="input-countfamily" disabled>
                                    <option value=1>1</option>
                                    <option value=2>2</option>
                                    <option value=3>3</option>
                                    <option value=4>4</option>
                                    <option value=5>5</option>
                                </select>
                            </div>
                        </div>

                        <!-- Texte aide pour les membres de famille.-->
                        <div class="row d-none" id="help-family">
                            <p class="form-text text-justify px-2">
                                L'entrée pour les membres de famille est gratuite. <strong>Le nombre d'accompagnants est limité.</strong>
                            </p>
                        </div>

                        <!-- Mot de passe + Confirmation du mot de passe -->
                        <div class="row mt-3 d-flex justify-content-between gap-2">
                            <div class="col position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Mot de passe" name="password" id="input-password-register">
                            </div>

                            <div class="col- position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Confirmation du mot de passe" id="input-confirm_password" onpaste="return false" name="confirmpassword">
                            </div>
                        </div>

                        <!-- Captcha -->
                        <div class="flex-center mt-2 mt-lg-4">
                            <div
                                class="h-captcha"
                                data-sitekey="{$HCAPTCHA_SITEKEY}"
                            ></div>
                        </div>

                        <!-- Boutons envoyer / revenir -->
                        <div class="row flex-center flex-column-reverse flex-lg-row mt-4 gap-2 gap-lg-3">
                            <button class="button bg-lightgrey py-2 px-5" type="button" onclick="location.reload()">Revenir</button>
                            <input type="submit" class="button bg-blue py-2 px-5" name="submit" value="S'inscrire">
                        </div>
                    </div>

                </div>

                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden">
                    <div class="flex-center flex-column">
                        <img src="{$APP_URL}/assets/images/svg/check.svg" alt="Check">
                        <h2 class="fw-bold pt-4 text-center">Votre inscription est presque finie!</h2>
                        <p class="text-complementary pt-5 px-2 px-lg-5 mx-0 mx-lg-5">
                            Un email de confirmation a été énvoyé sur l'adresse mail que vous avez renseigné.
                            Pour finir votre inscription, vous devez le consulter et confirmer votre compte.
                        </p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
