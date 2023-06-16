<section class="flex-center flex-column bg-bonewhite" id="staff-container">

    <!-- Titre -->
    <h1 class="text-title">Organisateurs et sponsors</h1>

    <!-- Organisateurs -->
    <div id="organisator-container">
        <div id="organisator-wrapper-fade"></div>
        <div id="organisator-animation-wrapper">
          {for $i=0 to 1}
            {foreach from=$creators key=$key item=$creator}
              <div class="organisator-wrapper">
                <div class="avatar-lg">
                  <a href="https://{$creator["link"]}" target="_blank">
                    <img src="{$APP_URL}/assets/images/creators/creator_{$creator["firstname"]|lower}.png" alt="{$creator["firstname"]}" class="avatar-img">
                  </a>
                </div>

                <div class="organisator-description mt-1">
                  <p class="text-center fw-bold">{$creator["firstname"]} {$creator["lastname"]}</p>
                  <div class="separation-bar-sm m-auto bg-dark"></div>
                  <p class="text-center fw-bold">{$creator["task"]}</p>
                </div>
              </div>
            {/foreach}
          {/for}
        </div>
    </div>

    <!-- Barre de separation -->
    <div class="separation-bar-lg bg-dark"></div>

    <!-- Sponsors -->
    <div class="my-2 my-lg-5 container" id="sponsor-container">
        <div class="row">
          {foreach from=$sponsors key=$key item=$sponsor}
          <div class="col d-flex justify-content-center align-items-center">
            <a href="{$sponsor['link']}" target="_blank"><img src="{$APP_URL}/assets/images/sponsors/{$sponsor["name"]|lower}.png" alt="{$sponsor['name']}" class="sponsor-img"></a>
          </div>
          {/foreach}
        </div>
    </div>

</section>
