<style>
@import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono&display=swap');

@keyframes float {
    0% {
        drop-shadow: 0 5px 15px 0px rgba(0,0,0,0.6);
        transform: translatey(0px) rotate(0deg);
    }
    25% {
        transform: translatey(-10px) rotate(2deg);
    }
    50% {
        drop-shadow: 0 25px 15px 0px rgba(0,0,0,0.2);
        transform: translatey(-20px) rotate(0deg);
    }
    75% {
        transform: translatey(-10px) rotate(-2deg);
    }
    100% {
        drop-shadow: 0 5px 15px 0px rgba(0,0,0,0.6);
        transform: translatey(0px) rotate(0deg);
    }
}

body {
    background-image: linear-gradient(0deg, rgb(3,3,3), rgb(4,4,4), rgb(6,6,6), rgb(3,3,3));
}

.not-found {
    text-align: center;
    width: 100%;
}
.not-found img {
    margin-top: 5rem;
    width: min(400px, 100%);
    animation: float 6s ease-in-out infinite;
}

.credits {
    position: fixed;
    bottom: 0;
    width: 100%;
    text-align: center;
}
a {
    font-family: "JetBrains Mono", monospace;
    font-optical-sizing: auto;
    font-weight: 400;
    font-style: normal;
    color: #fff;
}
</style>

<div class="not-found">
<img src="/img/NotFound.png" />
<br/>
{include file="404/back.tpl" pageName="$pageName"}
</div>

<div class="credits">
    <a href="https://github.com/SAWARATSUKI/ServiceLogos">credits</a>
</div>