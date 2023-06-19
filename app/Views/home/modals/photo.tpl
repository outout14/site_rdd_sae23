<!-- Modal photos -->
<div class="modal" id="gallery-modal">
    <div class="modal-background"></div>

    <div class="window-container modal-container">
        <div class="window overflow-hidden modal-window d-flex justify-content-between align-items-center flex-column px-4 pb-4 pt-2" id="gallery-window">
            
            <div class="d-flex justify-content-end align-items-center w-100">
                <button class="button hover-pointer bg-transparent w-auto" onclick="closeModal('gallery-modal')">
                    <i class="bi bi-x fa-2x text-dark"></i>
                </button>
            </div>

            <div class="flex-center" id="photo-container">
                <img src="" alt="gallery-modal-photo" id="gallery-modal-photo">
            </div>

            <!-- Telecharger -->
            <div class="d-flex justify-content-end align-items-center w-100 my-2 mx-4 gap-4"> 
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