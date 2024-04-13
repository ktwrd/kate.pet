**Note:** This is my longest blog post so far, and I haven't written something this long since high school.

<hr/>

The modern web is (usually) developed with the most bloated, headache-inducing, hellbent toolchains that I have ever seen. The main issue I have with the current state of the web is the unnecessary usage of client-side JavaScript, and the bloated toolchains and frameworks that are used to develop what we call the modern web.

A few months ago, I decided to use PHP for my personal website because I was bloody sick of dealing with the JavaScript ecosystem. So I ported everything over, rewrote a lot of the CSS that was used, dropped unnecessary features (jukebox/visualizer), removed CSS frameworks that I was using for a handful of features from, and implemented my blog into the rewrite. While working on porting my personal website to PHP I was astonished with how long it took to render and view the homepage. Server-side, it only takes <1ms to generate a page, and about 750ms for the site to completely load on the current version of Chromium. (Same network, going through WAN and back to LAN, no caching, over WiFi 5)

## The Beginning
Ever since I was young, I've aspired to make a positive impact to the world with the help of computers (how ironic, since every techbro says this). I was very fortunate (and unfortunate) to grow up in a household with Cable internet my entire life, and that my father is also a programmer. While watching my father WFH 10-15+ years ago, I was extremely fascinated with what he was doing, and that I wanted to do something like that when *I* grew up.

While developing my new website and working on the dashboard for Xenia ([project homepage](https://xenia.kate.pet)), it made me realise how bloated and slow the web has gotten in the past 10 years. I started my web development journey in mid-late 2016, since I got a domain name and a VPS as an early birthday present from my parents. That website was *also* made in PHP, but my PHP programming skills have barely progressed since then.

## Frontend Libraries
After landing my first job with a startup in my city, I started to dive into the world of Frontend JavaScript libraries (that aren't JQuery). Vue.js was my first Frontend JavaScript library that I actually enjoyed working with, and it gave me a lot of motivation to try and do the frontend development thing again. So I made the *first* version of kate.pet (now [old.kate.pet](https://old.kate.pet/)) completely with Vue.js *and* a cool visualiser in the background! Was it cool? Fuck yeah, it was! Was it slow on cellular? Fuck yeah! Was is mobile compatible? Fuck no!

When I was initially starting development of the first version of this website, everything worked so well, and all the libraries worked seamlessly together! Then after Vue.js 3 came out, it started to become a pain in the ass to add new features and develop new things (and to try out new libraries for Vue.js 2.x, since a lot of things were dropping support for it), because when I would ask for help online all the resources that I would be pointed were utterly useless or was updated for Vue.js 3.x (which made the resource useless for me).

Soon after those versioning issues started happening on my personal website, it started to happen at work, where we had to always be on a secure and stable version of whatever packages we were using. If you've used Github's Dependabot before, then you would know how many emails you'd get about vulnrabilities and how important it can be to stay on the latest version of a library that you're using. But we all now know that's not the case all the time because of the [recent `xz-utils` backdoor](https://tukaani.org/xz-backdoor/).

## New Beginnings
At the beginning of 2023 I left my first job to start a new one, where I would be getting paid fairly for my work. But sadly that fell through because of [all the layoffs](https://techcrunch.com/2024/04/10/tech-layoffs-2023-list/) that were happening at that time. Which I was sadly affected by since I was made redundant between the time I left my first job, and before I was supposed to start my new one.

Since I had nothing to do, I started working on a discord bot for fun! Xenia was (and still is) an experiment to expand my knowledge in C# software development, and to fill a gap in the market with the [BanSync](https://xenia.kate.pet/guide/about_bansync) and [RolePreserve](https://xenia.kate.pet/guide/about_rolepreserve) features. I've learnt so much while working on Xenia. From the basics of developing/maintaining a *modern* discord bot, automated software deployment, and now fast and efficient frontend web development with Blazor.

For (pretty much) every single day between being made redundant, and starting a new role in May 2023, I was putting a lot of love and effort into Xenia. Especially since that Xenia helped me stay afloat with staying in a good headspace while looking for jobs and trying to stay alive. Because of that, I had ample time to start thinking of what library to use when I eventually add a Dashboard or Web-based Administration Panel to it.

## That one library
Obviously, I was going to use ASP.NET Blazor for the core rendering of all pages in the Xenia Dashboard, but I really wanted to add some sort of reactivity to the Dashboard. There was a plethroa of libraries that I could use to implement this feature. I could've used Vue.js (which I already had 1yr+ experience with), React, Angular, Svelte, or whatever hot garbage was trending on Hacker News.

But there was one outlier from all the frontend frameworks/libraries, it was ***HTMX***.

Aside from the shitposts/jokes that regularly get posted on [their Twitter](https://twitter.com/htmx_org), it's actually quite pleasant to work with.

About a month ago, I messed around with a small HTMX test page while I was having a quiet day at work, and what I realized is that HTMX is actually really cool and pleasant to work with. Do you want to submit a form without reloading the page? You can do that with a handful of HTML attributes and bugger-all backend code!

For that example, you can really easily do that with the [hx-post](https://htmx.org/attributes/hx-post/) attribute on a &lt;form&gt; element, which will swap out itself with whatever HTML is returned from the backend (which should be the same form for my example).

After I mucked around at work with HTMX, I decided what my library of choice for the Xenia Dashboard would be, which is HTMX. The file size is insignificant, everything makes sense, really easy to learn, and dare I say, *blazingly fast?*

The following is an excerpt from my branch to implement HTMX into the Xenia Dashboard. All it does is create an infinitely scrolling table of the servers you're in.
```html
<h3>Guilds</h3>
<table id="adminServerSelect" class="table table-bordered table-sm">
    <thead>
    <!-- usual header stuff here -->
    </thead>
    <tbody hx-get="/Admin/Components/ServerList"
           hx-target="this"
           hx-swap="innerHTML"
           hx-trigger="load"
           hx-indicator=".htmx-indicator"
           id="serverListContainer">
           <!-- the component that gets put here
                just creates a row for every server
                the user shares with Xenia -->
    </tbody>
</table>
<div class="d-flex justify-content-center">
    <div class="spinner-border htmx-indicator" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
```

It's extremely easy to add reactive elements to a project with HTMX, which makes it extremely easy to add HTMX into an existing project or add it from the begining. With the Xenia Dashboard I've been working on implementing HTMX for a total of only ~2 days and all the heavy work has been done and I have fully implemented HTMX into Xenia Dashboard. In my opinion, HTMX has definently lowered the barrier of entry into creating reactive web applications with little effort.

Previously, my goal was to try and get Rust everywhere, but now that I work in the Government sector and I can't really do that, I'll now try my best to implement HTMX where possible, and throw away the old, slow, and bloated frontend libraries that waste the time of Healthcare workers every day.