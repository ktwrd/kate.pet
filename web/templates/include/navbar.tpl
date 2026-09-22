        <div class="navbar">
            <div class="row">
                <div class="col"></div>
                <div class="col-auto navbar-items">
                    <span class="text navbar-page-text">
                        kate's homepage
                    </span>
{foreach $navbarData as $item}
{if $pagename == $item['pagename']}
                    <a class="label label-primary" href="{$item['link']}">
{else}
                    <a class="label" href="{$item['link']}">
{/if}
{if isset($item['icon_url'])}
                    <img class="label-icon" src="{$item['icon_url']}" width="12px" height="12px" />
{/if}
                    {$item['alt']}
                    </a>
{/foreach}
                </div>
                <div class="col"></div>
            </div>
        </div>