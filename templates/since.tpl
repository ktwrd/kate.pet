{include file="header.tpl" title="kate's timeline" description="time since notable stuff has happened"}

<h1 class="italic">time since</h1>
<div class="center">
{foreach $since_data as $i}
    <div class="mb-3">
        <h3>{$i[1]}</h3>
        <div class="col-auto">
            <div class="row">
                <div class="col"></div>
                <div class="col-auto pr-1">
                    <div data-component="time-since-container" data-timestamp="{$i[0]}"></div>
                </div>
                <div class="col"></div>
            </div>
        </div>
    </div>
{/foreach}
</div>

<script type="text/javascript" src="/js/time-since.js"></script>

{include file="footer.tpl"}