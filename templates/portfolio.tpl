{include 
    file="header.tpl" 
    title="kate's portfolio" 
    description="all of the notable stuff i've worked on in the past few years."
    use_jquery=""
    use_bootstrap_js=""}
<h1 class="italic">portfolio</h1>
<strong>note:</strong> this <i>isn't a full/complete list</i> of all projects i've contributed to, it's a truncated list of the things i'm actually proud of.<br/>

<div class="row d-flex flex-row">
    <div class="m-1 col-auto">
        <div class="card card-classic" id="beans-rs">
            <div class="card-header">
                <img src="/img/openfortress-logo.png" class="img-sm" alt="openfortress-logo" />
                <img src="/img/rustlang-logo.svg" class="img-sm" alt="rustlang-logo"/>
                beans-rs (<a href="https://github.com/ktwrd/beans-rs">git repo</a>)
                <div class="card-header-sm">
                    May 2024 - Current
                </div>
            </div>
            <div class="card-body">
                Rewrite of the <a href="https://github.com/int-72h/ofinstaller-beans">beans</a> installer for <a href="https://openfortress.fun">Open Fortress</a> in Rust<br/>
                <br/>
                Brings many improvements to stability, performance, and doesn't get blocked by Windows Defender (since the old version used pyinstaller). It also has lower memory/CPU overhead when compared
                to the original installer, and only depends on glibc on Linux.<br/>
                <br/>
                Also includes a GUI written with FLTK for it's dialog system, but not a fully flegded one since this will get replaced by <a href="https://github.com/adastralgroup/">Adastral</a> at some point.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic" id="cockatoo">
            <div class="card-header">
                <img src="/img/adastral-logo.png" class="img-sm" alt="adastral-logo"/>
                <img src="/img/csharp-logo.svg" class="img-sm" alt="csharp-logo"/>
                Cockatoo (<a href="https://github.com/AdastralGroup/Cockatoo">git repo</a>)
                <div class="card-header-sm">
                    June 2024 - Current
                </div>
            </div>
            <div class="card-body">
                Version and Release Management for <a href="https://adastral.net">Adastral</a>. In-use for generating patches, and releases for (currently) Source Engine Mods. Is also used for the management of brandings
                for usage in the <a href="https://github.com/AdastralGroup/osprey">Adastral Launcher</a>.<br/>
                Uses MongoDB, Bootstrap, C# ASP.NET Core MVC, HTMX, and OAuth2/LDAP Authentication.
                <sup>pretty much OpenSoftwareLauncher but better</sup>
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/rustlang-logo.svg" class="img-sm" alt="rustlang-logo"/>
                rustgrab (<a href="https://github.com/ktwrd/rustgrab">git repo</a>)
                <div class="card-header-sm">
                    May 2024 - Current
                </div>
            </div>
            <div class="card-body">
                Screenshot and File Upload Utility written in Rust.<br/>
                <br/>
                Intended to be a powerful utility for Linux users that were Windows users that are used to <a href="https://getsharex.com">ShareX</a>.<br/>
                <small>Fork of <a href="https://github.com/sharexin/sharexin">sharexin</a> with more features and QoL improvements.</small>
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/csharp-logo.svg" class="img-sm" alt="csharp-logo"/>
                Xenia Bot (<a href="https://xenia.kate.pet">website</a>, <a href="https://github.com/ktwrd/xeniabot">github</a>)
                <div class="card-header-sm">
                Jan 2023 - Current
                </div>
            </div>
            <div class="card-body">
                Another General-purpose FOSS Discord bot written
                in C# with Discord.NET and MongoDB.<br/>
                <br/>
                There is also a <a href="https://xb.kate.pet">dashboard</a> available,
                written in C# using ASP.NET, <a href="https://htmx.org/">htmx</a>, MongoDB, and
                Discord.NET.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/php-logo.svg" class="img-sm" alt="php-logo"/>
                Personal Website v2 (<a href="https://github.com/ktwrd/kate.pet">git repo</a>)
                <div class="card-header-sm">
                    Dec 2023 - Current
                </div>
            </div>
            <div class="card-body">
                Built with PHP, Smarty, and a lot of custom CSS.</br>
                </br>
                Got sick of the whole Javascript ecosystem and I wanted
                a break and a way to easily combine my blog and my
                homepage.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/php-logo.svg" class="img-sm" alt="php-logo"/>
                Xenia Bot Website (<a href="https://github.com/ktwrd/XeniaBot-Website">git repo</a>)
                <div class="card-header-sm">
                    Jan 2024 - Current
                </div>
            </div>
            <div class="card-body">
                Fork of <a href="https://github.com/ktwrd/kate.pet">Personal Website v2</a>, with extra features such as;
                <ul>
                    <li>Guides</li>
                    <li>Reusable Blog System</li>
                    <li>Blog System Tags</li>
                    <li>Blog Author System</li>
                </ul>
                The previous Xenia Bot website (now offline and private), was just a blog with some links.
                This new website makes Xenia feel more professional and developed, while acting as a hub
                for information relating to Xenia.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/rustlang-logo.svg" class="img-sm" alt="rustlang-logo"/>
                <img src="/img/csharp-logo.svg" class="img-sm" alt="csharp-logo"/>
                Custom DRM and Copy Protection
                <div class="card-header-sm">
                May 2023 - Aug 2023
                </div>
            </div>
            <div class="card-body">
                <strong>Unable to demo or explain in details due to this
                being work at a previous employer.</strong><br/>
                <br/>
                Custom DRM and Copy Protection written with;<br/>
                <ul>
                    <li>Rust (Container for encrypted application,
                    and FileMaker Plugin with <a href="https://github.com/mutantcows/rust_fm_plugin/">fm_plugin</a> crate)</li>
                    <li>C# (.NET 8 AoT for license file generation)</li>
                    <li>FileMaker Pro/Server 19 (Database and License Management)</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/js-logo.svg" class="img-sm" alt="js-logo"/>
                <img src="/img/vue-logo.svg" class="img-sm" alt="vue-logo"/>
                <img src="/img/electron-logo.svg" class="img-sm" alt="electron-logo"/>
                SixGrid (<a href="https://sixgrid.kate.pet">website</a>, <a href="https://github.com/sixgrid">github</a>)
                <div class="card-header-sm">
                    Dec 2020 - Current
                </div>
            </div>
            <div class="card-body">
                A Free and Open-Source Desktop Client for
                e926 and websites using the same api (like e621)
                that is built with; Electron with Vue.js for the
                desktop client which implements Google's Material
                Design, C# (ASP.NET MVC API) for the Analytic Server.<br/>
                <br/>
                It also implements Steam integration with
                <a href="https://github.com/greenheartgames/greenworks">Greenworks</a> via a closed-beta.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/js-logo.svg" class="img-sm" alt="js-logo"/>
                88x31 (<a href="https://88x31.kate.pet">website</a>)
                <div class="card-header-sm">
                    Aug 2022 - Current
                </div>
            </div>
            <div class="card-body">
                A collection of the 88x31 buttons of the past.
                Similar to what is at the bottom of my homepage.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/js-logo.svg" class="img-sm" alt="js-logo"/>
                <img src="/img/vue-logo.svg" class="img-sm" alt="vue-logo"/>
                Personal Website v1 (<a href="https://old.kate.pet">see</a>)
                <div class="card-header-sm">
                    Jan 2022 - Nov 2023
                </div>
            </div>
            <div class="card-body">
                Built with Vue.js v2, Bootstrap, and butterchurn.<br/>
                </br>
                New versions are published and deployed on every commit
                with Github Actions and it's hosted with Github Pages.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                <img src="/img/csharp-logo.svg" class="img-sm" alt="csharp-logo"/>
                OpenSoftwareLauncher (<a href="https://github.com/ktwrd/opensoftwarelauncher">github</a>)
                <div class="card-header-sm">
                    Sep 2022 - Jan 2023
                </div>
            </div>
            <div class="card-body">
                Open Software Launcher, an Open-Source framework for
                developing your own launcher for internal applications.<br/>
                <br/>
                Created while I was working at <a href="https://minalyze.com">Minalyze</a>, in order to find
                a solution to manage automatic updates, distrubiting betas,
                quickly deploying and publishing new versions, and managing
                licenses for their staff and external companies.<br/>
                <br/>
                <strong>Note:</strong> Doesn't include launcher since that was made
                internally at Minalyze.<br/>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        $('.card#beans-rs [alt=openfortress-logo]').tooltip({
            placement: 'bottom',
            title: 'Created for Open Fortress'
        });
        $('.card#cockatoo [alt=adastral-logo]').tooltip({
            placement: 'bottom',
            title: 'Developed in collaboration with Adastral Group'
        });
        $('[alt=csharp-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with C#'
        });
        $('[alt=rustlang-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Rust'
        });
        $('[alt=php-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with PHP'
        });
        $('[alt=js-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with JavaScript'
        });
        $('[alt=vue-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Vue.JS'
        });
        $('[alt=electron-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Electron'
        });
    });
</script>

{include file="footer.tpl"}
