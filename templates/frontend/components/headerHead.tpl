<head>
	<meta charset="{$defaultCharset|escape}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>

  <script src="https://unpkg.com/petite-vue" defer init></script>
  <script src="//unpkg.com/alpinejs" defer></script>

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
</head>
