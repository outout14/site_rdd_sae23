<!-- Modal photos -->
<div class="modal" id="gallery-modal">
    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window d-flex flex-column" id="gallery-window">
            
            <!-- Fermer -->
            <div class="d-flex justify-content-end my-2 mx-4"> 
                <button class="button bg-transparent hover-pointer" onclick="closeModal('gallery-modal')">
                    <i class="bi bi-x text-dark fa-2x"></i>
                </button>
            </div>

            <div class="container-fluid h-100">
                <img src="" alt="gallery-modal-photo" id="gallery-modal-photo">
            </div>

            <!-- Telecharger -->
            <div class="d-flex justify-content-end my-2 mx-4 gap-4"> 
                <a href="{$APP_URL}/home/#questions-container">
                    <i class="bi bi-exclamation-triangle fa-2x text-dark"></i>
                </a>
                <a href="" download id="gallery-photo-download">
                    <i class="bi bi-download fa-2x text-dark"></i>
                </a>
            </div>

        </div>
    </div>
</div>