
<div>
    <ul class="links">
        {foreach $redirectLinks as $link}
            <a href="{$link[1]}">
                <img
                    src="https://res.kate.pet/image/links/{$link[0]}.png"
                    class="LinkTab"
                    height="71"
                    linkName="{$link[0]}"/>
            </a>
        {/foreach}
    </ul>
</div>
<a href="https://kate.pet" class="eight-img">
    <img src="/button02.gif" style="margin-top: 1rem;" />
</a>
<style>
.links a {
    text-decoration: none;
}
/* LinkTab hover animation */
.LinkTab {
    color: var(--color);
}
.LinkTab:hover {
    color: var(--color-hover);
    cursor: pointer;
}
.LinkTab,
.LinkTab:hover {
    transition: 200ms;
}
.LinkTab {
    height: min(71px, 15vw);
    max-width: min(200px, calc((200/71) * 15vw));
    --anim-filter-pre:  brightness(75%)
                        grayscale(100%)
                        sepia(10%);

    --anim-filter-post: brightness(100%)
                        grayscale(0%)
                        sepia(0%)
                        hue-rotate(360deg)
                        saturate(130%)
                        contrast(1);
}
/* animate hover filter & border */
img.LinkTab {
    border: 2px solid rgb(109, 109, 109);

    -webkit-filter: var(--anim-filter-pre);
    filter: var(--anim-filter-pre);
}
img.LinkTab:hover {
    border: 2px outset rgba(255,90,120,.7);
    cursor: pointer;

    -webkit-filter: var(--anim-filter-post);
    filter: var(--anim-filter-post);
}
img.LinkTab,
img.LinkTab:hover {
    -webkit-transition: 0.4s;
    transition: 0.4s;
}
/* styles for container */
ul.links {
    display:block;
    background-color: rgba(0,0,0,0);
}
ul.links li {
    vertical-align: top;
    margin: 4px;
    padding: 2px;
}
ul.links li img {
    height: 71px;
}
ul.links,
ul.links li {
    display: inline;
    margin: none;
    padding: 0;
    list-style: none;
}
</style>