<!DOCTYPE html>
<html lang="en">

{include file="../home/common/head.tpl"}

<body>

    <!-- Modal connexion -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="../home/common/navbar.tpl"}

    <section class="window-container background-wave-blue">
        <div class="window flex-center p-5" id="changepassword-window">
            <form action="{$APP_URL}/auth/forgotPassword" method="post" id="new_password_form">
                <input type="hidden" name="actionType" value="newPassword"> 
            
                <div class="container-fluid">   
                    
                    <!-- Informations / Erreurs   -->
                    <!-- showError(['error-container','error-img',error_title,'error-text'], 'missing_input') -->
                    <div class="row flex-center" id="new_password_error_container">
                        <div class="col-lg-4 flex-center">
                            <div class="avatar-sm border-blue mb-4 mb-lg-0">
                              <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img" id="new_password_error_image">
                            </div>
                        </div>

                      <div class="col-12 flex-center flex-column">
                        <p class="text-information fw-bold mb-3" id="new_password_error_title"></p>
                        <p class="text-complementary text-justify" id="new_password_error_text"></p>
                      </div>

                        <div class="col-lg-8 d-flex align-items-center align-items-lg-start flex-column">
                            <p class="text-information fw-bold mb-3" id="error-title">
                              <script>
                                const new_password_typeWriter = new Typewriter('#error-title', {});
                                new_password_typeWriter
                                  .typeString('Trou de mémoire ?')
                                  .start()
                              </script>
                            </p>
                            <p class="text-complementary text-justify" id="error-text">
                                Choisissez un nouveau mot de passe pour votre compte.
                            </p>
                        </div>
                    </div>

                    <!-- Mot de passe + Confirmation du mot de passe -->
                    <div class="row mt-5">
                        <div class="col-12 position-relative">
                            <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                            <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Mot de passe" name="password">
                        </div>
                        <div class="col-12">
                            <div class="form-text text-justify px-2">
                              Entre 8 et 20 caractères
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2">
                        <div class="col-12 position-relative">
                            <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                            <input type="password" class="form-control ps-2 py-1 password-input custom-input" placeholder="Confirmation du mot de passe" onpaste="return false" name="password_confirm">
                        </div>
                    </div>

                    <input type="text" hidden="hidden" name="token" value="{$token}">
                    <div class="row justify-content-center">
                        <input type="submit" class="button bg-blue py-2 px-5 mt-3" value="Changer de mot de passe">
                    </div>
                </div>
            </form>
        </div>
    </section>

    <script src="{$APP_URL}/assets/js/ajaxLogin.js"></script>
    <script src="https://js.hcaptcha.com/1/api.js?hl=fr" async defer></script>
</body>
</html>
