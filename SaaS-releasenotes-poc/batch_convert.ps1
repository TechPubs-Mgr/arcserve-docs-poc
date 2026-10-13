# batch_convert.ps1
#
# Batch-converts the remaining TOC-referenced .htm topics (from RN_SaaS)
# to .rst using Pandoc, with an explicit filename mapping.
#
# An explicit list (not auto-slugified) is used deliberately: two source
# files - "Console Related.htm" (under Limitations) and
# "console_related.htm" (under Known Issues) - would otherwise produce
# the same output filename and silently overwrite each other.
#
# USAGE (run from the SaaS-releasenotes-poc project root, where the
# loose .htm files and Images\ folder live):
#   .\batch_convert.ps1 -OutputFolder ".\rst-batch"

param(
    [Parameter(Mandatory=$false)]
    [string]$OutputFolder = ".\rst-batch"
)

if (-not (Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
    Write-Host "Created $OutputFolder"
}

$pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if (-not $pandoc) {
    Write-Host "ERROR: pandoc not found on PATH. Install/verify Pandoc first." -ForegroundColor Red
    exit 1
}

$pairs = @(
    @{ Src = "AS_AI_anomaly_related.htm"; Dst = "as_ai_anomaly_related.rst" }
    @{ Src = "AS_malware_related.htm"; Dst = "as_malware_related.rst" }
    @{ Src = "Console Related.htm"; Dst = "console_related_limitations.rst" }
    @{ Src = "DR_related_lim.htm"; Dst = "dr_related_lim.rst" }
    @{ Src = "Features.htm"; Dst = "features.rst" }
    @{ Src = "Instant VM Related.htm"; Dst = "instant_vm_related.rst" }
    @{ Src = "Instant Virtual Machine Related.htm"; Dst = "instant_virtual_machine_related.rst" }
    @{ Src = "Known Issues.htm"; Dst = "known_issues.rst" }
    @{ Src = "Limitations.htm"; Dst = "limitations.rst" }
    @{ Src = "Metadata_synctn_related.htm"; Dst = "metadata_synctn_related.rst" }
    @{ Src = "Nutanix_related_lim.htm"; Dst = "nutanix_related_lim.rst" }
    @{ Src = "Read-Only_ds_related_kn_issue.htm"; Dst = "read_only_ds_related_kn_issue.rst" }
    @{ Src = "Release Notes.htm"; Dst = "release_notes.rst" }
    @{ Src = "Virtual Standby Related.htm"; Dst = "virtual_standby_related.rst" }
    @{ Src = "arcserve_crs_acnt_related_knI.htm"; Dst = "arcserve_crs_acnt_related_kni.rst" }
    @{ Src = "arcserve_crs_acnt_related_lim.htm"; Dst = "arcserve_crs_acnt_related_lim.rst" }
    @{ Src = "arcserve_crs_ds_related_kn_issue.htm"; Dst = "arcserve_crs_ds_related_kn_issue.rst" }
    @{ Src = "cc_rn_contact_arcserve.htm"; Dst = "cc_rn_contact_arcserve.rst" }
    @{ Src = "cc_rn_lang_support.htm"; Dst = "cc_rn_lang_support.rst" }
    @{ Src = "cloud_cyber_resilient_data_store_related_lim.htm"; Dst = "cloud_cyber_resilient_data_store_related_lim.rst" }
    @{ Src = "cloud_cyber_resl_ds_related.htm"; Dst = "cloud_cyber_resl_ds_related.rst" }
    @{ Src = "console_related.htm"; Dst = "console_related_known_issues.rst" }
    @{ Src = "copyright.htm"; Dst = "copyright.rst" }
    @{ Src = "data_store_related_lim.htm"; Dst = "data_store_related_lim.rst" }
    @{ Src = "dr_related.htm"; Dst = "dr_related.rst" }
    @{ Src = "enhancements_august(2023).htm"; Dst = "enhancements_august_2023.rst" }
    @{ Src = "enhancements_jan(2026).htm"; Dst = "enhancements_jan_2026.rst" }
    @{ Src = "enhancements_nov(2023).htm"; Dst = "enhancements_nov_2023.rst" }
    @{ Src = "features_enhancements (January, 2023).htm"; Dst = "features_enhancements_january_2023.rst" }
    @{ Src = "features_enhancements (July, 2026).htm"; Dst = "features_enhancements_july_2026.rst" }
    @{ Src = "features_enhancements (June, 2023).htm"; Dst = "features_enhancements_june_2023.rst" }
    @{ Src = "gateway_related.htm"; Dst = "gateway_related.rst" }
    @{ Src = "issues_fixed.htm"; Dst = "issues_fixed.rst" }
    @{ Src = "license_related_lim.htm"; Dst = "license_related_lim.rst" }
    @{ Src = "new_features_enhancements_Nov(2025).htm"; Dst = "new_features_enhancements_nov_2025.rst" }
    @{ Src = "new_features_enhancements_Oct_2024.htm"; Dst = "new_features_enhancements_oct_2024.rst" }
    @{ Src = "new_features_enhancements_april(2025).htm"; Dst = "new_features_enhancements_april_2025.rst" }
    @{ Src = "new_features_enhancements_july(2025).htm"; Dst = "new_features_enhancements_july_2025.rst" }
    @{ Src = "periodic_maintenance.htm"; Dst = "periodic_maintenance.rst" }
    @{ Src = "proxmox_related.htm"; Dst = "proxmox_related.rst" }
    @{ Src = "proxmox_related_kn_issue.htm"; Dst = "proxmox_related_kn_issue.rst" }
    @{ Src = "restote_related_lim.htm"; Dst = "restote_related_lim.rst" }
    @{ Src = "rman_related.htm"; Dst = "rman_related.rst" }
    @{ Src = "rman_related_lim.htm"; Dst = "rman_related_lim.rst" }
)

Write-Host "Converting $($pairs.Count) files to $OutputFolder ...`n"

$successCount = 0
$missingCount = 0

foreach ($pair in $pairs) {
    $srcPath = $pair.Src
    $dstPath = Join-Path $OutputFolder $pair.Dst

    if (-not (Test-Path $srcPath)) {
        Write-Host "MISSING: $srcPath (not found - skipped)" -ForegroundColor Yellow
        $missingCount++
        continue
    }

    & pandoc $srcPath -f html -t rst -o $dstPath

    if (Test-Path $dstPath) {
        Write-Host "OK: $($pair.Src) -> $($pair.Dst)"
        $successCount++
    } else {
        Write-Host "FAILED: $($pair.Src)" -ForegroundColor Red
    }
}

Write-Host "`nDone. $successCount converted, $missingCount missing/skipped."
