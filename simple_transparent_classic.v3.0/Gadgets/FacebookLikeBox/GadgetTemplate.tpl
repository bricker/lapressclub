<$control.StyledWrappers(GadgetBegin = "true", GadgetTitleBegin = "true", GadgetTitleText = Model.Appearance.Title, GadgetTitleEnd = "true",  GadgetBodyBegin = "true")$>

<script type="text/javascript">
  (function ()
  {
    'use strict';

    function initializeGadget()
    {
	  if (window.WaFacebookLikeBoxManager)
	  {
		WaFacebookLikeBoxManager.createGadget({ id: '<$Model.ComponentId$>' }, { likeBoxContainerId: 'facebook_<$Model.ComponentId$>' });
	  }	  
	}

    BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, initializeGadget, BonaPage.HANDLERTYPE_ALWAYS);
  })();
</script>

<div id="facebook_<$Model.ComponentId$>">   
<div class="fb-like-box" data-href="https://www.facebook.com/<$Model.Settings.FacebookPage$>" 
   data-width="<$Model.Settings.FeedWidth$>" 
   data-height="<$Model.Settings.FeedHeight$>" 
   data-show-faces="<$if(Model.Settings.ShowProfilePhotos)$>true<$else$>false<$endif$>" 
   data-stream="<$if(Model.Settings.ShowProfileStream)$>true<$else$>false<$endif$>" 
   data-colorscheme="<$Model.Settings.ColorScheme$>" 
   data-header="<$if(Model.Settings.ShowHeader)$>true<$else$>false<$endif$>"></div>
</div>

<$control.StyledWrappers(GadgetBodyEnd = "true", GadgetEnd = "true")$>


