<div class="menuInner">
	<ul class="firstLevel">
		<$Model.Items:Item()$>
	</ul>
</div>

<script type="text/javascript">
	jq$(function()
	{
		var gadgetHorMenu = jq$('#<$Model.Id$>'),
			gadgetHorMenuContainer = gadgetHorMenu.find('.menuInner'),
			firstLevelMenu = gadgetHorMenu.find('ul.firstLevel'),
			holderInitialMenu = firstLevelMenu.children(),
			outsideItems = null,
			phantomElement = '<li class="phantom"><div class="item"><a href="#"><span>&#x2261;</span></a><ul class="secondLevel"></ul></div></li>',
			placeHolder = gadgetHorMenu.parents('.WaLayoutPlaceHolder'),
			placeHolderId = placeHolder && placeHolder.attr('data-componentId');

		function resizeMenu()
		{
			var i,
				len,
				fitMenuWidth = 0,
				menuItemPhantomWidth = 80;

			firstLevelMenu.html( holderInitialMenu).removeClass('adapted').css({ width: 'auto' }); // restore initial menu

			if( firstLevelMenu.width() > gadgetHorMenuContainer.width() ) // if menu oversize
			{
				menuItemPhantomWidth = firstLevelMenu.addClass('adapted').append( phantomElement).children('.phantom').width();

				for( i = 0, len = holderInitialMenu.size(); i <= len; i++ )
				{
					fitMenuWidth += jq$( holderInitialMenu.get(i) ).width();

					if( fitMenuWidth + menuItemPhantomWidth > gadgetHorMenuContainer.width() )
					{
						outsideItems = firstLevelMenu.children(':gt('+(i-1)+'):not(.phantom)').remove();
						firstLevelMenu.find('.phantom > .item > ul').append( outsideItems);
						break;
					}
				}
				gadgetHorMenu.find('.phantom > .item > a').click(function(){ return false; });
			}

			firstLevelMenu.css( 'width', '' ); // restore initial menu width
			firstLevelMenu.children().removeClass('last-child').eq(-1).addClass('last-child'); // add last-child mark
		}

		resizeMenu();

		jq$(window).resize(function()
		{
			resizeMenu();
		});

		function onLayoutColumnResized(sender, args)
		{
			args = args || {};

			if (placeHolderId && (placeHolderId == args.leftColPlaceHolderId || placeHolderId == args.rightColPlaceHolderId))
			{
				resizeMenu();
			}
		}

		BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, function() { WA.Gadgets.LayoutColumnResized.addHandler(onLayoutColumnResized); });
		BonaPage.addPageStateHandler(BonaPage.PAGE_UNLOADED, function() { WA.Gadgets.LayoutColumnResized.removeHandler(onLayoutColumnResized); });

	});
</script>