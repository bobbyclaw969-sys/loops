# Context File

## Our Stack
- **Frontend:** Static HTML/JS (GitHub Pages)
- **Backend:** Conway VM (Python, Node.js)
- **Storage:** localStorage for web apps
- **APIs:** SF Permit API, Open-Meteo Weather

## Known Pitfalls
- GitHub Pages takes 30-60s to deploy after push
- localStorage data is browser-specific
- Twilio needs app password (not regular Gmail)
- Conway VM needs Medium plan for public ports

## Rules
- Always `git add . && git commit -m "..." && git push` after changes
- Test locally before deploying
- Check PROJECTS.md for active URLs
- Never force push or rewrite git history

## Active Projects
- LocalFlows: https://bobbyclaw969-sys.github.io/local-workflows/
- ContentClaw: https://bobbyclaw969-sys.github.io/content-machine/
- Project Phoenix: https://bobbyclaw969-sys.github.io/lead-scoring/
- ConstructPro: https://bobbyclaw969-sys.github.io/constructpro/

## Common Commands
- Deploy: `git push origin gh-pages`
- Test local: Open index.html in browser
- Check status: `curl -sI <url> | head -3`

