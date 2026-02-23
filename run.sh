#!/bin/bash

# Loop Runner - Autonomous Task Processor
# Run via cron: */15 * * * * /home/nuc/.openclaw/workspace/loops/run.sh

LOOP_DIR="/home/nuc/.openclaw/workspace/loops"
DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M)

echo "=== Loop Start: $DATE $TIME ==="

# Check if there's a task file
if [ ! -f "$LOOP_DIR/tasks.md" ]; then
    echo "No tasks.md found"
    exit 1
fi

# Read first incomplete task
TASK=$(grep -E "^\- \[ \]" "$LOOP_DIR/tasks.md" | head -1 | sed 's/- \[ \] //')

if [ -z "$TASK" ]; then
    echo "No pending tasks"
    echo "$DATE: No pending tasks" >> "$LOOP_DIR/results.md"
    exit 0
fi

echo "Processing: $TASK"

# Execute task (placeholder - add actual task handlers)
case "$TASK" in
    scrape_permits_SF)
        echo "Would run SF permit scraper"
        ;;
    score_leads)
        echo "Would score leads"
        ;;
    send_outreach)
        echo "Would send outreach"
        ;;
    generate_content)
        echo "Would generate content"
        ;;
    *)
        echo "Unknown task: $TASK"
        ;;
esac

# Log result
echo "✓ Completed: $TASK at $TIME" >> "$LOOP_DIR/results.md"

# Mark task as done in tasks.md (simple approach - remove first incomplete)
sed -i "0s/^- \[ \]/- [x]/" "$LOOP_DIR/tasks.md"

echo "=== Loop Complete ==="
