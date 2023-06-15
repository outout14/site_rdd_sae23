<div class="modal" id="gallery-modal">
    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window d-flex flex-column" id="gallery-window">
            
            <!-- Fermer -->
            <div class="fixed-top d-flex justify-content-end my-4 mx-5"> 
                <button class="button bg-transparent hover-pointer" onclick="closeModal('gallery-modal')">
                    <i class="bi bi-x text-white fa-2x"></i>
                </button>
            </div>

            <div class="container-fluid h-100">
                <div class="card-deck">
                    <div class="card">
                        <img class="card-img-top" src="./images/background/main.png" alt="gallery-modal-photo">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <button class="btn btn-danger">Supprimer</button>
                                <button class="btn btn-success">Valider</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Ajouter plus de cartes ici -->

                    <div class="card">
                        <img class="card-img-top" src="{$APP_URL}/assets/images/gallery/missing.png" alt="gallery-modal-photo">
                        <div class="card-body">
                            <div class="d-flex justify-content-between">
                                <button class="btn btn-danger">Supprimer</button>
                                <button class="btn btn-success">Valider</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Navbar ( like et telechargement )-->
            <nav class="fixed-bottom d-flex justify-content-end my-3 mx-5 gap-5">
                <button class="button bg-transparent hover-pointer" onclick="console.log('gallery-warning')">
                    <i class="bi bi-exclamation-triangle fa-2x text-white"></i>
                </button>

                <button class="button bg-transparent hover-pointer" onclick="console.log('gallery-download')">
                    <i class="bi bi-download fa-2x text-white"></i>
                </button>

                <button class="button bg-transparent hover-pointer" onclick="console.log('gallery-heart')">
                    <i class="bi bi-heart fa-2x text-white"></i>
                </button>
            </nav>

        </div>
    </div>
</div>
