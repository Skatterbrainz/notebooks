# r@nD0m Stu77

## Optimal Config Storage Designs

I had 3 minutes between conference calls, and was postulating some prophetic pontification about the impact of how app-devs store configuration settings. In this case, I was focusing on a file-system oriented model. But this also applies to other mediums like the Registry, CIM or some form of database; because these are ultimately undeniably, file-based as well. So all you fancy apps need to sit down and deal with the same file table linking and pointer challenges that tricycle-riding ASCII files have to contend with. Where was I?... oh yeah.

So, basically (hold on, sipping more cold coffee... .. ....... . . . . . . ) this is about when app-devs decide to lean towards human readability as the "quality" metric, versus
raw/pure/nitrox-inhaling performance metric. One dev told me years ago that the only metric for performance is that which uses the fewest CPU operation cycles. The goal is to get to 1. Literally, one electron movement. The Holy Grail. That which would demand all ye kneeleth before thee in total awe. (insert church chorus here)



### Design A

```text
010220110
```

Where app/service/bong-idea parses the numeric string into corresponding setting values. For example:

```
0 = Disable Feature X
1 = Enable Feature Y
0 = Disable Feature Z
2 = Set verbose mode to High
2 = Set warning level to High
0 = Disable Some Other Feature
...and so on
```

### Design B

```
FeatureX=DISABLE
FeatureY=ENABLE
FeatureZ=DISABLE
VerbosityLevel=HIGH
WarningLevel=HIGH
SomeOtherFeature=DISABLE
```

### Design C

A hybrid of A and B to mitigate extensive character use only.

```
X=0
Y=1
Z=0
VL=2
WL=2
SOF=0
```

### Compare and Contrast

From a process-load optimization aspect:

* Design A is most efficient and uses the least amount Heap space and storage linking (performant).
* Design B is most useful from a human interface aspect (aesthetic).
* Design C is any representation that is quantifiably larger than A but qualifiably less readable than B.
* Confused? good.

### Design Impact

At the bottom end of the workload scale, this block is created one time and read at least each time a relevant service or application is initiated (you thought I was going to say 'Launched', didn't you.). Therefore the overhead impact of writing once, and reading multiple times, is almost zero.

At the other end of the imaginary workload scale, this block is written multiple times (think ephemeral VDI sessions), and read multiple times, but multiply this associated execution block by 10^n (where n is the sum of all lobbyist money paid to all politicians in a lifetime). You get the idea.

Without a budget and a cup of coffee, I'm going to put on my 4th year college statistics course hat, which I earned a 4.0 in every semester of night school, and try to remember just one page of my textbook, and postulate that the "curve" is geometric (zero at lower left, and infinity at top right, ha ha).

The implications are obvious: storing information for human's to interact with most efficiently (conveniently) doesn't incur much performance overhead