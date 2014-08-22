<li<$if (it.IsLastItem)$> class="last"<$else$><$endif$>>
	<div class="title"><a href="<$it.Url$>"><$it.Subject$></a></div>
	<div class="date">
		<$it.MessageDate$> &#8226;
		<$if (it.IsAuthorUrl)$>
			<a class="itemAuthor" href="<$it.AuthorUrl$>"><$it.Author$></a>
		<$else$>
			<span class="itemAuthor"><$it.Author$></span>
		<$endif$>
	</div>
</li>
