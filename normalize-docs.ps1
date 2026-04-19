$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$files = Get-ChildItem -Path $root -Recurse -Filter '*.md' | Where-Object { $_.FullName -notmatch '\\.git\\' }

foreach ($f in $files) {
  $text = Get-Content -Raw -Path $f.FullName

  # Remove non-ASCII mojibake artifacts
  $text = [regex]::Replace($text, '[^\u0000-\u007F]', '')

  # Fix malformed fence markers and make normalization idempotent
  $text = $text.Replace("`\txt", '```txt')
  $text = [regex]::Replace($text, '(?m)^`+\s*mermaid\s*$', '```mermaid')
  $text = [regex]::Replace($text, '(?m)^`+\s*jsx\s*$', '```jsx')
  $text = [regex]::Replace($text, '(?m)^`+\s*txt\s*$', '```txt')
  $text = [regex]::Replace($text, '(?m)^`{4,}\s*$', '```')
  $text = [regex]::Replace($text, '(?m)^`\s*$', '```')

  # Fix escaped newline artifacts
  $text = $text.Replace('`n', [Environment]::NewLine)

  # Normalize headings
  $text = [regex]::Replace($text, '(?m)^##\s+.*What is it\?$', '## What is it?')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Why do we need it\?$', '## Why do we need it?')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Real-life analogy$', '## Real-life analogy')
  $text = [regex]::Replace($text, '(?m)^##\s+.*How does it work\?$', '## How it works')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Diagram$', '## Diagram')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Code Example.*$', '## Code Example')
  $text = [regex]::Replace($text, '(?m)^###\s+.*Wrong Way$', '### Wrong Way')
  $text = [regex]::Replace($text, '(?m)^###\s+.*Right Way$', '### Right Way')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Common Mistakes$', '## Common Mistakes')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Best Practices$', '## Best Practices')
  $text = [regex]::Replace($text, '(?m)^##\s+.*When to use it\?$', '## When to use it?')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Related concepts$', '## Related concepts')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Quick Revision$', '## Quick Revision')
  $text = [regex]::Replace($text, '(?m)^##\s+.*Interview Questions$', '## Interview Questions')
  $text = [regex]::Replace($text, '(?m)^##\s+\s+', '## ')
  $text = [regex]::Replace($text, '(?m)^###\s+\s+', '### ')

  # Ensure language marker in non-README docs
  if ($f.Name -ne 'README.md' -and $text -notmatch '(?m)^Language:\s+English\s*$') {
    $headerMatch = [regex]::Match($text, '(?m)^#\s+.+$')
    if ($headerMatch.Success) {
      $insertAt = $headerMatch.Index + $headerMatch.Length
      $text = $text.Insert($insertAt, "`r`n`r`nLanguage: English")
    }
  }

  Set-Content -Path $f.FullName -Value $text -Encoding UTF8
}

Write-Host 'Normalization complete.'
