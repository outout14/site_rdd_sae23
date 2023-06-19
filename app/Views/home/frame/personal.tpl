<section class="window-container" id="personal-container">

    <div class="window d-flex align-items-center flex-column h-auto">
        <div class="mt-3 ps-lg-5 ps-3 dot-header">
            <span class="dot bg-danger"></span>
            <span class="dot bg-warning"></span>
            <span class="dot bg-success"></span>
            <h4 class="text-information fw-bold ms-3">{$currentPage}</h4>
        </div>

        <!-- Content -->
      <form action="{$APP_URL}/home/personalspace/update" method="POST" class="h-100 w-100 my-0 my-lg-5">
            <div class="container-fluid h-100 w-100 px-0 px-lg-5">
                <div class="row justify-content-between pt-2 p-lg-5 h-100">

                    <div class="col-12 col-lg flex-center flex-column gap-4 vh-100-sm">
                        <div class="d-flex justify-content-center align-items-center mt-2 gap-5">
                            <div class="avatar-sm border-lightgrey">
                                <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_pc" class="avatar-img">
                            </div>

                            <h2 class="fw-bold">{$sessionUser->firstname|capitalize} {$sessionUser->lastname|capitalize} </h2>
                        </div>

                        <p class="text-complementary col-11 col-lg-9">
                            Bienvenue dans ton espace personnel! Ici, tu pourras indiquer si tu souhaites être affiché dans la liste des participents,
                            ainsi que changer ton mot de passe ou encore consulter ton ticket pour la RDD!
                        </p>

                      <div class="col-11 col-lg-9 form-check d-flex align-items-center">
                          <input class="form-check-input custom-input mx-2" type="checkbox" value=true name="displayed_in_list" id="ListVisibilityCheck" {if $sessionUser->display_in_list == 1}checked="on"{/if}>
                            <label class="form-check-label ms-2 text-complementary" for="ListVisibilityCheck" id="label-ListVisibilityCheck">
                              Je souhaite apparaître dans la liste des participants
                            </label>
                        </div>

                        <div class="col-11 col-lg-9 d-flex flex-column gap-3">
                            <div class="position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input w-100" placeholder="Mot de passe" name="password" id="input-password-register">
                            </div>

                            <div class="position-relative">
                                <img src="{$APP_URL}/assets/images/svg/password-hidden.svg" class="password-input-icon">
                                <input type="password" class="form-control ps-2 py-1 password-input custom-input w-100" placeholder="Confirmation du mot de passe" id="input-confirm_password" onpaste="return false" name="confirmpassword">
                            </div>
                        </div>

                        <div class="col-11 col-lg-9 flex-center">
                            <input type="submit" class="button bg-blue py-2 px-5" name="submit" value="Appliquer les modifications">
                        </div>

                        <div class="flex-center d-flex d-lg-none pt-3*">
                            <img class="up-and-down" src="{$APP_URL}/assets/images/svg/downarrow.svg" alt="down-arrow">
                        </div>
                    </div>

                    <div class="col-12 col-lg flex-center flex-column py-2 gap-4 mt-5 mt-lg-0" id="personal-separation">
                        <div class="avatar-sm border-lightgrey mb-2">
                            <img src="{$APP_URL}/assets/images/creators/creator_whisper.png" alt="creator_whisper" class="avatar-img">
                        </div>

                        <h3 class="fw-bold mb-4" id="payement_title"></h3>

                        <script>
                            const register_title = new Typewriter('#payement_title', {
                                strings: 'Hey, psss! Ton ticket c\'est par ici.',
                                autoStart: true,
                                loop: true,                       
                            });
                        </script>

                        {if $sessionUser->has_paid == 1}

                        <!-- Non payé -->
                        <p class="text-complementary col-11 col-lg-9">
                            Le prix de la participation à la cérémonie des remise des diplômes est de <span class="fw-bold">30€</span>.<br><br>
                            Une fois le règlement effectué, vous recevrez un e-mail avec votre ticket,
                            que vous devrez presenter aux organisateurs le jour J.<br>
                        </p>

                        <div class="col-11 flex-center mb-3">
                            <a href="https://www.helloasso.com/associations/generation-r-t/evenements/remise-des-diplomes" class="button bg-blue py-2 px-5">Passer au règlement</a>
                        </div>
                        {else}
                        <!-- Payé -->
                        <p class="text-complementary col-11 col-lg-9">
                            Merci pour ta participation! Si jamais tu as perdu ton ticket, tu peux cliquer sur le bouton
                            ci-dessous pour revenir dans ton espace HelloAsso <br><br>
                            À très bientôt!
                        </p>

                        <div class="col-11 flex-center mb-3">
                            <a href="https://www.helloasso.com/utilisateur/historique" class="button bg-blue py-2 px-5">Accéder à l'espace Hello Asso</a>
                        </div>
                        {/if}
                    </div>
                </div>
            </div>  
        </form>

    </div>
</section>
