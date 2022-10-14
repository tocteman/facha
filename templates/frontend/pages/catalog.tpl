{include file="frontend/components/header.tpl" pageTitle="navigation.catalog"}

<div class="page page_catalog">


	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="navigation.catalog"}
	<h1>{translate key="navigation.catalog"}</h1>


  <div class="catalog-filter-area" v-scope="{ open: 'none' }">
    <div class="filter-area-picker">
      <button 
        :class="{ 'underlined': open === 'categories', 'faded': open !== 'categories' }"
        @click="{ open = 'categories'}"
      >
        Categorías +
      </button>
      <button
        :class="{ 'underlined': open === 'series', 'faded': open !== 'series' }"
        @click="{ open = 'series'}"
      >
      Series +
      </button>
    </div>

      {assign var="seriesList" value=DAORegistry::getDAO('SeriesDAO')->getByPressId(1)->toArray()}
    <div class="" 
        v-bind="{ 'shown': open === 'categories', 'hidden': open !== 'categories' }"
    >
    <div class="catalog-categories">
      {foreach from=$seriesList item=browseSeriesItem}
        <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="series" path=$browseSeriesItem->getPath()|escape}">
          <h4 class="series_{$browseSeriesItem->getId()}{if $browseBlockSelectedSeries == $browseSeriesItem->getPath() && $browseBlockSelectedSeries != ''} current{/if}">
      {$browseSeriesItem->getLocalizedTitle()|escape}
          </h4>
        </a>
      {/foreach}
    </div>

    </div>

    
    

    {assign var="categoriesList" value=DAORegistry::getDAO('CategoryDAO')->getByContextId(1)->toArray()}
    <div class="" 
        v-bind="{ 'shown': open === 'series', 'hidden': open !== 'series' }"
      >
      <div class="catalog-series">
        {foreach from=$categoriesList item="browseCategory"}
            <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$browseCategory->getPath()|escape}">
              <h4 class="category_{$browseCategory->getId()}{if $browseCategory->getParentId()} is_sub{/if}{if $browseBlockSelectedCategory == $browseCategory->getPath()} current{/if}">
              {$browseCategory->getLocalizedTitle()|escape}
              </h4>
            </a>
        {/foreach}
      </div>
  </div>
  </div>

    <hr class="catalog-filter-separator">

	<div class="monograph_count">
		{translate key="catalog.browseTitles" numTitles=$total}
	</div>

	{* No published titles *}
	{if !$publishedSubmissions|@count}
		<h2>
			{translate key="catalog.category.heading"}
		</h2>
		<p>{translate key="catalog.noTitles"}</p>

	{* Monograph List *}
	{else}
		{include file="frontend/components/monographList.tpl" monographs=$publishedSubmissions featured=$featuredMonographIds}

		{* Pagination *}
		{if $prevPage > 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="page" path=$prevPage}{/capture}
		{elseif $prevPage === 1}
			{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog"}{/capture}
		{/if}
		{if $nextPage}
			{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="page" path=$nextPage}{/capture}
		{/if}
		{include
			file="frontend/components/pagination.tpl"
			prevUrl=$prevUrl
			nextUrl=$nextUrl
			showingStart=$showingStart
			showingEnd=$showingEnd
			total=$total
		}
	{/if}

</div><!-- .page -->
{include file="frontend/components/footer.tpl"}
