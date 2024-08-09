document.addEventListener('DOMContentLoaded', () =>
{
    document.querySelectorAll('img').forEach((element) =>
    {
        element.setAttribute('draggable', 'false');
    });
});