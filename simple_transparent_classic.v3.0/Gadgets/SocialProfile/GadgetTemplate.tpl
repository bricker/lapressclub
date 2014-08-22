<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>


<ul class="orientation<$Model.Settings.Layout$>">

	<$if (Model.Appearance.StyleValue!="gadgetDefaultStyle")$>


		<$if (Model.Settings.FacebookLink!="")$>
			<li>
				<a href="<$Model.Settings.FacebookLink$>" title="Facebook" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-facebook.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.TwitterLink!="")$>
			<li>
				<a href="<$Model.Settings.TwitterLink$>" title="Twitter" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-twitter.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.GooglePlusLink!="")$>
			<li>
				<a href="<$Model.Settings.GooglePlusLink$>" title="Google+" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-google-plus.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.LinkedInLink!="")$>
			<li>
				<a href="<$Model.Settings.LinkedInLink$>" title="LinkedIn" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-linkedin.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.YouTubeLink!="")$>
			<li>
				<a href="<$Model.Settings.YouTubeLink$>" title="YouTube" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-youtube.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.InstagramLink!="")$>
			<li>
				<a href="<$Model.Settings.InstagramLink$>" title="Instagram" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-instagram.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.PinterestLink!="")$>
			<li>
				<a href="<$Model.Settings.PinterestLink$>" title="Pinterest" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-pinterest.png" /></a>
			</li>
		<$endif$>


	<$else$>


		<$if (Model.Settings.FacebookLink!="")$>
			<li>
				<a href="<$Model.Settings.FacebookLink$>" title="Facebook" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-facebook.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.TwitterLink!="")$>
			<li>
				<a href="<$Model.Settings.TwitterLink$>" title="Twitter" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-twitter.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.GooglePlusLink!="")$>
			<li>
				<a href="<$Model.Settings.GooglePlusLink$>" title="Google+" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-google-plus.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.LinkedInLink!="")$>
			<li>
				<a href="<$Model.Settings.LinkedInLink$>" title="LinkedIn" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-linkedin.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.YouTubeLink!="")$>
			<li>
				<a href="<$Model.Settings.YouTubeLink$>" title="YouTube" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-youtube.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.InstagramLink!="")$>
			<li>
				<a href="<$Model.Settings.InstagramLink$>" title="Instagram" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-instagram.png" /></a>
			</li>
		<$endif$>
		<$if (Model.Settings.PinterestLink!="")$>
			<li>
				<a href="<$Model.Settings.PinterestLink$>" title="Pinterest" target="_blank"><img height="30" witdh="30" src="<$PageModel.BaseUrl$>/Gadgets/SocialProfile/Images/icon-default-pinterest.png" /></a>
			</li>
		<$endif$>


	<$endif$>




</ul>

<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>





