<small>to my employer reading this blog post, all of my work relating to this blog post **was not** done on company time and hardware</small>

For the past ~6 months I've been working more with [Adastral Group](https://adastral.net) on a backend management system for the Adastral Launcher. Recently, I have reached the point where said management system is stable enough for a public[^note3] release. With that being said, I have the opportunity to discuss some cool stuff that myself (and the team) have been working on in the shadows.

Under the hood, Adastral mainly depends on [butler](https://github.com/itchio/butler)[^note2], which is the patching software made by the developers at [itch.io](https://itch.io). The founder of Adastral, intcoms, has already mentioned some optimizations that he has made to butler in his own blog post[^note1], but I've been working on something that will make Adastral much better than any other sourcemod launcher in the long-term (and software distribution methods in general).

Intcoms found multiple issues with butler that make it unnecessarily slow for our use case, which is for large-ish game updated (e.g; Open Fortress v19 to v21). This is frustrating when we are testing our software, and when the end-user is installing or updating their game. For context, most of our Open Fortress players usually have relatively low-spec computers when compared to players of most AAA games, since that is what usually attracts people to playing *some* Source Engine mods.

There are numerous issues with our current usage of butler, which are:
- Slow patch generation time
- Slow patch apply time (compared to Steam)
- Large patch size
- Previous versions need to be fully extracted into a directory[^note4]

Intcoms has fixed some of these issues by replacing the hashing algorithm that's currently used (md5) with highwayhash, which has significantly increased the patch time, and generation time. But this isn't enough for me; I want it to be faster, I want the files to be smaller, I want it to be **the best**.

## (re)Discovery
Around a year and a bit ago, I was going through a manic episode due to some mental health issues, and I decided that I would write a competitor to Steam and Microsoft's Software Delivery/Deployment feature in SCCM. I wrote up a patching system that was (at the time) the fastest solution I was aware of, including a whole-ass backend to manage it, and I believe I lost it, or so I thought. After digging through my computer for a few hours, I found a couple of screenshots and notes about *how* my implementation worked.

It took about 4 weeks of tinkering and trying my best to remember what I did to create a proof of concept program that was able to generate, apply, and verify updates with my own format.

## How it works

This patching library/method/system, called Northam (because of Adastral's naming scheme[^note5]), is about 12x-17x faster than Steam when I benchmarked it recently with the new Factorio update. (From build `15397692`[^factorio-patch1] to `16181832`[^factorio-patch2])

Steam took 3min 35s for the "Updating", "Patching", and "Installing" stages (as reported by the status text below the "Manage Downloads" button). Northam took 2.59s to verify the game files, and 9.86s to apply said patch. The download size for Northam was ~1.3gb (which included deltas, new files, and files to delete), and Steam's reported download size was ~1.1gb (with a ~200mb `.delta` file).

Northam uses a modified version of the rdiff algorithm that is used in rsync and depends heavily on C#'s `Parallel.ForEach` method to ensure that multithreaded systems can benefit greatly[^note6] by using Northam instead of a different patching library. The chunk size that is being used for diffing files is 256kb and the patch/signature files are binary formatted to ensure that it can be read as fast as possible (which takes ~800ms for a 164mb file).

Not everything will be revealed on how Northam works under the hood since it's currently faster than anything we're currently using (and Steam)

## Benchmarks

<details><summary>System Specifications for Benchmarks</summary>

- Windows 10 Enterprise 21H2
- Intel i9-11900KB @4.9GHz ([Intel NUC 11 Extreme Barebone Kit - Core i9 11th Gen](https://www.mwave.com.au/product/intel-rnuc11btmi90004-nuc-11-extreme-barebone-kit-core-i9-11th-gen-ac46641))
- 48GB DDR4 Memory @ 2666MHz (1x32GB, 1x16GB)
- [Crucial P5 Plus 2TB PCIe M.2 2280SS SSD](https://www.crucial.com/ssd/p5-plus/ct2000p5pssd8)
- [NVIDIA GeForce RTX 3060 Ti](https://www.mwave.com.au/product/gigabyte-geforce-rtx-3060-ti-aorus-elite-8gb-video-card-rev-20-lhr-version-ac46146)

</details>

### Factorio
Build `15397692`[^factorio-patch1] to `16181832`[^factorio-patch2]

Files changed: 12,370

Size Difference: +200mb

|                          | Steam    | Butler | Northam (v3.2) |
| ------------------------ | -------- | ------ | -------------- |
| Download Size            | **1.1GB**    | 1.2GB  | 1.3GB          |
| Generate Patch           |          | 37.2s  | **28.62s**         |
| Verify (before)          | 1-2s     | 5.19s  | **2.213s**         |
| Verify (after)           | 1-2s     | 5.39s  | **2.59s**          |
| Apply                    | 3min 35s | 17.18s | **9.86s**          |
| Signature Size (before)  |          | **1.28MB** | 26.6MB         |
| Signature Size (after)   |          | **1.31MB** | 28.5MB         |

<details>
<summary>Reproducing Test Results</summary>

Terminal Recordings;
- [Northam v3.2](https://res.kate.pet/upload/04ef45032741/WindowsTerminal_yTbvIN2LAc.mp4)

Downloads
- [Factorio Patch 15397692](https://res.kate.pet/adastral/patchgen-test/factorio_15397692.tar)
- [Factorio Patch 16181832](https://res.kate.pet/adastral/patchgen-test/factorio_16181832.tar)
- [Northam v3.2 Console Output](https://res.kate.pet/adastral/patchgen-test/factorio-log-20250126.txt)
- [Butler Console Output](https://res.kate.pet/adastral/patgen-test/factorio-butler-log-20250126.zip)

</details>

### Counter-Strike 2
Build `16333861`[^cs2-patch1] `16432265`[^cs2-patch2]

Files changed: 136

Size Difference: -3.65GB

|                         | Steam     | Butler    | Northam (v3.2) |
| ----------------------- | --------- | --------- | -------------- |
| Download Size           | 13.75GB   | **9.19GB**    | 10.1GB         |
| Generate Patch          |           | 27min 15s | **3min 31s**       |
| Verify (before)         | 2min 3s   | 1min 32s  | **36.432s**        |
| Verify (after)          | 2min 9s   | 1min 36s  | **32.998s**        |
| Apply                   | 11min 55s | 2min 58s  | **44.388s**        |
| Signature Size (before) |           | **20.8MB**    | 545.5MB        |
| Signature Size (after)  |           | **21.9MB**    | 573.4MB        |

<details>
<summary>Reproducing Test Results</summary>

Downloads
- [CS2 Build 16333861](https://res.kate.pet/adastral/patchgen-test/cs2_16333861.tar)
- [CS2 Build 16432265](https://res.kate.pet/adastral/patchgen-test/cs2_16432265.tar)

Terminal Recordings
- [Northam v3.2](https://res.kate.pet/upload/0c7505c2c174/WindowsTerminal_G6nX2zVT8q.mp4)
- Steam
  - [CS2 Verify \(branch 1.40.4.7) Screen Recording \(SteamCMD)](https://res.kate.pet/upload/2878b9759bd1/cmd_eAMF2JNVYI.mp4)
  - [CS2 Apply & Download \(build 16333861 to 16432265) Screen Recording \(SteamCMD)](https://res.kate.pet/upload/1b2161810814/cmd_EAZ0R7EIKu.mp4)
  - [CS2 Verify \(build 16432265) Screen Recording \(SteamCMD)](https://res.kate.pet/upload/b93d9710ce48/cmd_ZVdpuJQGwX.mp4)

</details>

### Open Fortress
Alpha `v19` to `v21`

Files changed: 2,260

Size Difference: -12.3MB

|                 | Butler (Modified) | Butler   | Northam (v3.2) |
| --------------- | ----------------- | -------- | -------------- |
| Download Size   | 174mb             | 174mb    | **161.7MB**        |
| Generate Patch  | 30s               | 1min 12s | **13.864s**        |
| Verify (before) |                   |          | **4.7s**           |
| Verify (after)  |                   |          | **4.98s**          |
| Apply           | 2s                | 4s       | **1.297s**         |

**Note:** Unable to test w/ Steam since OF doesn't have it's own AppID & I don't want to break my partner agreement.

<details>
<summary>Reproducing Test Results</summary>

Downloads
- [Open Fortress v19](https://beans.adastral.net/of-19.tar.zstd)
- [Open Fortress v21](https://beans.adastral.net/of-21.tar.zstd)
- [Console Output](https://res.kate.pet/adastral/patchgen-test/of-log-20250126.txt)

Terminal Recordings
- [Northam v3.2](https://res.kate.pet/upload/51b6f4872ce1/WindowsTerminal_tbS8Bdvqbw.mp4)
</details>

### Notes

- This blog post was first created on the 14th of November 2024.
- Unable to provide the "Generate Patch" metrics for Steam, since recreating that could be slightly different to the actual time it took for the developers.
- Steam applies game patches to a staging directory *while* the update is downloading. Due to this feature, the "Apply" metric may be unreliable. This mainly impacts games that don't use a custom "bundle" file format (like VPKs).
- The script that was used in the Northam v3.2 recordings can be found [here](https://res.kate.pet/adastral/patchgen-test/Northam-Test.ps1). Requires PowerShell.

## Remarks
If you want to know details about Adastral-related releases, you can join the discord server which is available on the [Adastral Website](https://adastral.net), or you can follow the [GitHub Organization](https://github.com/AdastralGroup) and it's respective repositories.

[^note1]: [kmatter.net \(June 12, 2024). Optimizing Butler for fun and profit](https://kmatter.net/posts/2024-06-12-optimising-butler-pt2/). [Archived](https://archive.is/ztpQD)
[^note2]: [kmatter.net \(January 7, 2024). A Year and a bit: What's happened?](https://kmatter.net/posts/2024-01-07-a-year-and-a-half/). [Archived](https://archive.is/fXfTM)
[^note3]: [GitHub.com \(October 24. 2024). Release 2024.10: Cockatoo Goes Public](https://github.com/AdastralGroup/Cockatoo/releases/tag/2024.10). [Archived](https://archive.is/56kss)
[^note4]: [Offline usage \(diffing & patching) - The butler manual](https://itch.io/docs/butler/offline.html). [Archived](https://archive.is/Wfo08)
[^note5]: [GitHub.com \(October 31. 2023). The Adastral Sort-of-Technical Document \(aka The Blue Book). What's with the names?](https://github.com/AdastralGroup/adastral-docs/blob/main/bluebook.md#whats-with-the-names). [Archived](https://archive.is/tANUe)
[^note6]: [Microsoft Learn. Parallel.ForEach Method \(System.Threading.Tasks). "Remarks" section](https://learn.microsoft.com/en-us/dotnet/api/system.threading.tasks.parallel.foreach?view=net-8.0). [Archived](https://archive.is/wZKxz)

[^factorio-patch1]: [SteamDB.info \(August 27. 2024). Version 1.1.110 released as stable - Factorio](https://steamdb.info/patchnotes/15397692/)
[^factorio-patch2]: [SteamDB.info \(November 8. 2024). Version 2.0.15 released as stable - Factorio](https://steamdb.info/patchnotes/16303643/)

[^cs2-patch1]: [SteamDB.info \(November 8. 2024). Update 16333861 - Counter-Strike 2](https://steamdb.info/patchnotes/16333861/)
[^cs2-patch2]: [SteamDB.info \(November 17. 2024). Update 16432265 - Counter-Strike 2](https://steamdb.info/patchnotes/16432265/)
