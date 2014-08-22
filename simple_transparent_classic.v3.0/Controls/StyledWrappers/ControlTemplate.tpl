
<$if( GadgetTitleBegin && Model.Appearance.ShowTitle )$>
	<div class="gadgetStyleTitle" style="<$Model.CssStyle.Padding.Left$> <$Model.CssStyle.Padding.Right$>"><h4>
		<$if (GadgetTitleText)$><$GadgetTitleText$><$endif$>
<$endif$>

<$if( GadgetTitleEnd && Model.Appearance.ShowTitle )$>
	</h4></div>
<$endif$>

<$if( GadgetBodyBegin )$>
	<div class="gadgetStyleBody <$if(GadgetContent)$>gadgetContentEditableArea<$endif$>" style="<$Model.CssStyle.Padding$>" <$if(GadgetContent)$>data-editableArea="0"<$endif$> data-areaHeight="auto">
<$endif$>




<$if( GadgetBodyEnd )$>
	</div>
<$endif$>









