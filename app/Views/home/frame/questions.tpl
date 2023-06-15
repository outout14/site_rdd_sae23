<section class="flex-center flex-column bg-darker" id="questions-container">
    
    <img class="wave" src="{$APP_URL}/assets/images/background/wave-bottom.svg" alt="wave">

    <!-- Titre -->
    <h1 class="text-title text-bonewhite">
        Vous avez manqué quelque chose?
    </h1>

    <div class="flex-center flex-column" id="questions-box">
        <div class="container-fluid">
            <div class="row justify-content-center pb-5">
                <div class="col-12 col-lg-5 me-lg-5">
                    <form action="{$APP_URL}/contact/sendMessage" method="POST" id="contact_form">
                        <input type="hidden" name="actionType" value="sendMessage">
                        
                        <div class="container-fluid">
                            <div class="row py-3 justify-content-around">
                                
                                <!-- Adresse Mail ( obligatoire ) + Submit -->
                                <div class="col-12 col-lg-4 d-flex flex-row flex-lg-column justify-content-center align-items-center gap-3">
                                    <input required type="email" class="ps-2 py-1 m-2 questions-input" placeholder="Adresse e-mail" name="email" id="input-questions-email">
                                    <input type="submit" class="button rounded-pill bg-bonewhite text-dark fw-bold py-2 px-3 mt-0 mt-lg-3 d-none d-lg-flex" value="Envoyer">
                                </div>

                                <!-- Texterea -->
                                <div class="col-lg-6 my-2 my-lg-0">
                                    <textarea required class="px-3 py-2 questions-input" id="input-questions-textarea" name="message" placeholder="Je me demandais si..."></textarea>
                                </div>

                            <div class="col-12 my-2 d-lg-none">
                                <input type="submit" class="button rounded-pill bg-bonewhite text-dark fw-bold py-2 px-3 mt-0 mt-lg-3 w-100" name="ERROR" value="Envoyer">
                            </div>

                            <!-- Captcha -->
                            <div class="d-flex justify-content-center pt-4">
                                <div
                                    class="h-captcha"
                                    data-sitekey="{$HCAPTCHA_SITEKEY}"
                                    data-theme="dark"
                                ></div>
                            </div>

                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-12 col-lg-4 ms-0 ms-lg-5 flex-center">
                    <p class="text-information text-bonewhite">
                        Nous restons bien évidemment disponibles pour répondre à toutes
                        sortes de questions. Si vous rencontrez des problèmes lors de l'utilisation
                        du site, merci de nous en informer via ce formulaire.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="d-flex justify-content-center align-items-center bg-darker pb-4">
    <a href="{$APP_URL}/assets/mentionslegales.pdf" class="text-complementary text-bonewhite" download="mentionslegales.pdf">
        Tous droits réservés © Génération R&T 2023
    </a>
</section>
