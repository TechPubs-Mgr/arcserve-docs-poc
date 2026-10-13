# fix_rst_conversion.ps1
#
# Cleans up known Pandoc HTML->RST conversion artifacts for the
# Arcserve Console SaaS Release Notes migration.
#
# Fixes applied to every .rst file in the target folder:
#   1. Removes empty "-" placeholder bullets that Pandoc inserts
#      before nested lists (e.g. "Secondary tasks:" -> empty "-" -> sub-list).
#   2. Removes stray "|" line-block markers left over from <br> tags.
#   3. Converts standalone "**Bold Text**" lines (nothing else on the
#      line) into real RST sub-headings, underlined with "-".
#   4. Rewrites image substitution paths from the original
#      "Resources/Images/<name with spaces>.png" to
#      "/_static/images/<name_with_underscores>.png", and copies /
#      renames the actual image files into source\_static\images\.
#
# USAGE (run from PowerShell, after Pandoc conversion):
#   .\fix_rst_conversion.ps1 -RstFolder ".\rst-test" -ImagesSourceFolder ".\Resources\Images" -ImagesDestFolder ".\source\_static\images"
#
# Start with -RstFolder pointing at rst-test\ to verify on the 3-4
# sample files before running against the full batch of 47.

param(
    [Parameter(Mandatory=$true)]
    [string]$RstFolder,

    [Parameter(Mandatory=$false)]
    [string]$ImagesSourceFolder = ".\Resources\Images",

    [Parameter(Mandatory=$false)]
    [string]$ImagesDestFolder = ".\source\images"
)

if (-not (Test-Path $RstFolder)) {
    Write-Host "ERROR: RST folder not found: $RstFolder" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $ImagesDestFolder)) {
    New-Item -ItemType Directory -Path $ImagesDestFolder -Force | Out-Null
    Write-Host "Created $ImagesDestFolder"
}

$rstFiles = Get-ChildItem -Path $RstFolder -Filter "*.rst"
Write-Host "Found $($rstFiles.Count) .rst file(s) in $RstFolder`n"

foreach ($file in $rstFiles) {
    Write-Host "Processing: $($file.Name)"
    $lines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
    $newLines = New-Object System.Collections.Generic.List[string]
    $changesInFile = 0

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $trimmed = $line.Trim()

        # --- Fix 1: empty "-" placeholder bullet ---
        if ($trimmed -eq "-") {
            $changesInFile++
            continue  # skip this line entirely
        }

        # --- Fix 2: stray "|" line-block marker ---
        if ($trimmed -eq "|") {
            $changesInFile++
            continue  # skip this line entirely
        }

        # --- Fix 3: standalone "**Bold**" line -> RST heading ---
        if ($trimmed -match '^\*\*(.+)\*\*$') {
            $headingText = $Matches[1]
            $newLines.Add($headingText)
            $newLines.Add("-" * $headingText.Length)
            $changesInFile++
            continue
        }

        # --- Fix 4: image substitution path rewrite ---
        # Matches lines like: .. |image1| image:: Resources/Images/Add%20a%20storage%20array.png
        if ($trimmed -match '^\.\.\s+\|(\w+)\|\s+image::\s+Resources/Images/(.+)$') {
            $imageTag = $Matches[1]
            $encodedName = $Matches[2]

            # Decode %20 (and other basic URL encoding) back to spaces first
            $decodedName = [System.Uri]::UnescapeDataString($encodedName)

            # Replace spaces with underscores for the new filename
            $newFileName = $decodedName -replace ' ', '_'

            # Copy the source image (original name, with spaces) to the
            # destination folder under its new underscore name, if not done already
            $sourceImagePath = Join-Path $ImagesSourceFolder $decodedName
            $destImagePath = Join-Path $ImagesDestFolder $newFileName

            if (Test-Path $sourceImagePath) {
                if (-not (Test-Path $destImagePath)) {
                    Copy-Item -Path $sourceImagePath -Destination $destImagePath
                    Write-Host "  Copied image: $decodedName -> $newFileName"
                }
            } else {
                Write-Host "  WARNING: source image not found: $sourceImagePath" -ForegroundColor Yellow
            }

            $newLines.Add(".. |$imageTag| image:: /images/$newFileName")
            $changesInFile++
            continue
        }

        # No fix needed, keep line as-is
        $newLines.Add($line)
    }

    if ($changesInFile -gt 0) {
        # Write as UTF-8 without a BOM, so Sphinx/RST doesn't see a stray
        # byte-order-mark character at the top of the file
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllLines($file.FullName, $newLines, $utf8NoBom)
        Write-Host "  -> $changesInFile fix(es) applied`n" -ForegroundColor Green
    } else {
        Write-Host "  -> no changes needed`n"
    }
}

Write-Host "Done."
