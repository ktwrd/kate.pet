
<div class="eight-list">
    <ul>
        {foreach $eightButtons as $btn}
            <li>
                {if isset($btn[3])}
                    <a href="{$btn[3]}" class="eight-img">
                        <img src="{$btn[2]}" width="{$btn[0]}" height="{$btn[1]}" />
                    </a>
                {else}
                    <img class="eight-img" src="{$btn[2]}" width="{$btn[0]}" height="{$btn[1]}" />
                {/if}
            </li>
        {/foreach}
    </ul>
</div>
<style>
.eight-list {
    position: absolute;
    bottom: calc(15px);
    left: 0;
    width: 100vw;
    text-align: center;
}
.eight-list * img {
    height: min(31px, 4vh);
}
.eight-list ul,
.eight-list ul li {
    display: inline;
    margin: none;
    padding: 0;
    list-style: none;
}
.eight-list ul {
    display: inline-block;
    max-width: 90vw;
    margin-bottom: 0.1rem;
}
.eight-list a:hover {
    text-decoration: none;
}

.eight-img:hover,
.eight-img img:hover {
    transition: 100ms;
}
.eight-img:hover,
.eight-img img:hover {
    position: relative;
    transform: scale(2);
    transition: 100ms;
}
</style>