{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}

<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">

		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">

    <div class="first-row">
    <div class="editorial-center-header">
    <a href="{$homeUrl}" class="logo">
      Centro Editorial
    </a>
    </div>
      <div class="pkp_site_name_wrapper">
					<div class="pkp_site_name">
					{capture assign="homeUrl"}
            {url page="index" router=$smarty.const.ROUTE_PAGE}
					{/capture}
					{if $displayPageHeaderLogo}
						<a href="{$homeUrl}" class="logo">
							<img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/logo_ucuencapress.svg" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''} alt="{$displayPageHeaderLogo.altText|escape}"{/if} />
						</a>
					{elseif $displayPageHeaderTitle}
						<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
					{else}
						<a href="{$homeUrl}" class="is_img">
							<img src="https://toronjafs.nyc3.cdn.digitaloceanspaces.com/ucuencapress/logo_ucuencapress.svg" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
						</a>
					{/if}
					</div>
				</div>


    </div>
    <div class="second-row">
    <div class="pkp_head_wrapper header-inner">

          <a href="{url router=$smarty.const.ROUTE_PAGE page="catalog"}">
          <div class="topbar-item">
            Libros
          </div>
          </a>


          <a href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
          <div class="topbar-item">
            Nosotros
          </div>
          </a>

          <a href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
          <div class="topbar-item">
            Contacto
          </div>
          </a>


          <a href="{url router=$smarty.const.ROUTE_PAGE page="login"}">
          <div class="topbar-item">
            Ingresar
          </div>
          </a>

				{capture assign="primaryMenu"}
					{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}
				{/capture}

				<nav class="pkp_site_nav_menu" aria-label="{translate|escape key="common.navigation.site"}">
					<div class="pkp_navigation_primary_row">
						<div class="pkp_navigation_primary_wrapper">
							{* Primary navigation menu for current application *}
							{$primaryMenu}

							{* Search form *}
							{if $currentContext}
									<a href="{url page="search"}" class="topbar-icon">
                  <svg style="width:20px; height:20px" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
  <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
</svg>
									</a>
							{/if}
						</div>
					</div>
					<div class="pkp_navigation_user_wrapper" id="navigationUserWrapper">
						{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
					</div>
				</nav>


			</div>
    </div>

		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main" role="main">
				<a id="pkp_content_main"></a>

