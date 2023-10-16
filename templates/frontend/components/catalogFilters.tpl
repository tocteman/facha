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
      </div>
    </div>

    
    

    <div class="" 
        v-bind="{ 'shown': open === 'series', 'hidden': open !== 'series' }"
      >
      <div class="catalog-series">
    </div>
    </div>
  </div>

