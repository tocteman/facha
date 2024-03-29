{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
	<h1>
		{translate key="user.login"}
	</h1>

	{* A login message may be displayed if the user was redireceted to the
	   login page from another request. Examples include if login is required
	   before dowloading a file. *}
	{if $loginMessage}
		<p>
			{translate key=$loginMessage}
		</p>
	{/if}

	<form class="cmp_form cmp_form login" id="login" method="post" action="{$loginUrl}">
		{csrf}

		{if $error}
			<div class="pkp_form_error">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<input type="hidden" name="source" value="{$source|default:""|escape}" />

		<fieldset class="fields">
			<legend class="pkp_screen_reader">{translate key="user.login"}</legend>
			<div class="username">
				<label>
					<span class="label">
						{translate key="user.username"}
						<span class="required" aria-hidden="true">*</span>
						<span class="pkp_screen_reader">
							{translate key="common.required"}
						</span>
					</span>
				</label>
				<input type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" required aria-required="true" autocomplete="username">
			</div>
			<div class="password">
				<label>
					<span class="label">
						{translate key="user.password"}
						<span class="required" aria-hidden="true">*</span>
						<span class="pkp_screen_reader">
							{translate key="common.required"}
						</span>
					</span>
					<input type="password" name="password" id="password" value="{$password|default:""|escape}" password="true" maxlength="32" required aria-required="true" autocomplete="current-password">
					<a href="{url page="login" op="lostPassword"}">
						{translate key="user.login.forgotPassword"}
					</a>
				</label>
			</div>
			<div class="remember checkbox">
				<label>
					<input type="checkbox" name="remember" id="remember" value="1" checked="$remember">
					<span class="label">
						{translate key="user.login.rememberUsernameAndPassword"}
					</span>
				</label>
			</div>

			{* recaptcha spam blocker *}
			{if $recaptchaPublicKey}
				<fieldset class="recaptcha_wrapper">
					<div class="fields">
						<div class="recaptcha">
							<div class="g-recaptcha" data-sitekey="{$recaptchaPublicKey|escape}">
							</div>
						</div>
					</div>
				</fieldset>
			{/if}

			<div class="login-buttons">
				<button class="main-btn" type="submit">
          <h3>
            {translate key="user.login"}
          </h3>
				</button>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
          <button class="main-btn registration-btn">
					<a href="{$registerUrl}" class="register">
            <h3>
						{translate key="user.login.registerNewAccount"}
            </h3>
					</a>
          </button>
				{/if}

			</div>
		</fieldset>
	</form>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}

