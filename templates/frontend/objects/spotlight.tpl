<div class="obj_spotlight {$hasCoverImage} {$type}">


	<div class="spotlight-presentation-area">
    <div class="item cover caratula">
    {if $coverImage}
      <a class="cover_image" href="{$targetUrl}">
        <img alt="{$item->getLocalizedFullTitle()|strip_tags|escape|default:''}" src="{$coverImageUrl}">
      </a>
    {/if}
    </div>
    <div class="spotlight-written-presentation">
      <h5 class="spotlight-latest-release">
        Último Lanzamiento
      </h5>
      <h1 class="title" style="line-height:115%;">
        {$spotlight->getLocalizedTitle()|escape}
      </h1>
      {if $description}
      <div class="spotlight-description">
        {$description|strip_unsafe_html}
      </div>
      {/if}
      <a class="transparent" href="{$targetUrl}" title="{translate|escape key="common.readMoreWithTitle" title=$spotlight->getLocalizedTitle()}">
      <button class="main-btn transparent">
        Leer más
      </button>
      </a>
    </div>
	</div>
</div>

