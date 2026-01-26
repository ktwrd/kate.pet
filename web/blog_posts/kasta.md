For the past few months, I've been working on *another* side project created out of pure spite. There aren't that may pieces of free open-source software that are a combination of Imgur, Pastebin, and a file uploading service (like file.io) that are built well, don't perform like ass, and aren't designed to be a cloud drive (like Nextcloud). Currently I have XBackBone deployed on my home server for quickly sharing files when I'm on my phone (and it's too large for discord) or I'm on one of my Linux machines where I don't have a ShareX-like application installed.

XBackBone is the slowest piece of software I've used, to the point where it can take up to a minute just to load the main screen (which is the file listing). I've gotten so bloody fed up with how slow and frustrating XBackBone is that I created my own "clone", called Kasta ("throw" in Swedish).

Made in C# with ASP.NET Core (duh!!!) using PostgreSQL as it's backend and Redis/KeyDB for caching (which is optional). Homepage loads in less than 500ms on LAN, comes with image preview generation, audit logging, OAuth support, fine-grained permission system, per-user storage & upload quota, and an interface that isn't ass to use or excruciatingly slow to load.

Currently it's in an open beta (under GPL v2), but you gotta host it yourself! I'm not a techbro with mid fringe and an infinite budget from daylight robbery hosting providers (*cough* theo *cough*), I just work on software for fun outside of my day job (which is also programming). 

[Take a peek on the Github Repo if you're interested](https://github.com/ktwrd/Kasta), and if you have any bugs/suggestions pls make an issue. (Pull Requests are also greatly appreciated)

<img class="allow-image-filtering" src="/img/blog/firefox_1506_K10H17LkIG.png" alt="Screenshot of the Kasta web application, displaying a list of uploaded images with their; filename, date created, file size, sharing status, and file size."/>
