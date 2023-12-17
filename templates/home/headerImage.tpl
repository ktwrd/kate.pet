<div class="headerImage">
    <img src="https://res.kate.pet/image/{$image}" />
</div>
<style>
.headerImage {
    height: 20vh;
    margin-bottom: 1rem;
    display: flex;
  justify-content: center;
}
.headerImage img {
    object-fit: contain;
    object-position: center;
    max-width: min(400px, 80vw);
    height: 20vh;
    transition: 50ms;
    margin: auto;
    display: block;
}
.headerImage img:hover {
    scale: 1.05;
    transition: 50ms;
}
</style>