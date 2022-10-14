<div class="catalog-filter-area" v-scope="{ open: 'none' }">
    <div class="filter-area-picker">
      <button 
        :class="{ 'underlined': open === 'categories', 'faded': open !== 'categories' }"
        @click="{ open === 'categories' ? open = 'none' : open = 'categories'}"
      >
        Categorías
      </button>
      <button
        :class="{ 'underlined': open === 'series', 'faded': open !== 'series' }"
        @click="{ open === 'series' ? open = 'none' : open = 'series'}"
      >
      Series
      </button>
    </div>

    {assign var="categoriesList" value=DAORegistry::getDAO('CategoryDAO')->getByContextId(1)->toArray()}
    {assign var="seriesList" value=DAORegistry::getDAO('SeriesDAO')->getByPressId(1)->toArray()}
    <div class="" 
        v-bind="{ 'shown': open === 'categories', 'hidden': open !== 'categories' }"
    >
    <div class="catalog-categories">
        {foreach from=$categoriesList item="browseCategory"}
            <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$browseCategory->getPath()|escape}">
              <h4 class="category_{$browseCategory->getId()}{if $browseCategory->getParentId()} is_sub{/if}{if $browseBlockSelectedCategory == $browseCategory->getPath()} current{/if}">
              {$browseCategory->getLocalizedTitle()|escape}
              </h4>
            </a>
        {/foreach}
      </div>
    </div>

    
    

    <div class="" 
        v-bind="{ 'shown': open === 'series', 'hidden': open !== 'series' }"
      >
      <div class="catalog-series">
      {foreach from=$seriesList item=browseSeriesItem}
        <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="series" path=$browseSeriesItem->getPath()|escape}">
          <h4 class="series_{$browseSeriesItem->getId()}{if $browseBlockSelectedSeries == $browseSeriesItem->getPath() && $browseBlockSelectedSeries != ''} current{/if}">
      {$browseSeriesItem->getLocalizedTitle()|escape}
          </h4>
        </a>
      {/foreach}
    </div>
    </div>
  </div>

