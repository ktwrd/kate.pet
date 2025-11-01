Ticketing System written in-house for allowing trusted/partnered game server owners to directly report cheating players, cheat software, and vulnerabilities.

Integrates with the Steam API for handing out game bans in waves once a player has been marked as a "cheater." Also integrates with our internal Gitea for issue tracking.

Uses PostgreSQL, C#, [ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/), (w/ [Identity](https://github.com/dotnet/AspNetCore/tree/main/src/Identity)), [Entity Framework Core](https://github.com/dotnet/efcore), [HTMX](https://htmx.org), Bootstrap 5.3, and some TypeScript for complex components. The Partner App also directly integrates with the Database for our internal Gitea instance to synchronize profile information, and project boards.
