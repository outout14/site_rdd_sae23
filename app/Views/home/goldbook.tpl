<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body onload="goldbookScroll()">

    <!-- Navbar -->
    {include file="./modals/login.tpl"}

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Affichage du chat -->
    <div class="container-fluid vh-100">
        <div class="row flex-center h-100">
            <div class="col-11 col-lg-6 mb-2 mb-lg-5 gap-3" id="goldbook-content">
                
                {foreach $goldbook as $message}
                <div class="goldbook-message-wrapper">

                    <!-- Bouton supprimer, à afficher seulement si c'est le message de l'utilisateur -->
                    <!-- <div class="dot hover-pointer p-1" style="z-index: 10;"><i class="bi bi-x-lg text-bonewhite"></i></div> -->

                    <div class="goldbook-name mx-lg-4">{$message->author->lastname|upper} {$message->author->firstname|capitalize}</div>
                    <div class="goldbook-message">
                        {$message->content}
                    </div>
                    <div class="goldbook-date mx-lg-2">{$message->date}</div>
                </div>
                {/foreach}

            </div>
        </div>
    </div>

    <!-- Input -->
    <section class="position-fixed fixed-bottom mb-3 mb-lg-4">

        <div class="flex-center d-none" id="goldbook-alert-wrapper">
            <div class="goldbook-message" id="goldbook-alert">
                
            </div>
        </div>

        <form action="{$APP_URL}/home/goldbook" method="post" class="container-fluid d-none" id="goldbook-input-wrapper">
            <fieldset>
                <div class="row justify-content-center">
                    <div class="col-11 col-lg-5 d-flex flex-column gap-1">
                        <div class="d-flex justify-content-end pe-3 w-100">
                            <span class="text-bonewhite" id="goldbook-limit">0/150</span>
                        </div>
                        <div class="position-relative w-100">
                            <input class="form-control ps-3 pe-5 py-2 rounded-pill" maxlength="150" type="text" placeholder="Votre message.." name="message" id="goldbook-input">
                            <input type="submit" class="me-2" type="button" name="sbmt" value="&#x279C;" id="goldbook-submit">
                        </div>
                    </div>
                </div>

                <div class="modal" id="goldbook-submit-modal">
                    <div class="modal-background"></div>
                
                    <div class="window-container modal-container">
                        <div class="window overflow-hidden modal-window px-4 h-auto">
                            
                            <!-- Fermer -->
                            <div class="d-flex justify-content-end align-items-center w-100">
                                <button class="button hover-pointer bg-transparent w-auto" onclick="closeModal('goldbook-submit-modal')">
                                    <i class="bi bi-x fa-2x text-dark"></i>
                                </button>
                            </div>
                
                            <div class="container-fluid d-flex justify-content-center align-items-center flex-column py-3">
                                <p class="text-complementary mb-4 text-justify">
                                    Vous ne pouvez écrire qu'une seule fois dans le livre d'or. Vous pouvez supprimer votre message à tout moment si vous
                                    ne souhaitez plus qu'il apparaisse dans le livre d'or, ou alors si vous voulez en rediger un nouveau.<br>
                                    Chaque message envoyé est soumis à une vérification par les administrateurs avant d'être visible.
                                </p>

                                <input type="button" class="button rounded-3 bg-blue text-white fw-bold h-100 w-auto px-5 py-2" value="Envoyer" id="goldbook-pseudo-submit">                        
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>

            <script>
                if("{$already_sent_message}" == "notsent") {
                    // Afficher input
                    document.getElementById("goldbook-alert-wrapper").classList.add("d-none")
                    document.getElementById("goldbook-input-wrapper").classList.remove("d-none")
                } 
                else if("{$already_sent_message}" == "sent"){
                    // Afficher alert déjà envoyé message
                    document.getElementById("goldbook-alert").innerHTML = "Vous avez déjà envoyé un message dans le livre d'or.";
                    document.getElementById("goldbook-alert-wrapper").classList.remove("d-none")
                    document.getElementById("goldbook-input-wrapper").classList.add("d-none")
                }else if("{$already_sent_message}" == "unvalid"){
                    // Afficher alert déjà envoyé message
                    document.getElementById("goldbook-alert").innerHTML = "Votre message est en cours de validation";
                    document.getElementById("goldbook-alert-wrapper").classList.remove("d-none")
                    document.getElementById("goldbook-input-wrapper").classList.add("d-none")
                } else {
                    // Afficher alert erreur
                    document.getElementById("goldbook-alert").innerHTML = "Une erreur est survenue.";
                    document.getElementById("goldbook-alert-wrapper").classList.remove("d-none")
                    document.getElementById("goldbook-input-wrapper").classList.add("d-none")
                }
            </script>
            
        </form>
    </section>

    <!-- Javascript -->
    {include file="./frame/javascript.tpl"}
    
</body>
</html>
