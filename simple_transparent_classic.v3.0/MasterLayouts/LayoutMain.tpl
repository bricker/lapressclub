<div class="mLayout layoutMain state1" id="mLayout">

	<$MasterLayouts/ResponsiveScript()$>

	<$if (!PageModel.IsWidgetMode)$>

		<$if (PageModel.ShowFreeAccountAds)$>
		<!-- banner zone -->
		<div class="zoneBanner">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$MasterLayouts/FreeAccountAds()$>
				</div>
			</div>
		</div>
		<!-- banner zone -->
		<$endif$>

		<!-- header zone -->
		<div class="zoneHeader1">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader2">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header1"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader3">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header2"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader4">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header3"$>
				</div>
			</div>
		</div>
		<!-- /header zone -->

	<$endif$>

	<!-- content zone -->
	<div class="zoneContent">
		<div class="container_12">
			<div class="s1_grid_12 s2_grid_12 s3_grid_12">
				<$Area Name="Content"$>
			</div>
		</div>
	</div>
	<!-- /content zone -->

	<$if (!PageModel.IsWidgetMode)$>

		<!-- footer zone -->
		<div class="zoneFooter1">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer"$>
				</div>
			</div>
		</div>
		<div class="zoneFooter2">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer1"$>
				</div>
			</div>
		</div>
		<div class="zoneFooter3">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer2"$>
				</div>
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$MasterLayouts/WAbranding()$>
				</div>
			</div>
		</div>
		<!-- /footer zone -->

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