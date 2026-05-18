# Shell Scripts

A collection of Bash scripts built while learning Linux scripting.

---

## file-comparator

A Bash script that compares two text files and outputs unique and common lines along with a summary.

### What it does
- Lines only in file1
- Lines only in file2
- Lines common in both files
- Summary count of each category

### How to run

```bash
chmod +x compare.sh
./compare.sh file1.txt file2.txt
```

### Sample Output

```
Lines only in file1:
Paneer do Pyaza

Lines only in file2:
Kashmiri Aloo Dum
Fried Rice

Lines common in file1 & file2:
Butter naan
Garlic chicken

Summary:
Only in file1: 1
Only in file2: 2
Common lines: 2
```

### Concepts used
- Process substitution `<(sort file)` to avoid creating temp files
- `comm` for line-by-line file comparison
- Input validation with `$#` and `-f` flags
- `wc -l` for counting output lines

### Edge cases handled
- Missing arguments
- One or both files not existing

---

## find_repeats.sh

Finds repeated substrings in a single file and outputs LZ77-style tokens.

**Usage:**
```bash
bash find_repeats.sh input.txt
```

**Example:**

Input:
```
ABCABCABC
```

Output:
```
A
B
C
(3,3)
(6,3)
```

- Single character = no match, output as literal
- `(3,3)` = match found 3 positions back, copy 3 characters

**Errors:**
```
Usage: bash find_repeats.sh <input_file>   # no argument given
Error: File 'x' not found                  # file doesn't exist
```
---

*More scripts will be added as I keep learning.*
