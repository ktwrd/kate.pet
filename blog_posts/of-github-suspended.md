This morning at 11:32am AWST (UTC+08:00), [Fraeven](https://bsky.app/profile/fraeven.dev) (one of the Open Fortress) developers, pinged myself and [Elliot](https://bsky.app/profile/elliotskeleton.bsky.social) (one of the project leads) asking if we can access the Open Fortress GitHub. I could, Elliot could not. At that point, we had no idea what had happened, except that for no reason, some of our developers has their accounts suspended.

This news was quite shocking for a lot of us, so we all started scrambling for answers. After checking each member in the organization, all but one owner of the organization has their GitHub account suspended. This also included 2 other notable OF Team members, [Stachekip](https://bsky.app/profile/stachekip.bsky.social) and [Kay](https://bsky.app/profile/kaydemonlp.bsky.social). The reason that GitHub gave the affected accounts was the following:

```text
Hello,

GitHub is meant to be used as a collaborating and hosting tool 
for software developers. We're unable to see activity on your 
account that indicates that it's being used for the intended 
purpose. For this reason we will not be removing the restrictions 
from this account at this time.
```

After reading that, a lot of the other devs were quite shocked, since we've all been actively pushing commits, creating issues, commenting on issues, modifying issues, and using GitHub for it's intended purpose! Hell, Fraeven made commits to the sdk13-gigalib ([mirror](https://git.redfur.cloud/openfortress/sdk13-gigalib)) repository a couple of days ago.

After trying to franticly backup any of the stuff that myself and `erem2k` could access, we realized that all the issues in the repository were also deleted. 5 years of issues (bug reports, task tracking, feature requests, etc...) are now gone. I tried to migrate the repositories to my own Gitea instance, but the issue is that I can backup everything *except* the issues, which are the most important thing for our development backlog.

<a href="https://share.kate.pet/d/b6qUIK0V" target="_blank"><img class="allow-image-filtering" src="https://share.kate.pet/f/b6qUIK0V"/></a>

This is a setback for us, since we're currently preparing for a Steam release, and we still have a fair chunk to do before the game is ready to release. Because of this, I've backed up all of my GitHub repositories to my [Gitea instance](https://git.redfur.cloud/kate) for safe keeping, which I strongly recommend any sane developer to do. (have a mirror of all their repositories on multiple Git services, e.g; GitLab, Codeberg, etc...)

So if the release of Open Fortress gets delayed, you can blame GitHub for blindly using their (most likely) AI moderation tools.
