(() =>
{
    var old_redirect_map = [
        ['/#/links', '/p/links'],
        ['/#/since', '/p/since'],
        ['/#/portfolio', '/p/portfolio'],
        ['/#/contact', '/p/links']
    ]

    for (let pair of old_redirect_map)
    {
        if (window.location.href.endsWith(pair[0]))
        {
            window.location = pair[1]
        }
    }
})()