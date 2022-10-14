<div class="obj_monograph_summary{if $isFeatured} is_featured{/if}">
		<a {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else} href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if} class="summary-img">
			{assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
			<img
				src="{$monograph->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}"
				alt="{$coverImage.altText|escape|default:''}"
			>
		</a>
		<div class="summary-author">
			{$monograph->getAuthorOrEditorString()|escape}
		</div>
			<a {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if}>

      <div class="summary-title">
				{$monograph->getLocalizedTitle()|escape|truncate:38:"..."}
      </div>
      <div class="summary-subtitle">
				{$monograph->getCurrentPublication()->getLocalizedData('subtitle')|escape}
      </div>

			</a>

      {if $monograph->getSeriesId()}
      <div class="summary-series">

      <a href="{url page="catalog" op="series" path=DAORegistry::getDAO('SeriesDAO')->getById($monograph->getSeriesId())->getPath()}">
      {DAORegistry::getDAO('SeriesDAO')->getById($monograph->getSeriesId())->getLocalizedFullTitle()}
      </a>
      </div>
      {/if}


</div><!-- .obj_monograph_summary -->

