(() =>
{
    var old_redirect_map = [
        ['/#/links', '/p/links'],
        ['/#/since', '/p/since']
    ]

    for (let pair of old_redirect_map)
    {
        if (window.location.href.endsWith(pair[0]))
        {
            window.location = pair[1]
        }
    }
})()