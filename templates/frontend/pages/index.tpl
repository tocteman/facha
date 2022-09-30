{include file="frontend/components/header.tpl"}

<div class="page homepage">

	{* Homepage Image *}
	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
	{/if}

    <div class="book-olitas">
      <img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/olitas.png" alt="">
    </div>
	{* Spotlights *}
	{if !empty($spotlights)}
    <div class="spotlight-container">
		{include file="frontend/components/spotlights.tpl"}
    </div>
	{/if}


	{* Featured *}
  <div class="featured-releases-container">
	{if !empty($featuredMonographs)}
   <h1>Destacados</h1>
 <div class="catalog-index-link">
        <button class="main-btn">
          <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog"}">
            <h3>
              Catálogo Completo
            </h3>
          </a>
        </button>
      </div>
    		{include file="frontend/components/monographList.tpl" monographs=$featuredMonographs titleKey="catalog.featured"}

	{/if}
  </div>

	{* New releases *}
	{if !empty($newReleases)}
  <div class="new-releases-outer-container">
    <div class="new-releases-inner-container">
      <h1>Nuevos Lanzamientos</h1>
      {include file="frontend/components/monographList.tpl" monographs=$newReleases titleKey="catalog.newReleases"}
      <div class="catalog-index-link">
        <button class="main-btn">
          <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog"}">
            <h3>
              Catálogo Completo
            </h3>
          </a>
        </button>
      </div>
    </div>
  </div>
	{/if}

  <div>
		{include file="frontend/components/resources.tpl"}
  </div>

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}

</div>
{include file="frontend/components/footer.tpl"}

