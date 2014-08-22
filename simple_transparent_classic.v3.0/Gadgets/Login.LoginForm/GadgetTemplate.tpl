<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>
<$if(!Model.IsHiddenOnPage)$>

	<$if (Model.Settings.Layout == "Vertical")$>

		<$if(Model.Security.IsAuthenticated)$>
			<div class="loginContainerAuthenticated orientation<$Model.Settings.Layout$>">
				<div class="loggedName">
					<$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$><$Model.UserFullName$>
				</div>
				<$if (!Model.IsSystemAdminView)$>
					<div class="profileBox viewProfileBox">
						<a href="<$if (Model.IsAdminView)$><$Model.Urls.ContactDetails$><$else$><$Model.Urls.Profile$><$endif$>"><$Model.Text.LinkProfileText$></a>
					</div>
				<$endif$>
				<div class="profileBox changePasswordBox">
					<a href="<$Model.Urls.ChangePassword$>"><$Model.Text.LinkChangePasswordText$></a>
				</div>
				<div class="profileBox loggedAction">
          			<$control.Form(formBegin = "true", action = Model.Urls.SignOut)$>
						<input type="submit" size="20" value="<$Model.Text.LinkSignOutText$>" id="ctl00_LeftMenuArea_Authentication1_loginViewControl_LogoutButton" class="loginBoxLogout">
					<$control.Form(formEnd = "true")$>
				</div>
			</div>
		<$else$>
			<div class="loginContainerForm orientation<$Model.Settings.Layout$>">
        <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
					<input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
					<input type="hidden" name="browserData" id="<$Model.Id$>_browserField">

					<div class="loginUserName">
						<div class="loginUserNameLabel">
							<label for='<$Model.Id$>_userName'>
								<$Model.Text.LabelEmail$>
								<span validatorType="required" controlToValidate="<$Model.Id$>_userName" display="static" errorMessage="<$Model.Text.EmailIsRequired$>" id="<$Model.Id$>_userNameRequiredValidator" class="mandatorySymbol loginUserNameValidationInfo" style="visibility:hidden;">*</span>
							</label>
						</div>
						<div class="loginUserNameTextBox">
							<input name="email" type="text" maxlength="100" id="<$Model.Id$>_userName" tabindex="1" class="emailTextBoxControl"/>
						</div>
					</div>

					<div class="loginPassword">
						<div class="loginPasswordLabel">
							<label for='<$Model.Id$>_password'>
								<$Model.Text.LabelPassword$>
								<span validatorType="required" controlToValidate="<$Model.Id$>_password" display="static" errorMessage="<$Model.Text.PasswordIsRequired$>" id="<$Model.Id$>_passwordRequiredValidator" class="mandatorySymbol loginPasswordValidationInfo" style="visibility:hidden;">*</span>
							</label>
						</div>
						<div class="loginPasswordTextBox">
							<input name="password" type="password" maxlength="50" id="<$Model.Id$>_password" tabindex="2" class="passwordTextBoxControl" autocomplete="off"/>
						</div>
					</div>

					<div class="loginActionRememberMe">
						<input id="<$Model.Id$>_rememberMe" type="checkbox" name="rememberMe" tabindex="3" class="rememberMeCheckboxControl"/><label for="<$Model.Id$>_rememberMe"><$Model.Text.LabelRemember$></label>
					</div>

					<div class="loginAction">
						<input type="submit" name="ctl03$ctl02$loginViewControl$loginControl$Login" value="<$Model.Text.ButtonLoginText$>" id="<$Model.Id$>_loginAction" onclick="if (!browserInfo.clientCookiesEnabled()) {alert('<$Model.Text.WarningCookiesNotAvailable$>'); return false;}" tabindex="4" class="loginButton loginButtonControl"/>
					</div>

					<div class="loginPasswordForgot">
						<a href="<$Model.Urls.ForgotPassword$>"><$Model.Text.LinkForgotPasswordText$></a>
					</div>
        <$control.Form(formEnd = "true")$>
			</div>
		<$endif$>

	<$endif$>


	<$if (Model.Settings.Layout == "Horizontal")$>

		<$if(Model.Security.IsAuthenticated)$>
			<div class="loginContainerAuthenticated orientation<$Model.Settings.Layout$>">
				<div class="loggedName">
					<$if(Model.IsLapsedMembership)$><$Model.Text.LabelLapsed$> <$endif$>
				</div>
				<$if (!Model.IsSystemAdminView)$>
				<div class="profileBox viewProfileBox">
					<a href="<$if (Model.IsAdminView)$><$Model.Urls.ContactDetails$><$else$><$Model.Urls.Profile$><$endif$>"><$Model.UserFullName$></a>
				</div>
				<$endif$>
				<div class="profileBox changePasswordBox">
					<a href="<$Model.Urls.ChangePassword$>"><$Model.Text.LinkChangePasswordText$></a>
				</div>
				<div class="profileBox loggedAction">
					<a class="loginBoxLogout" <$if (Model.IsAdminView)$>target="_top"<$else$><$endif$> href="<$Model.Urls.SignOut$>"><$Model.Text.LinkSignOutText$></a>
				</div>
			</div>

		<$else$>
			<div class="loginContainerForm orientation<$Model.Settings.Layout$>">
        <$control.Form(formBegin = "true", action = Model.Urls.Authenticate, id = Model.Id + "_form", class="generalLoginBox")$>
					<input type="hidden" name="ReturnUrl" id="<$Model.Id$>_returnUrl" value="<$Model.Urls.Return$>">
					<input type="hidden" name="browserData" id="<$Model.Id$>_browserField">

					<div class="loginPasswordForgot">
						<a href="<$Model.Urls.ForgotPassword$>"><$Model.Text.LinkForgotPasswordText$></a>
					</div>

					<div class="loginUserName">
						<span validatorType="required" controlToValidate="<$Model.Id$>_userName" display="static" errorMessage="<$Model.Text.EmailIsRequired$>" id="<$Model.Id$>_userNameRequiredValidator" class="mandatorySymbol loginUserNameValidationInfo" style="visibility:hidden;">*</span>
						<div class="loginUserNameLabel"><label for='<$Model.Id$>_userName'><$Model.Text.LabelEmail$></label></div>
						<div class="loginUserNameTextBox"><input name="email" type="text" maxlength="100" id="<$Model.Id$>_userName" tabindex="1" class="emailTextBoxControl" /></div>
					</div>

					<div class="loginPassword">
						<span validatorType="required" controlToValidate="<$Model.Id$>_password" display="static" errorMessage="<$Model.Text.PasswordIsRequired$>" id="<$Model.Id$>_passwordRequiredValidator" class="mandatorySymbol loginPasswordValidationInfo" style="visibility:hidden;">*</span>
						<div class="loginPasswordLabel"><label for='<$Model.Id$>_password'><$Model.Text.LabelPassword$></label></div>
						<div class="loginPasswordTextBox"><input name="password" type="password" maxlength="50" id="<$Model.Id$>_password" tabindex="2" class="passwordTextBoxControl" autocomplete="off" /></div>
					</div>

					<div class="loginActionRememberMe">
						<input id="<$Model.Id$>_rememberMe" type="checkbox" name="rememberMe" tabindex="3" class="rememberMeCheckboxControl"/><label for="<$Model.Id$>_rememberMe"><$Model.Text.LabelRemember$></label>
					</div>

					<div class="loginAction">
						<input type="submit" name="ctl03$ctl02$loginViewControl$loginControl$Login" value="<$Model.Text.ButtonLoginText$>" id="<$Model.Id$>_loginAction" onclick="if (!browserInfo.clientCookiesEnabled()) {alert('<$Model.Text.WarningCookiesNotAvailable$>'); return false;}" tabindex="4" class="loginButton loginButtonControl"/>
					</div>

					<script>
						jq$(function(){
							jq$('#<$Model.Id$> .loginUserName').addClass('loginUserNameJs');
							if( jq$('#<$Model.Id$> .emailTextBoxControl').val() == '' )
								jq$('#<$Model.Id$> .loginUserNameLabel').show();

							jq$('#<$Model.Id$> .loginUserNameLabel').click(function(){
								jq$(this).hide();
								jq$('#<$Model.Id$> .emailTextBoxControl').focus();
							});
							jq$('#<$Model.Id$> .emailTextBoxControl').focus(function(){
								jq$('#<$Model.Id$> .loginUserNameLabel').hide();
							});
							jq$('#<$Model.Id$> .emailTextBoxControl').blur(function(){
								if( jq$(this).val() == '' )
									jq$('#<$Model.Id$> .loginUserNameLabel').show();
							});



							jq$('#<$Model.Id$> .loginPassword').addClass('loginPasswordJs');
							if( jq$('#<$Model.Id$> .passwordTextBoxControl').val() == '' )
								jq$('#<$Model.Id$> .loginPasswordLabel').show();

							jq$('#<$Model.Id$> .loginPasswordLabel').click(function(){
								jq$(this).hide();
								jq$('#<$Model.Id$> .passwordTextBoxControl').focus();
							});
							jq$('#<$Model.Id$> .passwordTextBoxControl').focus(function(){
								jq$('#<$Model.Id$> .loginPasswordLabel').hide();
							});
							jq$('#<$Model.Id$> .passwordTextBoxControl').blur(function(){
								if( jq$(this).val() == '' )
									jq$('#<$Model.Id$> .loginPasswordLabel').show();
							});

						});
					</script>


				<$control.Form(formEnd = "true")$>
			</div>
		<$endif$>

	<$endif$>



	<script>
		jq$(function(){
			var browserField = document.getElementById('<$Model.Id$>_browserField');

			if (browserField)
				browserField.value = browserInfo.getBrowserCapabilitiesData();

			jq$('#<$Model.Id$>_form').FormValidate();
                        jq$('.WaGadgetLoginForm form').attr('data-disableInAdminMode', 'false');
		});
	</script>
<$endif$>
<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>
