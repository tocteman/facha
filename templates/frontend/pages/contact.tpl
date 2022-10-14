{include file="frontend/components/header.tpl" pageTitle="about.contact"}

<div class="page page_contact">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.contact"}
	<h1>
		{translate key="about.contact"}
	</h1>

	{* Contact section *}
	<div class="contact_section">

		{if $mailingAddress}
			<div class="address">
				{$mailingAddress|nl2br|strip_unsafe_html}
			</div>
		{/if}

		{* Primary contact *}
		{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
			<div class="contact primary">
				<h3>
					{translate key="about.contact.principalContact"}
				</h3>

				{if $contactName}
				<div class="name">
					{$contactName|escape}
				</div>
				{/if}

				{if $contactTitle}
				<div class="title">
					{$contactTitle|escape}
				</div>
				{/if}

				{if $contactAffiliation}
				<div class="affiliation">
					{$contactAffiliation|strip_unsafe_html}
				</div>
				{/if}

				{if $contactPhone}
				<div class="phone">
					<span class="label">
						{translate key="about.contact.phone"}
					</span>
					<span class="value">
						{$contactPhone|escape}
					</span>
				</div>
				{/if}

				{if $contactEmail}
				<div class="email">
					{mailto address=$contactEmail encode='javascript'}
				</div>
				{/if}
			</div>
		{/if}

		{* Technical contact *}
		{if $supportName || $supportPhone || $supportEmail}
			<div class="contact support">
				<h3>
					{translate key="about.contact.supportContact"}
				</h3>

				{if $supportName}
				<div class="name">
					{$supportName|escape}
				</div>
				{/if}

				{if $supportPhone}
				<div class="phone">
					<span class="label">
						{translate key="about.contact.phone"}
					</span>
					<span class="value">
						{$supportPhone|escape}
					</span>
				</div>
				{/if}

				{if $supportEmail}
				<div class="email">
					{mailto address=$supportEmail encode='javascript'}
				</div>
				{/if}
			</div>
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}

