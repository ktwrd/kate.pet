{include file="header.tpl" title="kate's portfolio" description="all of the notable stuff i've worked on in the past few years."}
<h1 class="italic">portfolio</h1>
<strong>note:</strong> this <i>isn't a full/complete list</i> of all projects i've contributed to, it's a truncated list of the things i'm actually proud of.

<div class="row d-flex flex-row">
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                Personal Website v2 (<a href="https://github.com/ktwrd/kate.pet">git repo</a>)
                <div class="card-header-sm">
                    Dec 2023 - Current
                </div>
            </div>
            <div class="card-body">
                Built with PHP, Smarty, and a lot of custom CSS.</br>
                </br>
                Got sick of the whole Javascript ecosystem and I wanted<br/>
                a break and a way to easily combine my blog and my<br/>
                homepage.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                Personal Website v1 (<a href="https://old.kate.pet">see</a>)
                <div class="card-header-sm">
                    Jan 2022 - Nov 2023
                </div>
            </div>
            <div class="card-body">
                Built with Vue.js v2, Bootstrap, and butterchurn.<br/>
                </br>
                New versions are published and deployed on every commit</br>
                with Github Actions and it's hosted with Github Pages.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                Xenia Bot (<a href="https://xenia.kate.pet">website</a>, <a href="https://github.com/ktwrd/xeniabot">github</a>)
                <div class="card-header-sm">
                Jan 2023 - Current
                </div>
            </div>
            <div class="card-body">
                Another General-purpose FOSS Discord bot written<br/>
                in C# with Discord.NET and MongoDB.<br/>
                <br/>
                There is also a dashboard available for the bot,<br/>
                written in C# using ASP.NET MVC, MongoDB, OAuth, and
                Discord.NET.<br/>
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                Custom DRM and Copy Protection
                <div class="card-header-sm">
                May 2023 - Aug 2023
                </div>
            </div>
            <div class="card-body">
                <strong>Unable to demo or explain in details due to this<br/>
                being work at a previous employer.</strong><br/>
                <br/>
                Custom DRM and Copy Protection written with;<br/>
                <ul>
                    <li>Rust (Container for encrypted application,<br/>
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
                SixGrid (<a href="https://sixgrid.kate.pet">website</a>, <a href="https://github.com/sixgrid">github</a>)
                <div class="card-header-sm">
                Dec 2020 - Current
                </div>
            </div>
            <div class="card-body">
                A Free and Open-Source Desktop Client for<br/>
                e926 and websites using the same api (like e621)<br/>
                that is built with; Electron with Vue.js for the<br/>
                desktop client which implements Google's Material<br/>
                Design, C# (ASP.NET MVC API) for the Analytic Server.<br/>
                <br/>
                It also implements Steam integration with<br/>
                <a href="https://github.com/greenheartgames/greenworks">Greenworks</a> via a closed-beta.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                88x31 (<a href="https://88x31.kate.pet">website</a>)
                <div class="card-header-sm">
                Aug 2022 - Current
                </div>
            </div>
            <div class="card-body">
                A collection of the 88x31 buttons of the past.<br/>
                Similar to what is at the bottom of my homepage.
            </div>
        </div>
    </div>
    <div class="m-1 col-auto">
        <div class="card card-classic">
            <div class="card-header">
                OpenSoftwareLauncher (<a href="https://github.com/ktwrd/opensoftwarelauncher">github</a>)
                <div class="card-header-sm">
                Sep 2022 - Jan 2023
                </div>
            </div>
            <div class="card-body">
                Open Software Launcher, an Open-Source framework for<br/>
                developing your own launcher for internal applications.<br/>
                <br/>
                Created while I was working at <a href="https://minalyze.com">Minalyze</a>, in order to find<br/>
                a solution to manage automatic updates, distrubiting betas,<br/>
                quickly deploying and publishing new versions, and managing<br/>
                licenses for their staff and external companies.<br/>
                <br/>
                <strong>Note:</strong> Doesn't include launcher since that was made<br/>
                internally at Minalyze.<br/>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}