{if isset($notification)}
<div class="w-75 m-auto mt-2">
  <div class="alert alert-{$notification.type}" role="alert">
      {$notification.message}
  </div>
</div>
{/if}
