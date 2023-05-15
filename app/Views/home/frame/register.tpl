<section class="window-container background-wave-blue" id="inscription-container">

    <div class="window d-flex justify-content-center">
        <!-- Header, à ne pas afficher sur la version mobile! -->
        <div class="mt-3 ps-lg-5 ps-3 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">Inscription</h4>
        </div>

        <!-- Content -->
        <div class="container-fluid h-100 overflow-hidden" id="inscription-scrollable">
            <!-- !!!!!!!!!!!!!!!!!! DEBUT FORMULAIRE !!!!!!!!!!!!!!!!!!!!!! -->
            <form action="{$APP_URL}/auth/register" method="POST" class="h-100">
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
                                <p class="fw-bolder title-3 mt-3 mb-2 my-lg-2 inscription-typeit" id="inscription-title">
                                    <script>
                                        const title = new Typewriter('#inscription-title', {
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
                                <select class="form-select mt-5 p-2 w-100 custom-input" id="inscription-select" name="status">
                                    <option value="student">Je suis un élève...</option>
                                    <option value="teacher">Un professeur</option>
                                    <option value="oldstudent">Un ancien élève</option>
                                    <option value="other">Autres ( entreprises, sponsors )</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Bouton continuer-->
                        <div class="row justify-content-center">
                            <button class="button bg-blue py-2 px-5 mt-5 inscription-btn-continue" type="button" onclick="firstContinue()">Continuer</button>
                        </div>

                    </div>
                </div>

                <!-- Premiere partie du formulaire ( Informations générales ) -->
                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden px-4">
                    <div class="container-fluid">
                        
                        <!-- Informations / Erreurs   -->
                        <!-- showError(['error-container-1','error-img-1',error_title_1,'error-text-1'],'missing_input')  -->
                        <div class="row flex-center" id="error-container-1">
                            <div class="col-lg-4 flex-center avatar-d-none">
                                <div class="avatar-md border-lightgrey my-2">
                                    <img src="{$APP_URL}/assets/images/creators/creator_info.png" alt="creator" class="avatar-img" id="error-img-1">
                                </div>
                            </div>

                            <div class="col-lg-8 d-flex align-items-center align-items-lg-start flex-column">
                                <p class="text-information fw-bold mb-3" id="error-title-1">
                                    <script>
                                        const error_title_1 = new Typewriter('#error-title-1', {});
                                        error_title_1
                                            .typeString("Parfait! Continuos.")
                                            .start()
                                    </script>
                                </p>
                                <p class="inscription-info-text" id="error-text-1">
                                    Il ne vous reste plus qu'à cocher quelques cases et choisir un mot de passe
                                    assez robuste pour que personne puisse vous voler votre place à la cérémonie!
                                </p>
                            </div>
                        </div>

                        <!-- Nom + Prenom -->
                        <div class="row justify-content-between mt-4">
                            <div class="col-12 col-lg-6">
                                <input  autocomplete="given-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Nom" name="lastname" id="input-lastname">
                            </div>

                            <div class="col-12 mt-1 col-lg-5 mt-lg-0">
                                <input  autocomplete="family-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Prenom" name="firstname" id="input-firstname">
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="row justify-content-around my-3">
                            <div class="col-12">
                                <input autocomplete="email" required type="email" class="form-control ps-2 py-1 custom-input" placeholder="Adresse mail" name="email" id="input-email">
                            </div>
                            <div class="col-12">
                                <div class="form-text px-2" id="change-help-email">
                                    Merci d'utiliser votre mail universitaire (@etudiant.univ-rennes1.fr)
                                </div>
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
                                    <input type="tel" class="form-control ps-2 py-1 custom-input custom-input-border" placeholder="06 66 77 88 99" name="phone_number" id="input-phone_number">
                                </div>                            
                            </div>

                            <div class="col-5 col-lg-12 my-lg-3" id="change-select-promotion">
                                <select class="form-select ps-2 py-1 custom-input" name="promotion" id="input-promotion">
                                    <option value="2AFI">BUT R&T 2 FI</option>
                                    <option value="2AFA">BUT R&T 2 FA</option>
                                    <option value="CART">Licence professionnelle CART</option>
                                    <option value="RIMS">Licence professionnelle RIMS</option>
                                    <option value="TSSR">Licence professionnelle TSSR</option>
                                </select>
                            </div>
                        </div>

                        <!-- Selection de la promotion pour les anciens étudiants -->
                        <div class="row" id="change-select-oldpromotion">
                            <div class="col-12 mt-lg-3">
                                <select class="form-select ps-2 py-1 custom-input" name="oldpromotion">
                                    <option>Promotion 1990</option>
                                    <option>Promotion 1991</option>
                                    <option>Promotion 1992</option>
                                    <option>Promotion 1993</option>
                                    <option>Promotion 1994</option>
                                    <option>Promotion 1995</option>
                                    <option>Promotion 1996</option>
                                    <option>Promotion 1997</option>
                                    <option>Promotion 1997</option>
                                    <option>Promotion 1999</option>
                                    <option>Promotion 2000</option>
                                    <option>Promotion 2001</option>
                                    <option>Promotion 2002</option>
                                    <option>Promotion 2003</option>
                                    <option>Promotion 2004</option>
                                    <option>Promotion 2005</option>
                                    <option>Promotion 2006</option>
                                    <option>Promotion 2007</option>
                                    <option>Promotion 2008</option>
                                    <option>Promotion 2009</option>
                                    <option>Promotion 2010</option>
                                    <option>Promotion 2011</option>
                                    <option>Promotion 2012</option>
                                    <option>Promotion 2013</option>
                                    <option>Promotion 2014</option>
                                    <option>Promotion 2015</option>
                                    <option>Promotion 2016</option>
                                    <option>Promotion 2017</option>
                                    <option>Promotion 2018</option>
                                    <option>Promotion 2019</option>
                                    <option>Promotion 2020</option>
                                    <option>Promotion 2021</option>
                                    <option>Promotion 2022</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <div class="form-text text-justify px-2" id="change-help-oldpromotion">
                                    Les anciens élèves des promotions de 2003 et 2013 bénéficient d'une entrée gratuite.
                                </div>
                            </div>
                        </div>

                        <!-- Input entreprise pour les alternants, anciens eleves, autres  -->
                        <div class="row mt-1 mt-lg-0" id="change-input-entreprise">
                            <div class="col-12">
                                <input disabled type="text" class="form-control ps-2 py-1 custom-input" placeholder="Entreprise" name="entreprise" id="input-entreprise">
                            </div>
                            <div class="col-12">
                                <div class="form-text text-justify px-2" id="change-help-entreprise">
                                    Votre entreprise sera affiché dans la liste des participants
                                </div>
                            </div>
                        </div>

                        <!-- Boutons envoyer / revenir -->
                        <div class="row flex-center flex-column-reverse flex-lg-row mt-4 gap-2 gap-lg-3">
                            <button class="button bg-lightgrey py-2 px-5" type="button" onclick="location.reload()">Revenir</button>
                            <button class="button bg-blue py-2 px-5" onclick="secondContinue()">Continuer</button>
                        </div>
                    </div>
                </div>

                <!-- Deuxieme partie du formulaire ( checkboxs pour être affiché ou pas sur la carte, mot de passe, infos payement) -->
                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden px-4">
                    <div class="container-fluid">
                        <!-- Informations / Erreurs   -->
                        <!-- showError(['error-container-2','error-img-2',error_title_2,'error-text-2'],'missing_input')  -->
                        <div class="row flex-center" id="error-container-2">
                            <div class="col-lg-4 flex-center avatar-d-none">
                                <div class="avatar-md border-lightgrey my-2">
                                    <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img" id="error-img-2">
                                </div>
                            </div>

                            <div class="col-lg-8 d-flex align-items-center align-items-lg-start flex-column">
                                <p class="text-information fw-bold mb-3" id="error-title-2">
                                    <script>
                                        const error_title_2 = new Typewriter('#error-title-2', {});
                                        error_title_2
                                            .typeString("Une derniere étape!")
                                            .start()
                                    </script>
                                </p>
                                <p class="inscription-info-text" id="error-text-2">
                                    Il ne vous reste plus qu'à cocher quelques cases et choisir un mot de passe
                                    assez robuste pour que personne puisse vous voler votre place à la cérémonie!
                                </p>
                            </div>
                        </div>

                        <!-- Checkbox si affiché dans la liste des participants -->
                        <div class="row mt-4 mb-1 align-items-center">
                            <div class="col-lg-12">
                                <div class="form-check d-flex align-items-center">
                                    <input type="hidden" value=false name="displayed_in_list">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true name="displayed_in_list" id="ListVisibilityCheck">
                                    <label class="form-check-label ms-2 text-complementary" for="ListVisibilityCheck" id="label-ListVisibilityCheck">
                                        Je souhaite apparaître dans la liste des participants
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Checkbox si affiché sur la carte, pour les élèves en alternance, les anciens eleves et les "autres" -->
                        <div class="row mb-1 align-items-center" id="change-check-map">
                            <div class="col-lg-12">
                                <div class="form-check d-flex align-items-center">
                                    <input type="hidden" value=false name="displayed_on_map">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true name="displayed_on_map" id="MapVisibilityCheck">
                                    <label class="form-check-label ms-2 text-complementary" for="MapVisibilityCheck" id="label-MapVisibilityCheck">
                                        Je souhaite faire apparaître l'endroit où je travaille sur la carte
                                    </label>
                                </div>
                            </div>

                        <!-- Choix de la ville à afficher sur la carte ( alternance ), à desactiver si check d'avant est désactivé -->
                            <div class="col-lg-12 mt-2">
                                <div class="input-group">
                                    <span class="input-group-text px-2 py-1 d-flex align-items-center">
                                        <img src="{$APP_URL}/assets/images/svg/pin.svg">
                                    </span>
                                    <input type="text" class="form-control ps-2 py-1 custom-input custom-input-border" placeholder="Rennes" name="city" disabled id="input-city">
                                </div>
                            </div>
                        </div>

                        <div class="row mt-lg-3 align-items-center" id="change-check-family">
                            <!-- Checkbox si parents viennent ou pas -->
                            <div class="col-lg-9">
                                <div class="form-check d-flex align-items-center">
                                    <input type="hidden" value=false name="family_comes">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true id="parentsCheck" name="family_comes">
                                    <label class="form-check-label my-2" for="parentsCheck">
                                        Ma famille participe à la cérémonie
                                    </label>
                                </div>
                            </div>

                            <!-- Select pour savoir le nombre de parents ( désactivé par défaut, 0 par défaut) -->
                            <div class="col-lg-3">
                                <select class="form-select ps-2 py-1 custom-input" name="parentscount" id="parentsSelect" disabled>
                                    <option value=1>1</option>
                                    <option value=2>2</option>
                                    <option value=3>3</option>
                                    <option value=4>4</option>
                                    <option value=5>5</option>
                                </select>
                            </div>
                        </div>

                        <!-- Texte aide pour les membres de famille.-->
                        <div class="row">
                            <p class="form-text text-justify px-2">
                                L'entrée pour les membres de famille est gratuite. <strong>Le nombre d'accompagnants est limité.</strong>
                            </p>
                        </div>

                        <!-- Mot de passe + Confirmation du mot de passe -->
                        <div class="row mt-3">
                            <div class="col-12 position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Mot de passe" name="password" id="input-password">
                            </div>
                            <div class="col-12">
                                <div class="form-text text-justify px-2">
                                    Entre 8 et 20 characteres ( c mael qui décid )
                                </div>
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-12 position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Confirmation du mot de passe" id="input-confirm_password" onpaste="return false">
                            </div>
                            <div class="col-12">
                                <div class="form-text text-justify px-2">
                                    Entre 8 et 20 characteres ( c mael qui décid )
                                </div>
                            </div>
                        </div>

                        <!-- Boutons envoyer / revenir -->
                        <div class="row flex-center flex-column-reverse flex-lg-row mt-4 gap-2 gap-lg-3">
                            <button class="button bg-lightgrey py-2 px-5" type="button" onclick="location.reload()">Revenir</button>
                            <input type="button" class="button bg-blue py-2 px-5" name="submit" value="S'inscrire">
                        </div>
                    </div>

                </div>
            </form>
        </div>

    </div>
</section>
