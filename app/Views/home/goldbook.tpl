<!DOCTYPE html>
<html lang="en">

{include file="./common/head.tpl"}

<body onload="goldbookScroll()">

    <!-- Navbar -->
    {include file="./common/navbar.tpl"}

    <!-- Affichage du chat -->
    <div class="container-fluid vh-100">
        <div class="row flex-center h-100">
            <div class="col-11 col-lg-5 mb-2 mb-lg-5 gap-4" id="goldbook-content">
                
                {foreach $goldbook as $message}
                <div class="goldbook-message-wrapper">

                    <!-- Bouton supprimer, à afficher seulement si c'est le message de l'utilisateur -->
                    <!-- <div class="dot hover-pointer p-1"><i class="bi bi-x-lg text-bonewhite"></i></div> -->

                    <div class="goldbook-name mx-lg-4">{$message->author->lastname} {$message->author->firstname}</div>
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
    <form action="{$APP_URL}/home/goldbook" method="post" class="position-fixed fixed-bottom container-fluid mb-3 mb-lg-4">
        <div class="row justify-content-center">
            <div class="col-11 col-lg-5 d-flex flex-column gap-1">
                <div class="d-flex justify-content-end pe-3 w-100">
                    <span class="text-bonewhite" id="goldbook-limit">0/150</span>
                </div>
                <div class="position-relative w-100">
                    <input class="form-control ps-3 pe-5 py-2 rounded-pill" maxlength="150" type="text" placeholder="Votre message.." name="message" id="goldbook-input">
                    <input class="me-2" type="button" value="&#x279C;" id="goldbook-submit" onclick="openModal('goldbook-submit-modal')">
                    <input type="text" placeholder="titre" name="titre">
                </div>
            </div>
        </div>

        <div class="modal" id="goldbook-submit-modal">
            <div class="modal-background"></div>
        
            <div class="window-container modal-container">
                <div class="window overflow-hidden modal-window px-4 h-auto">
                    
                    <!-- Fermer -->
                    <div class="d-flex justify-content-end"> 
                        <button class="button hover-pointer bg-transparent mt-3 me-2" type="button" onclick="closeModal('goldbook-submit-modal')">
                            <i class="bi bi-x fa-2x text-dark"></i>
                        </button>
                    </div>
        
                    <div class="container-fluid d-flex justify-content-center align-items-center flex-column py-3">
                        <p class="text-complementary mb-4 text-justify">
                            Vous ne pouvez écrire qu'une seule fois dans le livre d'or. Vous pouvez supprimer votre message à tout moment si vous
                            ne souhaitez plus qu'il apparaisse dans le livre d'or, ou alors si vous voulez en rediger un nouveau.<br>
                            Chaque message envoyé est soumis à une vérification par les administrateurs avant d'être visible.
                        </p>

                        <input class="button rounded-3 bg-blue text-white fw-bold h-100 w-auto px-5 py-2" type="submit" name="submit" value="Envoyer">                        
                    </div>
                </div>
            </div>
        </div>
        
    </form>

</body>
</html>
