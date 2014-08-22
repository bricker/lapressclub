<$if(!Model.IsHiddenOnPage)$>
    <$if(Model.Security.IsAuthenticated)$>

        <$if(Model.IsLapsedMembership)$>
			<div class="loginBoxLapsedMembership"><$Model.Text.LabelLapsed$></div>
		<$endif$>
		<div class="loginBoxProfileLink">
			<$if (!Model.IsSystemAdminView)$>
				<a href="<$if (Model.IsAdminView)$><$Model.Urls.ContactDetails$><$else$><$Model.Urls.Profile$><$endif$>"><$Model.UserFullName$></a>
			<$endif$>
		</div>
        <a class="loginBoxChangePassword" href="<$Model.Urls.ChangePassword$>"><$Model.Text.LinkChangePasswordText$></a>
	<a class="loginBoxLogout" <$if (Model.IsAdminView)$>target="_top"<$else$><$endif$> href="<$Model.Urls.SignOut$>"><$Model.Text.LinkSignOutText$></a>

    <$else$>

        <div class="loginBoxLinkContainer">
            <a class="loginBoxLinkButton" href="<$Model.Urls.Authenticate$>"><$Model.Text.LinkSignInText$></a>
        </div>

    <$endif$>
<$endif$>