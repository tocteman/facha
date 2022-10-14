{include file="frontend/components/header.tpl" pageTitle="common.search"}

<div class="page page_search">

	{* Breadcrumb *}
	{include file="frontend/components/breadcrumbs.tpl" type="category" currentTitleKey="common.search"}
	<h1>{translate key="common.search"}</h1>
	<div class="monograph_count">
		{translate key="catalog.browseTitles" numTitles=$results->getCount()}
	</div>


	<a name="search-form"></a>
	{include file="frontend/components/searchForm_simple.tpl"}

	{* No query - this may happen because of a screen reader, so don't show an
	   error, just leave them with the search form *}
	{if $searchQuery == '' }

	{* No published titles *}

	{elseif $results->getCount() == 0}
		<div class="search_results" role="status">
			{translate key="catalog.noTitlesSearch" searchQuery=$searchQuery|escape}
			<a href="#search-form">
				{translate key="search.searchAgain"}
			</a>
		</div>

	{* Monograph List *}
	{else}
		<div class="search_results" role="status">
		</div>
		<div class="cmp_monographs_list summary-grid">
			{iterate from=results item=result}
					{include file="frontend/objects/monograph_summary.tpl" monograph=$result.publishedSubmission press=$result.press heading="h2"}
			{/iterate}
		</div>
		<div class="cmp_pagination">
			{page_info iterator=$results}
			{page_links anchor="results" iterator=$results name="search" query=$searchQuery}
		</div>
	{/if}


</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
