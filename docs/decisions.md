# Frozen implementation decisions

These choices define generator version 1 and serialization version 1. Change the version when changing logical generated values or canonical encodings. Benchmark observations are not part of this document.

## Hashing and deterministic data

The 64-bit mixer uses unsigned arithmetic modulo 2^64:

```text
x = (x XOR (x >> 30)) * 0xbf58476d1ce4e5b9
x = (x XOR (x >> 27)) * 0x94d049bb133111eb
return x XOR (x >> 31)
```

Hash keys with `mix64(uint64(key) XOR 0xd6e8feb86659fd93)`. Golden values for keys 0, 1, and UINT32_MAX are `b55a8fa067537a73`, `509252f3a8113dfc`, and `13e3f7b9953ddd63`. Mask by capacity minus one; resolve collisions by linear probing. Separate occupancy bytes preserve the full uint32 key domain. The load limit is floor(0.7 * capacity), calculated without multiplication overflow. Aggregation starts at 1024 slots. Join reserves the smallest power of two satisfying the load limit, including one empty slot for an empty dimension. A resize temporarily holds old and new buffers, both charged to the budget.

The generator uses eleven independent `std::mt19937_64` engines. Stream i is seeded with `mix64(seed XOR (0x9e3779b97f4a7c15 * (i+1)))`, modulo 2^64. IDs are:

| ID | Purpose |
| --- | --- |
| 0 | Fact score |
| 1 | Fact amount |
| 2 | Uniform group key |
| 3 | Hot-group decision |
| 4 | Non-hot group key |
| 5 | Join-match decision |
| 6 | Uniform matching customer key |
| 7 | Hot-customer decision |
| 8 | Non-hot matching customer key |
| 9 | Nonmatching customer key |
| 10 | Customer region |

For a positive bound b, reject draws x below `(-uint64(b)) % b`, then return `x % b`. Every fact advances all streams 0–9, including inactive decisions. Use bound 1 for degenerate tail/matching domains. Stream 10 advances once per dimension row. A 90% hot distribution picks key 0 below decision 9000/10000 and uniformly picks another key otherwise. Nonmatches are uniform over [M, 2^32). Q1/Q2 unused customer generation uses M=100000, match probability 100%, uniform distribution; unused group generation uses 1024 uniform groups. Scores and amounts therefore do not change with group/join settings. Dimension rows are allocated only for Q3.

## Canonical encodings

Checksums use FNV-1a-64, offset `14695981039346656037`, prime `1099511628211`. This is a deterministic diagnostic checksum, not a cryptographic proof of equality. The preflight compares complete result arrays. Integers are little-endian, independent of host byte order and struct padding. Text is encoded as a u64 byte length followed by its bytes. All tags below are ASCII.

Input: text `vquery-input-v1`, text `facts`, u64 fact count, then `(u32 customer_id, u32 group_id, u64 amount, u32 score)` per fact; text `customers`, u64 dimension count, then `(u32 customer_id, u32 region_id)` per customer.

Result: text `vquery-result-v1`, text CLI query name, u64 result-row count, then rows sorted by group key. Each row contains u32 key (omitted for Q1), u64 count, u64 sum. CLI JSON uses `key: null` for Q1. Amounts/sums are nonnegative under the supported input bounds. JSON checksums are 16 lowercase hexadecimal digits.

A validation ID is SHA-256 of the manifest excluding `validation_id`, encoded using Python `json.dumps(sort_keys=True, separators=(",", ":"), ensure_ascii=True)` as UTF-8. The manifest binds the complete normalized configuration, result/input checksums, source revision/dirty state, and SHA-256 identities of both executables. Preserve `validation.json` beside the run files.

## Deliberate implementation refinements

- Keep row and batch operators in one implementation file and worker coordination with the aggregate sink until size justifies further splitting. There are no empty placeholder modules.
- `execute(QuerySpec, const Tables&, ExecutionContext&)` performs constant-time defensive checks inside the timer. Generation, full fixture value validation, and checksum computation remain outside it.
- The budget uses a mutex around allocation reservations/releases. Query loops do not lock for each row. This makes concurrent reservations atomic; it measures requested buffer capacities, not allocator overhead or RSS.
- Query-local hash state, batch buffers, and result storage are budgeted. Operator objects, thread stacks/runtime, JSON text, small fixed control state, and Python preflight memory are excluded and must not be confused with a process limit.
- A tiny warmup can request excessive repetition. Fail when K > 10000 instead of capping K silently. Zero warmups select K=1 for smoke/exploratory runs.
- Raw metadata references are relative filenames so runs remain valid after moving a complete directory. Raw files are created exclusively; completion metadata is replaced atomically after successful close. This is crash-detection metadata, not an fsync-based durability guarantee.
- Unknown hardware properties are null. Parallel publication requires a detected physical-core budget; exploratory checks can still run on a restricted machine.
- Linux is the performance-study and sanitizer validation platform. macOS/ARM64 is supported for development. Local sandbox restrictions may prevent sanitizer runtime startup; this is not a passing sanitizer result.
