<div class="modal" id="ticket-modal">

    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window px-4 pb-4 pt-2" id="ticket-window">
            
            <!-- Fermer -->
            <div class="d-flex justify-content-between flex-column h-100">

                <div class="d-flex justify-content-end align-items-center w-100">
                    <button class="button hover-pointer bg-transparent w-auto" onclick="closeModal('ticket-modal')">
                        <i class="bi bi-x fa-2x text-dark"></i>
                    </button>
                </div>

                <div class="flex-center flex-column">
                    <div class="avatar-md border-blue mb-2">
                        <img src="{$APP_URL}/assets/images/creators/creator_whisper.png" alt="creator_whisper" class="avatar-img">
                    </div>
    
                    <div class="flex-center mt-2 mb-2 px-lg-4 px-2" id="payement_title_wrapper">
                        <h3 class="fw-bold text-center" id="payement_title"></h3>
                    </div>
    
                    <script>
                        const register_title = new Typewriter('#payement_title', {
                            strings: 'Oublies pas de réserver ta place pour la RDD!',
                            autoStart: true,
                            loop: true,                       
                        });
                    </script>
    
                    <p class="text-complementary px-2 mb-4">
                        Le prix de la participation à la cérémonie de remise des diplômes est de 30€.
                        Afin d'acheter votre ticket, vous pouvez vous rendre dans votre espace personnel,
                        où vous trouverez le lien qui redirige vers la cagnotte HelloAsso.<br><br>
                        Merci d'utiliser les mêmes nom, prénom et email lors de votre inscription,
                        pour que les administrateurs puissent vérifier votre inscription.
                    </p>
    
                    <a href="https://www.helloasso.com/associations/generation-r-t/evenements/remise-des-diplomes">
                        <button type="button" class="button rounded-3 bg-blue text-white fw-bold py-2 px-5">Cagnotte HelloAsso</button>
                    </a>    
                </div>

                <div class="w-auto my-2">
                </div>
            </div>
        </div>
    </div>
</div>