<meta name="viewport" content="width=device-width" />
<$PageModel.Styles:Links(stylesheet = "true")$>
<$PageModel.InlineScripts:Links(inlineScript = "true")$>
<$PageModel.Scripts:Links(script = "true")$>
<$PageModel.Rss:Links(rss = "true")$>

<title><$PageModel.Title$></title>
<$if (PageModel.Keywords)$><meta name="Keywords" content="<$PageModel.Keywords$>"/><$endif$>
<$if (PageModel.Description)$><meta name="Description" content="<$PageModel.Description$>" /><$endif$>
<$if (PageModel.IsNoIndexPage)$><meta name="robots" content="noindex,nofollow,noarchive" /><$endif$>
<$PageModel.RawHeaders$>

<script>
    $(document).ready(function() {
        // We can't hide links from people who are logged in, so we need to
        // do this so they don't see two Entry links.
        // If they're logged in, see if there's a member entry link.
        // If so, hide the non-member link.
        if ($('.loginBoxProfileLink').length) {
            var memberLinks = $.grep($('.menuInner .item a'), function(el) {
                return $(el).attr('href').match('entry-member') !== null
            })

            if (memberLinks.length) {
                $('.menuInner .item a').each(function(index) {
                    var el = $(this)
                    if (el.attr('href').match('entry-non-member') !== null) {
                        el.hide()
                    }
                })
            }
        } else {
            // Wild Apricot handles this case on the server.
        }


        // Hide the date for year 9999 posts
        // This is our fake "sticky" posts.
        $('.postedOn').each(function(i) {
            var el = $(this)
            if (el.text().match('9999') !== null) {
                el.hide()
            }
        })
    })
</script>
