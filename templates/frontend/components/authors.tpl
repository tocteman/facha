<div class="item authors written-presentation-authors">

  {* Only show editors for edited volumes *}
				{if $monograph->getWorkType() == $smarty.const.WORK_TYPE_EDITED_VOLUME && $editors|@count}
					{assign var="authors" value=$editors}
					{assign var="identifyAsEditors" value=true}
				{/if}


	{* Show short author lists on multiple lines *}
	{if $authors|@count < 7}
		{foreach from=$authors item=author}
			<div class="sub_item">
				<div class="author-name">
					{if $identifyAsEditors}
						{translate key="submission.editorName" editorName=$author->getFullName()|escape}
					{else}
						{$author->getFullName()|escape}
					{/if}
				</div>
				{if $author->getLocalizedAffiliation()}
					<div class="value">
						{$author->getLocalizedAffiliation()|escape}
					</div>
				{/if}
				{if $author->getOrcid()}
					<span class="orcid">
						<a href="{$author->getOrcid()|escape}" target="_blank">
							{$author->getOrcid()|escape}
						</a>
					</span>
				{/if}
			</div>
		{/foreach}

		{* Show long author lists on one line *}
	{else}
    <strong>Varios autores.</strong>
	{/if}
</div>

