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


    <div class="" 
        v-bind="{ 'shown': open === 'categories', 'hidden': open !== 'categories' }"
    >
    <div class="catalog-categories">
			<div>
		    <a class="" href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path="area_1"}" >
				1. Técnicas, Ingenierías, Arquitectura
			</a>
			</div>
			<div>
		    <a class="" href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path="area_2"}" >
				2. Educación, Artes, Humanidades
			</a>
			</div>
			<div>
		    <a class="" href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path="area_3"}" >
				3. Salud y Bienestar
			</a>
			</div>
			<div>
		    <a class="" href="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path="area_4"}" >
				4. Ciencias Sociales, Derecho, Periodismo
			</a>
			</div>
      </div>
    </div>
    
    <div class="" 
        v-bind="{ 'shown': open === 'series', 'hidden': open !== 'series' }"
      >
      <div class="catalog-series">
	        {if $series}
              <div class="item series">
              <h4> Serie </h4>
              <ul>
                <li>
                <a href="{url page="catalog" op="series" path=$series->getPath()}" class="book-series">
                {$series->getLocalizedFullTitle()|escape}
              </a>
                </li>
              </ul>
              </div>
            {/if}
    </div>
    </div>
  </div>

