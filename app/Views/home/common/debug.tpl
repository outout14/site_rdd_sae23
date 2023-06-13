<div class="position-fixed fixed-top text-danger" id="debug-container">11</div>


<script>
    let debug = document.getElementById("debug-container")

    let screenWidth = window.innerWidth;
    let screenHeight = window.innerHeight;

    debug.textContent = 'Hauteur de l\'écran:' + screenHeight + ', Largeur de l\'écran:' + screenWidth
</script>
