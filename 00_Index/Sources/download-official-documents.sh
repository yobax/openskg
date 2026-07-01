#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

download() {
  local url="$1"
  local out="$2"
  mkdir -p "$(dirname "$ROOT/$out")"
  echo "Downloading: $url"
  curl -L --fail --retry 3 --retry-delay 2 -o "$ROOT/$out" "$url"
}

# Japan / IPA
download "https://www.ipa.go.jp/security/guide/sme/ug65p90000019cbk-att/sme_guideline_v4.0.pdf" \
  "03_Japan/IPA/SME-Security-Guideline/Documents/IPA_sme_guideline_v4.0.pdf"

# Japan / FSA
download "https://www.fsa.go.jp/news/r7/sonota/20250704/20250704.pdf" \
  "03_Japan/FSA-金融庁/Cybersecurity-Guideline/Documents/FSA_financial_cybersecurity_guideline_20250704.pdf"

# Japan / METI
download "https://www.meti.go.jp/policy/netsecurity/downloadfiles/guide_v3.0.pdf" \
  "03_Japan/METI-経産省/Cybersecurity-Management-Guideline/Documents/METI_cybersecurity_management_guideline_v3.0.pdf"

# Japan / IPA Practice Collection
download "https://www.ipa.go.jp/security/economics/hjuojm00000044dc-att/cms_practice_v4_1.pdf" \
  "03_Japan/METI-経産省/Cybersecurity-Management-Guideline/Documents/IPA_cms_practice_v4_1.pdf"

# Japan / PrivacyMark
download "https://privacymark.jp/guideline/pm_shishin2023v1.0.pdf" \
  "03_Japan/PrivacyMark/Documents/PrivacyMark_pm_shishin2023v1.0.pdf"

# Japan / ISMAP sample public docs
download "https://www.ismap.go.jp/sys_attachment.do?sys_id=9a9431de2bf9fa90f0bbfd69fe91bfa7" \
  "03_Japan/ISMAP/Documents/ISMAP_control_criteria_sample.pdf"
download "https://www.ismap.go.jp/sys_attachment.do?sys_id=569431de2bf9fa90f0bbfd69fe91bfa2" \
  "03_Japan/ISMAP/Documents/ISMAP_control_criteria_reference_translation_sample.pdf"
download "https://www.ismap.go.jp/sys_attachment.do?sys_id=1e9431de2bf9fa90f0bbfd69fe91bfa5" \
  "03_Japan/ISMAP/Documents/ISMAP_control_criteria_manual_ch1_ch2.pdf"

# Japan / National Cybersecurity Office
download "https://www.cyber.go.jp/pdf/policy/kihon-s/cs_strategy2025.pdf" \
  "03_Japan/NISC-国家サイバー統括室/Documents/cs_strategy2025.pdf"

# Global / NIST CSF 2.0
# If this URL changes, check https://www.nist.gov/cyberframework
download "https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.29.pdf" \
  "02_Frameworks/NIST-CSF/Documents/NIST_CSWP_29_CSF_2.0.pdf"

# Global / GDPR Official PDF from EUR-Lex
download "https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:32016R0679" \
  "02_Frameworks/GDPR/Documents/GDPR_Regulation_EU_2016_679_EN.pdf"

# Note: CIS, ISO, SOC2, CSA, PCI DSS documents may require registration, login, purchase, or accepting terms.
# Use 00_Index/Sources/official-sources.md for their official source pages.

echo "Done."
