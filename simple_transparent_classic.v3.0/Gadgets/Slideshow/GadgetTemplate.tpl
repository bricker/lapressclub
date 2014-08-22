<$if (Model.IsImagesExist)$>
<script language="javascript">
	jq$(function(){

		jq$('#camera_wrap_<$Model.ComponentId$>').camera
		(
		  {
			componentId: '<$Model.ComponentId$>',
			thumbnails: true,
			loader: 'pie',
			fx: '<$(Model.Settings.TransitionEffect)$>',
			time: (<$Model.Settings.DisplayImage$>*1000),
			transPeriod: (<$Model.Settings.TransitionTime$>),
			portrait: <$if(Model.Settings.FitImage)$>false<$else$>true<$endif$>,
			playPause: false,
			pauseOnClick: false,
			thumbnails: <$Model.Settings.AllowUserManuallyNavigate$>,
			pagination: <$Model.Settings.AllowUserManuallyNavigate$>,
			navigation: <$Model.Settings.AllowUserManuallyNavigate$>,
			height: <$if (Model.Settings.GalleryLayout=="Landscape")$>'56%'<$endif$>
					<$if (Model.Settings.GalleryLayout=="Portrait")$>'133.3%'<$endif$>
					<$if (Model.Settings.GalleryLayout=="Square")$>'100%'<$endif$>
					<$if (Model.Settings.GalleryLayout=="FixedHeight")$>'<$Model.Settings.LayoutFixedHeight$>px'<$endif$>
		  }
		);		
	});
</script>

	<div class="camera_wrap camera_charcoal_skin" id="camera_wrap_<$Model.ComponentId$>">
		<$Model.Images:Item()$>
	</div>
<$else$>
	<div>&nbsp;</div>
	<p>No pictures to show</p>
	<div>&nbsp;</div>
<$endif$>


