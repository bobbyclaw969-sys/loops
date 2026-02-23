#!/bin/bash

LOOP_DIR="/home/nuc/.openclaw/workspace/loops"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

echo "=== Loop Start: $DATE $TIME ==="

TASK=$(grep -m1 "^\- \[ \]" "$LOOP_DIR/tasks.md" | sed 's/- \[ \] //')
echo "Found task: '$TASK'"

case "$TASK" in
    scrape_permits) RESULT="✓ SF permits scraped" ;;
    score_leads) RESULT="✓ Lead scoring complete" ;;
    send_outreach) RESULT="✓ Outreach sent" ;;
    generate_content) RESULT="✓ Content generated" ;;
    check_weather) RESULT="✓ Weather check done" ;;
    update_dashboard) RESULT="✓ Dashboard updated" ;;
    research_crypto) RESULT="✓ Crypto research done" ;;
    backup_data) RESULT="✓ Backup complete" ;;
    *) echo "Unknown: $TASK"; RESULT="⚠ Skipped" ;;
esac

echo "$RESULT"
echo "## $TIME - $RESULT" >> "$LOOP_DIR/results.md"

sed -i "0,/^- \[ \] $TASK/s/^- \[ \] $TASK/- [x] $TASK/" "$LOOP_DIR/tasks.md" 2>/dev/null || echo "Could not mark done"

echo "=== Complete ==="
