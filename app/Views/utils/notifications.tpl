{if isset($notification)}
<div class="py-2 py-lg-3 px-2 px-lg-4 gap-lg-3" id="notification-wrapper">

  <div class="fixed-top d-flex justify-content-end mt-2 mx-3">    
    <i class="bi bi-x-lg hover-pointer" id="closeNotificationButton"></i>
  </div>
  <div class="avatar-xs">
    <img src="{$APP_URL}/assets/images/creators/creator_pc.png" alt="creator_message" class="avatar-img">
  </div>
  <div class="text-complementary">
    {$notification}
  </div>
</div>
{/if}
