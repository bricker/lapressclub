<$if(inlineScript)$>
	<script type="text/javascript" language="javascript" id="<$it.Id$>">
		<$it.Source$>
	</script>
<$endif$>
<$if(script)$><script type="text/javascript" language="javascript" src="<$it.Path$>" id="<$it.Id$>"></script><$endif$>
<$if(stylesheet)$><link href="<$it.Path$>" rel="stylesheet" type="text/css" /><$endif$>
<$if(rss)$><link href="<$it.Path$>" rel="alternate" type="application/rss+xml" title="<$it.Title$>" /><$endif$>