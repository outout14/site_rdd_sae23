
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
            <input type="hidden" name="phonenumber" value="0000000000">
            <!-- <input type="hidden" name="promotion" value="-"> -->

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
                                <p class="inscription-info-text d-none d-lg-block" id="register_1_error_text">
                                    Nous avons besoin des informations suivantes pour pouvoir vous inscrire.
                                    Ne vous inquiétez pas, cela ne prendra pas beaucoup de temps.
                                </p>
                            </div>
                        </div>

                        <!-- Checkbox si affiché dans la liste des participants -->
                        <div class="row mt-1 align-items-center">
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


                        <!-- Nom + Prenom -->
                        <div class="row mt-2 gap-lg-2">
                            <div class="col-12 col-lg">
                                <input autocomplete="given-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Nom" name="lastname" id="input-lastname">
                            </div>

                            <div class="col-12 col-lg mt-1 mt-lg-0">
                                <input autocomplete="family-name" type="text" class="form-control ps-2 py-1 custom-input" placeholder="Prenom" name="firstname" id="input-firstname">
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="row mt-1">
                            <div class="col-12">
                                <input autocomplete="email" type="email" class="form-control ps-2 py-1 custom-input" placeholder="Adresse mail" name="email" id="input-email">
                            </div>
                        </div>

                        <!--  Promotion + entreprise -->
                        <div class="row mt-1 gap-2">

                            <div class="col d-none" id="container-promotion">
                                <select class="form-select ps-2 py-1" name="promotion" id="input-promotion" disabled>
                                    <option value="2AFI">BUT R&T 2 FI</option>
                                    <option value="2AFA">BUT R&T 2 FA</option>
                                    <option value="CART">Licence professionnelle CART</option>
                                    <option value="RIMS">Licence professionnelle RIMS</option>
                                    <option value="TSSR">Licence professionnelle TSSR</option>
                                </select>
                            </div>

                            <div class="col d-none" id="container-oldpromotion">
                                <div class="col-12">
                                    <select disabled class="form-select ps-2 py-1 custom-input" name="oldpromotion" id="input-oldpromotion" disabled>
                                        <option value="1990">Promotion 1990</option>
                                        <option value="1991">Promotion 1991</option>
                                        <option value="1992">Promotion 1992</option>
                                        <option value="1993">Promotion 1993</option>
                                        <option value="1994">Promotion 1994</option>
                                        <option value="1995">Promotion 1995</option>
                                        <option value="1996">Promotion 1996</option>
                                        <option value="1997">Promotion 1997</option>
                                        <option value="1998">Promotion 1998</option>
                                        <option value="1999">Promotion 1999</option>
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

                            <div class="col d-none" id="container-company">
                                <input type="text" class="form-control ps-2 py-1 custom-input" placeholder="Entreprise" name="company" id="input-company" disabled>
                            </div>
                        </div>

                        <!-- Checkbox si parents viennent ou pas -->
                        <div class="row mt-1 align-items-center d-none" id="container-family">
                            <div class="col-9">
                                <div class="form-check d-flex align-items-center">
                                    <input class="form-check-input custom-input mx-2" type="checkbox" value=true id="input-checkfamily" name="family_comes">
                                    <label class="form-check-label" for="input-checkfamily">
                                        Ma famille participe à la cérémonie
                                    </label>
                                </div>
                            </div>

                            <!-- Select pour savoir le nombre de parents ( désactivé par défaut, 0 par défaut) -->
                            <div class="col-3" id="container-countfamily">
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

                        <!-- Mot de passe + Confirmation du mot de passe -->
                        <div class="row flex-column flex-lg-row mt-4 mt-lg-3 gap-2">

                            <div class="col d-flex flex-column justify-content-between">
                                <div class="col-12 col-lg position-relative">
                                    <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                    <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Mot de passe" name="password" id="input-password-register">
                                </div>
    
                                <div class="col-12 col-lg mt-2 position-relative">
                                    <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                    <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Confirmation du mot de passe" name="confirmpassword" id="input-confirmpassword-register">
                                </div>
                            </div>

                            <!-- Captcha -->
                            <div class="col flex-center">
                                <div
                                    class="h-captcha"
                                    id="h-captcha-register"
                                    data-sitekey="{$HCAPTCHA_SITEKEY}"
                                ></div>
                            </div>
                            
                        </div>

                        <!-- Boutons envoyer / revenir -->
                        <div class="row flex-center flex-column-reverse flex-lg-row gap-2 gap-lg-3 mt-4">
                            <button class="button bg-lightgrey py-2 px-5" type="button" onclick="location.reload()">Revenir</button>
                            <input type="submit" class="button bg-blue py-2 px-5" name="submit" value="S'inscrire" id="register_form_submit">
                        </div>
                    </div>
                </div>

                <div class="row flex-column h-100 justify-content-center align-items-center overflow-hidden">
                    <div class="flex-center flex-column">
                        <img src="{$APP_URL}/assets/images/svg/check.svg" alt="Check">
                        <h1 class="fw-bold pt-2 text-center">Votre inscription est presque finie!</h1>
                        <p class="pt-4 px-2 px-lg-5 mx-0 mx-lg-5 text-information">
                            Un email de confirmation a été énvoyé sur l'adresse mail que vous avez renseigné.
                            Pour finir votre inscription, vous devez le consulter et confirmer votre compte.
                            <span class="fw-bold">Pensez à vérifier vos spams.</span>
                        </p>
                        <div class="flex-center mt-5">
                            <h6 class="text-secondary">
                                Vous allez être redirigez vers la page d'accueil dans 10 secondes.
                            </h6>
                            <div class="spinner-grow spinner-grow-sm text-success ms-2" role="status">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
