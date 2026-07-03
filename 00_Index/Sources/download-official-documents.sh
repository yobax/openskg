#!/bin/bash

set -e

BASE_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
DOWNLOAD_DIR="$BASE_DIR/08_Evidence-Library/Official-Documents"
SOURCE_LOG="$BASE_DIR/00_Index/Sources/download-log.md"

mkdir -p "$DOWNLOAD_DIR"

download_file () {
  local name="$1"
  local url="$2"
  local output="$3"
  local latest="$4"

  echo "Downloading: $name"
  echo "Source: $url"

  mkdir -p "$(dirname "$DOWNLOAD_DIR/$output")"

  curl -L \
    --retry 5 \
    --retry-delay 5 \
    --connect-timeout 30 \
    --max-time 300 \
    -A "Mozilla/5.0" \
    -o "$DOWNLOAD_DIR/$output" \
    "$url"

  {
    echo "## $name"
    echo ""
    echo "- Downloaded file: \`08_Evidence-Library/Official-Documents/$output\`"
    echo "- Source URL: $url"
    echo "- Latest information: $latest"
    echo "- Downloaded at: $(date '+%Y-%m-%d %H:%M:%S')"
    echo ""
  } >> "$SOURCE_LOG"
}

echo "# Official Document Download Log" > "$SOURCE_LOG"
echo "" >> "$SOURCE_LOG"

download_file \
  "IPA - 中小企業の情報セキュリティ対策ガイドライン" \
  "https://www.ipa.go.jp/security/guide/sme/ug65p90000019cbk-att/sme_guideline_v4.0.pdf" \
  "Japan/IPA/sme_guideline_v4.0.pdf" \
  "https://www.ipa.go.jp/security/guide/sme/about.html"

download_file \
  "金融庁 - サイバーセキュリティ関連資料" \
  "https://www.fsa.go.jp/news/r7/sonota/20250704/20250704.pdf" \
  "Japan/FSA/20250704.pdf" \
  "https://www.fsa.go.jp/news/"

download_file \
  "経済産業省 - サイバーセキュリティ経営ガイドライン" \
  "https://www.meti.go.jp/policy/netsecurity/downloadfiles/guide_v3.0.pdf" \
  "Japan/METI/cybersecurity_management_guidelines_v3.0.pdf" \
  "https://www.meti.go.jp/policy/netsecurity/mng_guide.html"

download_file \
  "NIST Cybersecurity Framework 2.0" \
  "https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.29.pdf" \
  "Frameworks/NIST/NIST.CSWP.29-CSF-2.0.pdf" \
  "https://www.nist.gov/cyberframework"

download_file \
  "CSA CAIQ" \
  "https://cloudsecurityalliance.org/artifacts/consensus-assessments-initiative-questionnaire-caiq" \
  "Frameworks/CSA-CAIQ/caiq-source.html" \
  "https://cloudsecurityalliance.org/artifacts/consensus-assessments-initiative-questionnaire-caiq"

echo "Done."
echo "Files saved to: $DOWNLOAD_DIR"
echo "Log saved to: $SOURCE_LOG"