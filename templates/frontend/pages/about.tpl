{include file="frontend/components/header.tpl" pageTitle="about.aboutContext"}

<div class="page page_about">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutContext"}

<div class="about_content">
	<h1>
		{translate key="about.aboutContext"}
	</h1>
	{$currentContext->getLocalizedData('about')}
</div>
{include file="frontend/components/footer.tpl"}
