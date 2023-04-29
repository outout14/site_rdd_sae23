<!-- Connection -->
<section id="connection-modal">

    <div id="connection-background"></div>

    <div class="window-container" id="connection-container">
        <div class="window overflow-hidden" id="connection-window">

            <div class="fixed-top d-flex justify-content-end mt-4 mx-5">    
                <button class="btn btn-close" onclick="closeModal()"></button>
            </div>
            
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="container-fluid">
                    <form action="/site_rdd_sae23/app/Views/auth/test.php" method="POST" class="connection-form">
                    <input type="hidden" name="actionType" value="login">
                    
                        <!-- Informations / Erreurs  -->
                        <div class="row d-flex justify-content-center align-items-center mb-5 gap-3" id="connection-error-container">
                            <div class="col-12 d-flex justify-content-center align-items-center my-2 my-lg-0">
                                <div class="avatar-sm">
                                    <img src="{$APP_URL}/assets/images/creators/creator_hello.png" alt="creator_hello" class="avatar-img" id="connection-error-img">
                                </div>
                            </div>
                            <div class="col-12 text-center px-0 px-lg-5 d-flex justify-content-center align-items-center flex-column">
                                <p class="fw-bolder general-info-text my-2" id="connection-typeit"></p>
                                <!-- A revoir si on ne peut pas faire ca avec un seul typeit, stackoverflow -->
                                <p class="fw-bolder general-info-text my-2 text-blue" id="connection-error-typeit"></p>
                                <p class="fw-bolder form-text" id="connection-error-text"></p>
                            </div>
                        </div>
    
                        <!-- Login -->
                        <div class="row d-flex justify-content-center align-items-center my-3 px-3 px-lg-5">
                            <input autocomplete="email" required type="email" class="form-control ps-2 py-1" placeholder="Adresse mail" name="email">
                        </div>
    
                        <!-- Mot de passe -->
                        <div class="row d-flex justify-content-center align-items-center my-3 px-3 px-lg-5">
                            <div class="col-12 position-relative">
                                <img src="{$APP_URL}/assets/images/svg/eyeslash.svg" alt="show-password" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input" placeholder="Mot de passe" name="password">
                            </div>
                            <div class="col-12 justify-content-end">
                                <!-- Mot de passe oublié? -->
                                <div class="form-text text-justify px-2 text-end">
                                    <span class="hover-pointer" onclick="connectionScroll('down')">Mot de passe oublié?</span>
                                </div>
                            </div>
                        </div>
    
                        <!-- Submit -->
                        <div class="row justify-content-center px-3 px-lg-5 my-3">
                            <input type="submit" class="button rounded-3 bg-blue text-white fw-bold py-2 px-3" name="submit" value="Se connecter">
                        </div>
    
                        <!-- Renvoi vers inscription -->
                        <div class="row d-flex justify-content-center align-items-center">
                            <p class="text-center">Vous n'avez pas de compte? <a href="{$APP_URL}/home/inscription/" class="text-blue">Inscrivez-vous.</a></p>
                        </div>
                    </form>
                </div> 
            </div>
            
            <div class="w-100" style="height: 100%;"></div>

            <div class="d-flex flex-column justify-content-center align-items-center h-100">
                <div class="container-fluid" id="password-reinitialise">
                    <form action="/site_rdd_sae23/app/Views/auth/test.php" method="POST" class="connection-form">
                    <input type="hidden" name="actionType" value="forgotPassword">

                        <div class="row justify-content-end mt-3 mx-5">    
                            <button class="btn btn-close" onclick="closeModal()"></button>
                        </div>

                        <!-- Informations / Erreurs  -->
                        <div class="row d-flex justify-content-center align-items-center mt-3 mb-5 gap-3">
                            <div class="col-12 col-lg-3 d-flex justify-content-center align-items-center my-2 my-lg-0">
                                <div class="avatar-sm">
                                    <img src="{$APP_URL}/assets/images/creators/creator_info.png" alt="creator_hello" class="avatar-img">
                                </div>
                            </div>
                            <div class="col-12 col-lg-6">
                                <p class="px-3 px-lg-0 text-justify">
                                    Si un compte est associé à cette adresse mail, vous allez recevoir un mail de recuperation afin de
                                    réinitialiser votre mot de passe.
                                </p>
                            </div>
                        </div>
    
                        <!-- Login -->
                        <div class="row d-flex justify-content-center align-items-center my-3 px-3 px-lg-5">
                            <div class="col-12">
                                <input autocomplete="email" required type="email" class="form-control ps-2 py-1" placeholder="Adresse mail" name="email">
                            </div>
                        </div>
    
                        <!-- Submit -->
                        <div class="row justify-content-center px-3 px-lg-5 mt-3">
                            <input type="submit" class="button rounded-3 bg-blue text-white fw-bold py-2 px-3" name="submit" value="Envoyer">
                        </div>

                        <div class="row text-center my-5">
                            <p class="form-text text-decoration-underline hover-pointer" onclick="connectionScroll('up')">Revenir en arrière</p>
                        </div>

                    </form>
                </div> 
            </div>

        </div>
    </div>
</section>