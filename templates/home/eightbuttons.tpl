
<div class="eightbuttons">
    <ul>
        {foreach $eightButtons as $btn}
            <li>
                {if isset($btn[1])}
                    <a href="{$btn[1]}">
                        <img src="{$btn[0]}" height="31" />
                    </a>
                {else}
                    <img src="{$btn[0]}" />
                {/if}
            </li>
        {/foreach}
    </ul>
</div>
<style>
.eightbuttons {
    position: absolute;
    bottom: calc(15px);
    left: 0;
    width: 100vw;
    text-align: center;
}
.eightbuttons * img {
    height: min(31px, 4vh);
}
.eightbuttons ul,
.eightbuttons ul li {
    display: inline;
    margin: none;
    padding: 0;
    list-style: none;
}
.eightbuttons ul {
    display: inline-block;
    max-width: 90vw;
    margin-bottom: 0.1rem;
}

.eightyeightthirtyone,
.eightyeightthirtyone img,
.eightbuttons ul li a img,
.eightbuttons ul li img {
    transition: 100ms;
}
.eightyeightthirtyone:hover,
.eightyeightthirtyone img:hover,
.eightbuttons ul li a img:hover,
.eightbuttons ul li img:hover {
    position: relative;
    transform: scale(2);
    transition: 100ms;
}

.eightbuttons a:hover {
    text-decoration: none;
}
</style>