<div class="obj_monograph_full">

    {* Olitas *}
    <div class="book-olitas">
      <img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/separador-15.svg" alt="">
    </div>

    <div class="book-presentation-container">
      <div class="book-presentation-area">
      {* Cover *}
        <div class="item cover caratula">
          {assign var="coverImage" value=$publication->getLocalizedData('coverImage')}
          <img 
          src="{$publication->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}" 
          alt="{$coverImage.altText|escape|default:''}" 
          >
        </div>

      {* Written Presentation *}
        <div class="book-written-presentation">
        {if $series}
          <a href="{url page="catalog" op="series" path=$series->getPath()}" class="book-series">
              {$series->getLocalizedFullTitle()|escape}
          </a>
        {/if}

          <div class="book-publication-date">
          <span>·{$firstPublication->getData('datePublished')|date_format:"%Y"}·</span>
          </div>
          <h1 class="title">
            {$publication->getLocalizedTitle()|escape}
          </h1>
          <h2 class="subtitle">
            {$publication->getLocalizedData('subtitle')|escape}
          </h2>

          <h3 class="written-presentation-authors">
            {include file="frontend/components/authors.tpl" authors=$publication->getData('authors')}
          </h3>

          <div class="book-abstract">
              {$publication->getLocalizedData('abstract')|strip_unsafe_html}

          </div>


			{pluck_files assign=bookFiles files=$availableFiles by="chapter" value=0}
			{if $bookFiles|@count || $remotePublicationFormats|@count}
				<div class="item files">
					{include file="frontend/components/publicationFormats.tpl" publicationFiles=$bookFiles}
				</div>
			{/if}

        </div>

      {* Book secondary Info Container *}

      </div>

    </div>

    <hr class="book-separator">

      <div class="book-secondary-container" v-scope="{ infoType: 'info' }" >
        <div class="book-secondary-picker" >
          </button>
          <button 
          :class="{ 'underlined': infoType === 'info', 'faded': infoType !== 'info' }"
          @click="{ infoType = 'info'}"
          >
            Información
          </button>
          <button 
          :class="{ 'underlined': infoType === 'praise', 'faded': infoType !== 'praise' }"
          @click="{ infoType = 'praise'}"
          >
            Capítulos
          </button>
        </div>
        <div class="info"
        v-bind="{ 'shown': infoType === 'info', 'hidden': infoType !== 'info' }"
        >
          <div class="book-info-authors">
            <h4>Autores</h4>
              {foreach from=$publication->getData('authors') item=author}
                <p>
                  {$author->getFullName()|escape}
                </p>
              {/foreach}
          </div>


      <div>
      	{* Publication formats *}
			{if count($publicationFormats)}
				{foreach from=$publicationFormats item="publicationFormat"}
					{if $publicationFormat->getIsApproved()}

						{assign var=identificationCodes value=$publicationFormat->getIdentificationCodes()}
						{assign var=identificationCodes value=$identificationCodes->toArray()}
						{assign var=publicationDates value=$publicationFormat->getPublicationDates()}
						{assign var=publicationDates value=$publicationDates->toArray()}
						{assign var=hasPubId value=false}
						{foreach from=$pubIdPlugins item=pubIdPlugin}
							{assign var=pubIdType value=$pubIdPlugin->getPubIdType()}
							{if $publicationFormat->getStoredPubId($pubIdType)}
								{assign var=hasPubId value=true}
								{break}
							{/if}
						{/foreach}

						{* Skip if we don't have any information to print about this pub format *}
						{if !$identificationCodes && !$publicationDates && !$hasPubId && !$publicationFormat->getPhysicalFormat()}
							{continue}
						{/if}

						<div class="item publication_format">

							{* Only add the format-specific heading if multiple publication formats exist *}
							{if count($publicationFormats) > 1}
								<h4 class="pkp_screen_reader">
									{assign var=publicationFormatName value=$publicationFormat->getLocalizedName()}
									{translate key="monograph.publicationFormatDetails" format=$publicationFormatName|escape}
								</h4>

								<div class="sub_item item_heading format">
									<div class="label">
										{$publicationFormat->getLocalizedName()|escape}
									</div>
								</div>
							{else}
								<h4 class="pkp_screen_reader">
									{translate key="monograph.miscellaneousDetails"}
								</h4>
							{/if}


              {if $publicationFormat->getFrontMatter()}
								<div class="sub_item item_heading format book-info-publication-date">
									<p>
										{$publicationFormat->getFrontMatter()|escape} páginas
                  </p>
								</div>
                {/if}

              <p class="book-info-publication-date">{$firstPublication->getData('datePublished')|date_format:"%b %Y"}</p>


							{* DOI's and other identification codes *}
							{if $identificationCodes}
								{foreach from=$identificationCodes item=identificationCode}
									<div class="sub_item identification_code">
                    <p>
                      <strong>ISBN:</strong>&nbsp;{$identificationCode->getValue()|escape}
                    </p>
									</div>
								{/foreach}
							{/if}


							{* PubIDs *}
							{foreach from=$pubIdPlugins item=pubIdPlugin}
								{assign var=pubIdType value=$pubIdPlugin->getPubIdType()}
								{assign var=storedPubId value=$publicationFormat->getStoredPubId($pubIdType)}
								{if $storedPubId != ''}
									<div class="sub_item pubid {$publicationFormat->getId()|escape}">
										<h4 class="label">
											{$pubIdType}
										</h4>
										<div class="value">
											{$storedPubId|escape}
										</div>
									</div>
								{/if}
							{/foreach}

							{* Physical dimensions *}
							{if $publicationFormat->getPhysicalFormat()}
								<div class="sub_item dimensions">
									<h4 class="label">
										{translate key="monograph.publicationFormat.productDimensions"}
									</h4>
									<div class="value">
										{$publicationFormat->getDimensions()|escape}
									</div>
								</div>
							{/if}
						</div>
					{/if}
				{/foreach}
			{/if}


        </div>

        <div>
        {* Categories *}
          {if $categories}
            <div class="item categories">
              <h4 >
                {translate key="catalog.categories"}
              </h4>
                <ul>
                  {foreach from=$categories item="category"}
                    <li>
                      <a href="{url op="category" path=$category->getPath()}">
                        {$category->getLocalizedTitle()|strip_unsafe_html}
                      </a>
                    </li>
                  {/foreach}
                </ul>
            </div>
          {/if}

        {* Series *}
          {if $series}
              <h4 >
                Serie
              </h4>
          <a href="{url page="catalog" op="series" path=$series->getPath()}" class="book-series">
              {$series->getLocalizedFullTitle()|escape}
          </a>
          {/if}



        </div>
             
      </div>
		        <div class="book-praise"
        v-bind="{ 'shown': infoType === 'praise', 'hidden': infoType !== 'praise' }"
        >
    {if $chapters|@count}
				<div class="item chapters">
					<ul>
						{foreach from=$chapters item=chapter}
							{assign var=chapterId value=$chapter->getId()}
							<li>
								<div class="chapter-title">
									{$chapter->getLocalizedTitle()|escape}
									{if $chapter->getLocalizedSubtitle() != ''}
										<div class="chapter-subtitle">
											{$chapter->getLocalizedSubtitle()|escape}
										</div>
									{/if}
								</div>
                <div>
									{if $chapter->getLocalizedData('abstract') != ''}
										<div class="chapter-subtitle">
											{$chapter->getLocalizedData('abstract')}
										</div>
									{/if}

                </div>
								{assign var=chapterAuthors value=$chapter->getAuthorNamesAsString()}
								{if $authorString != $chapterAuthors}
									<div class="authors">
										{$chapterAuthors|escape}
									</div>
								{/if}

								{* DOI (requires plugin) *}
								{foreach from=$pubIdPlugins item=pubIdPlugin}
									{if $pubIdPlugin->getPubIdType() != 'doi'}
										{continue}
									{/if}
									{assign var=pubId value=$chapter->getStoredPubId($pubIdPlugin->getPubIdType())}
									{if $pubId}
										{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentPress->getId(), $pubId)|escape}
										<div class="doi">{translate key="plugins.pubIds.doi.readerDisplayName"} <a href="{$doiUrl}">{$doiUrl}</a></div>
									{/if}
								{/foreach}

								{* Display any files that are assigned to this chapter *}
								{pluck_files assign="chapterFiles" files=$availableFiles by="chapter" value=$chapterId}
								{if $chapterFiles|@count}
									<div class="files">

										{* Display chapter files sorted by publication format so that they are ordered
										   consistently across all chapters. *}
										{foreach from=$publicationFormats item=format}
											{pluck_files assign="pubFormatFiles" files=$chapterFiles by="publicationFormat" value=$format->getId()}

											{foreach from=$pubFormatFiles item=file}

												{* Use the publication format name in the download link unless a pub format has multiple files *}
												{assign var=useFileName value=false}
												{if $pubFormatFiles|@count > 1}
													{assign var=useFileName value=true}
												{/if}

												{include file="frontend/components/downloadLink.tpl" downloadFile=$file monograph=$monograph publicationFormat=$format currency=$currency useFilename=$useFileName}
											{/foreach}
										{/foreach}
									</div>
								{/if}
							</li>

						{/foreach}
					</ul>
				</div>
			{/if}

        </div>
      </div>


</div>

