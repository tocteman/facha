{if !$heading}
	{assign var="heading" value="h2"}
{/if}
{if !$titleKey}
	{assign var="monographHeading" value=$heading}
{elseif $heading == 'h2'}
	{assign var="monographHeading" value="h3"}
{elseif $heading == 'h3'}
	{assign var="monographHeading" value="h4"}
{else}
	{assign var="monographHeading" value="h5"}
{/if}

<div class="cmp_monographs_list">

	{assign var=counter value=3}
  <div class="summary-grid">
    {foreach name="monographListLoop" from=$monographs item=monograph}
      {if is_array($featured) && array_key_exists($monograph->getId(), $featured)}
        {assign var="isFeatured" value=true}
      {else}
        {assign var="isFeatured" value=false}
      {/if}
      {if $isFeatured}
        {include file="frontend/objects/monograph_summary.tpl" monograph=$monograph isFeatured=$isFeatured heading=$monographHeading}
      {else}
          {include file="frontend/objects/monograph_summary.tpl" monograph=$monograph isFeatured=$isFeatured heading=$monographHeading}
        {assign var=counter value=$counter+1}
      {/if}
    {/foreach}
  </div>
	{* Close .row if we have an odd number of titles *}
	{if $counter > 1 && $counter is even by 1}
		</div>
	{/if}
</div>

