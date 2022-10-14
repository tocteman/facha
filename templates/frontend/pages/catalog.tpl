{include file="frontend/components/header.tpl" pageTitle="navigation.catalog"}

<div class="page page_catalog">


	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="navigation.catalog"}
	<h1>{translate key="navigation.catalog"}</h1>


	{include file="frontend/components/catalogFilters.tpl"}

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
