<!-- Connection -->

<section class="modal" id="connection-modal">

    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window" id="connection-window">

            <div class="fixed-top d-flex justify-content-end mt-4 mx-5">    
                <button class="btn btn-close" onclick="closeModal('connection-modal')"></button>
            </div>
            
            <div class="flex-center h-100">
                <div class="container-fluid">
                    <form action="{$APP_URL}/auth/login" method="POST" class="connection-form" id="login_form">
                    <input type="hidden" name="actionType" value="login">

                        <!-- Informations / Erreurs   -->
                        <div class="row flex-center mb-5 gap-3" id="login_error_container">
                            <div class="col-12 flex-center">
                                <div class="avatar-sm border-white mb-4 mb-lg-0">
                                    <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img" id="login_error_image">
                                </div>
                            </div>

                            <div class="col-12 flex-center flex-column">
                                <p class="text-information fw-bold mb-3" id="login_error_title"></p>
                                <p class="text-complementary text-justify" id="login_error_text"></p>
                            </div>

                            <script>
                                const login_typeWriter = new Typewriter('#login_error_title', {});
                                login_typeWriter
                                    .typeString('Content de vous revoir!')
                                    .start()
                            </script>
                        </div>
    
                        <!-- Login -->
                        <div class="row flex-center my-3 px-3 px-lg-5">
                            <input autocomplete="email" required type="email" class="form-control ps-2 py-1" placeholder="Adresse mail" name="email">
                        </div>
    
                        <!-- Mot de passe -->
                        <div class="row flex-center my-3 px-3 px-lg-5">
                            <div class="col-12 position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input" placeholder="Mot de passe" name="password" id="input-password">
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
                            <button class="button rounded-3 bg-blue text-white fw-bold py-2 px-3">Se connecter</button>
                        </div>
    
                        <!-- Renvoi vers inscription -->
                        <div class="row flex-center">
                            <p class="text-center">Vous n'avez pas de compte? <a href="{$APP_URL}/home/register" class="text-blue">Inscrivez-vous.</a></p>
                        </div>
                    </form>
                </div> 
            </div>
            
            <div class="w-100" style="height: 100%;"></div>

            <div class="d-flex flex-column justify-content-center align-items-center h-100">
                <div class="container-fluid" id="password-reinitialise">
                    <form action="{$APP_URL}/auth/askResetPassword" method="POST" class="connection-form" id="forgot_password_form">
                        <input type="hidden" name="actionType" value="forgotPassword">

                        <div class="row justify-content-end mt-3 mx-5">    
                            <button class="btn btn-close" onclick="closeModal('connection-modal')"></button>
                        </div>

                        <!-- Informations / Erreurs   -->
                        <div class="row flex-center mb-5 gap-3" id="forgot_password_error_container">
                            <div class="col-12 flex-center">
                                <div class="avatar-sm border-white mb-4 mb-lg-0">
                                    <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img" id="forgot_password_error_image">
                                </div>
                            </div>

                            <div class="col-12 col-lg-9 flex-center flex-column">
                                <p class="text-information fw-bold mb-3" id="forgot_password_error_title"></p>
                                <p class="text-complementary text-justify " id="forgot_password_error_text">
                                    Si un compte est associé à cette adresse mail, vous allez recevoir un mail de 
                                    recuperation afin de réinitialiser votre mot de passe.
                                </p>
                            </div>

                            <script>
                                const forgot_password_typeWriter= new Typewriter('#forgot_password_error_title', {});
                                forgot_password_typeWriter
                                    .typeString('Content de vous revoir!')
                                    .start()
                            </script>
                        </div>
                        
                        <!-- Login -->
                        <div class="row flex-center my-3 px-3 px-lg-5">
                            <div class="col-12">
                                <input autocomplete="email" required type="email" class="form-control ps-2 py-1" placeholder="Adresse mail" name="email">
                            </div>
                        </div>
    
                        <!-- Submit -->
                        <div class="row justify-content-center px-3 px-lg-5 mt-3">
                            <input type="submit" class="button rounded-3 bg-blue text-white fw-bold py-2 px-3" value="Envoyer">
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
