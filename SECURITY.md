# SPDX-FileCopyrightText: 2025 Micheal
# SPDX-License-Identifier: GPL-3.0-or-later

# Security

This project executes files placed into `~/supercompiler/project_folder`. That means running or building files through the script can execute arbitrary code on your machine. Treat this project as a developer convenience only and follow these safety recommendations.

Responsible disclosure
- If you find a security vulnerability, please contact the repository owner at the email address listed in `CONTRIBUTING.md` (or open a private issue) and do not publicly disclose the issue until it's patched.

Recommendations for safe use
- Only place trusted files into `~/supercompiler/project_folder`.
- For untrusted code, run the script inside an isolated environment (VM, container, or sandbox) with minimal privileges.
- Consider creating a dedicated user account for building untrusted projects.
- Use filesystem snapshots or temporary VMs when testing arbitrary projects.
- Avoid running the script as root.

Mitigations you can add
- Use `--dry-run` mode (not present by default) to preview actions before they run.
- Add a per-project whitelist to only allow certain extensions or signed packages.
- Use file-level permission checks and GPG-signed release artifacts for distribution.

Contact
- Report security issues privately: gamemansavestheday@gmail.com