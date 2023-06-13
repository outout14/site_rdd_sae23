<!-- Modal photos -->
<div class="modal" id="gallery-modal">
    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window d-flex flex-column" id="gallery-window">
            
            <!-- Fermer -->
            <div class="d-flex justify-content-end my-4 mx-5"> 
                <button class="button bg-transparent hover-pointer" onclick="closeModal('gallery-modal')">
                    <i class="bi bi-x text-white fa-2x"></i>
                </button>
            </div>

            <div class="container-fluid h-100">
                <img src="" alt="gallery-modal-photo" id="gallery-modal-photo">
            </div>

            <!-- Navbar (telechargement)-->
            <nav class="fixed-bottom d-flex justify-content-end my-3 mx-5 gap-5">
                <a href="" download id="gallery-photo-download">
                    <button class="button bg-transparent hover-pointer">
                        <i class="bi bi-download fa-2x text-white"></i>
                    </button>
                </a>
            </nav>

        </div>
    </div>
</div>