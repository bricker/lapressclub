<div class="mLayout layoutPlain state1" id="mLayout">

	<$MasterLayouts/ResponsiveScript()$>

	<!-- content zone -->
	<div class="zoneContent">
		<div class="container_12">
			<$if (!PageModel.IsWidgetMode)$>

				<$if (PageModel.ShowFreeAccountAds)$>
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$MasterLayouts/FreeAccountAds()$>
				</div>
				<$endif$>

			<$endif$>
			<div class="s1_grid_12 s2_grid_12 s3_grid_12">
				<$Area Name="Content"$>
			</div>
		</div>
	</div>
	<!-- /content zone -->

	<$if (!PageModel.IsWidgetMode)$>

		<div class="WABranding">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$MasterLayouts/WAbranding()$>
				</div>
			</div>
		</div>

	<$endif$>


	<$if (PageModel.GlobalUserJavaScript)$>
		<div id="idCustomJsContainer" class="cnCustomJsContainer">
			<$PageModel.GlobalUserJavaScript$>
		</div>
	<$endif$>

	<$if (PageModel.ShowFreeAccountAds)$>
		<$MasterLayouts/FreeAccountTracker()$>
	<$endif$>


</div>