{include file="frontend/components/header.tpl" pageTitleTranslated=$series->getLocalizedTitle()|escape}

<div class="page page_catalog_series">


  <div class="series-presentation">
    <h1 class="series-presentation-title">
      {$series->getLocalizedTitle()|escape}
    </h1>

	{* Image and description *}
	{assign var="image" value=$series->getImage()}
	{assign var="description" value=$series->getLocalizedDescription()|strip_unsafe_html}
	<div class="about_section{if $image} has_image{/if}{if $description} has_description{/if} series-presentation-description">
		<div class="description">
			{$description|strip_unsafe_html}
		</div>
		{if $series->getOnlineISSN()}
			<div class="onlineISSN">
				{translate key="catalog.manage.series.onlineIssn"} {$series->getOnlineISSN()|escape}
			</div>
		{/if}
		{if $series->getPrintISSN()}
			<div class="printISSN">
				{translate key="catalog.manage.series.printIssn"} {$series->getPrintISSN()|escape}
			</div>
		{/if}
	</div>

  </div>
    <hr class="book-separator" style="margin-bottom:4rem;">


	{* No published titles in this category *}
	{if empty($publishedSubmissions)}
		<h2>
			{translate key="catalog.category.heading"}
		</h2>
		<p>{translate key="catalog.noTitles"}</p>

	{else}

		{* New releases *}
		{if !empty($newReleasesMonographs)}
			{include file="frontend/components/monographList.tpl" monographs=$newReleasesMonographs titleKey="catalog.newReleases"}
		{/if}

		{* All monographs *}
		{include file="frontend/components/monographList.tpl" monographs=$publishedSubmissions featured=$featuredMonographIds titleKey="catalog.category.heading"}

		{* Pagination *}
		{if $prevPage > 1}
			{capture assign=prevUrl}{url router=PKPApplication::ROUTE_PAGE page="catalog" op="series" path=$series->getPath()|to_array:$prevPage}{/capture}
		{elseif $prevPage === 1}
			{capture assign=prevUrl}{url router=PKPApplication::ROUTE_PAGE page="catalog" op="series" path=$series->getPath()}{/capture}
		{/if}
		{if $nextPage}
			{capture assign=nextUrl}{url router=PKPApplication::ROUTE_PAGE page="catalog" op="series" path=$series->getPath()|to_array:$nextPage}{/capture}
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


