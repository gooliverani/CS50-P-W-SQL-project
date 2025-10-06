# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Reasons to adopt:
Random partitioning ensures an even distribution of data across all boats, preventing any single boat from becoming overloaded during peak observation times (e.g., midnight–1 AM). This promotes balanced storage utilization and avoids "hotspots" of high traffic.
Reasons not to adopt:
Queries for time ranges (e.g., "midnight–1 AM") must scan all boats because observations are scattered arbitrarily. This increases query latency and network overhead, as every boat must process the request to guarantee complete results.

## Partitioning by Hour

Time-range queries (e.g., "midnight–1 AM") target a single boat, minimizing query latency and network traffic. For example, all midnight observations reside on Boat A, enabling efficient localized searches.
Reasons not to adopt:
Uneven data distribution occurs if observations cluster in specific hours (e.g., midnight–1 AM). Boat A would bear disproportionate storage and query load, risking bottlenecks, while Boats B/C remain underutilized.

## Partitioning by Hash Value

Reasons to adopt:
Data is evenly distributed across boats regardless of observation time, preventing hotspots. Point queries (e.g., 2023-11-01 00:00:01.020) use the hash to target one boat, enabling fast lookups.
Reasons not to adopt:
Time-range queries (e.g., "midnight–1 AM") require scanning all boats because hashing scatters consecutive timestamps arbitrarily. This slows down range-based analysis and increases system-wide resource consumption.
