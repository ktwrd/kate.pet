# update
As of the 17th of December 2023, the restriction has been lifted and this blog post is only here for historical records.

Nothing in this blog post is currently in affect, ***except*** the [sidenote](#sidenote), since this is all the default stuff that is logged by nginx.

<hr/>

Well someone has ruined the fun and now my [wavshare](https://wavshare.kate.pet) is now (partially) password protected.

### why?
I was notified by emma on the 18th of June at 7:57am (AWST) that the patreon leaker had their my wavshare in their bio. as soon as I was notified, I leaped out of bed and quickly disabled access to the `/HALLEYLABS` directory on my wavshare.

![screenshot showing when I was notified of my wavshare being included in the leakers bio](https://u.redfur.cloud/zkvpl)

you can view a screenshot of the leakers user profile which includes my website [here](https://u.redfur.cloud/vxzb4). i've put it in a link since it's a high-quality image and I don't want to clutter up this post

today I've been working on adding password protection to the wavshare (except some parts) since it acts as an archive for emma's old works, and it's one of the easiest ways of accessing it at the moment since [lapfoxarchive.com](http://lapfoxarchive.com) is currently down (as of writing).

### what do I do if I want access?

you can send me [an email](mailto:request-access@kate.pet) or message me on [revolt](https://r.kate.pet/revolt) or [discord](https://r.kate.pet/discord) or on my [fedi](https://xenia.social/@kate).

### what parts aren't password protected
at the moment, everything in the `/HALLEYLABS` folder is password protected. since i'm absolute shit at making nginx configs, i haven't found a way to reliably allow access to certian things under the `/HALLEYLABS` folder.

### sidenote

all authenticated requests will be logged with the following info;
- username
- public ip address
- date and time accessed
- user-agent
- what file you accessed
- what website refered you to that link
