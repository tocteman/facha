{assign var=publicationFormatId value=$publicationFormat->getBestId()}

{* Generate the download URL *}
{if $publication->getId() === $monograph->getCurrentPublication()->getId()}
	{capture assign=downloadUrl}{url op="view" path=$monograph->getBestId()|to_array:$publicationFormatId:$downloadFile->getBestId()}{/capture}
{else}
	{capture assign=downloadUrl}{url op="view" path=$monograph->getBestId()|to_array:"version":$publication->getId():$publicationFormatId:$downloadFile->getBestId()}{/capture}
{/if}

{* Display the download link *}
<a href="{$downloadUrl}" class="cmp_download_link">
  <button class="main-btn">
    Descargar
  </button>
</a>

