# SPDX-FileCopyrightText: 2025 Micheal
# SPDX-License-Identifier: GPL-3.0-or-later

# Contributing

Thanks for your interest in contributing to SuperCompiler! This project uses the Developer Certificate of Origin (DCO) to track contribution provenance.

Sign-off (DCO)
- Every commit must include a `Signed-off-by` trailer. Example:

```
Signed-off-by: Your Name <you@example.com>
```

- You can add the sign-off via `git commit -s` which will append the trailer for you.

Pull requests
- Fork the repository, create a branch, make your changes, and open a pull request targeted at `main`.
- Ensure your PR includes tests or a smoke test if you modify runtime behavior.
- Keep changes small and focused; follow existing code style and conventions.

Coding style
- Keep functions small and modular.
- Add `log_msg` calls for new behaviors to ensure they are recorded in `~/supercompiler/logs/build_log.txt`.

License
- By contributing you agree to license your contributions under the project's license (GPLv3).

Contact
- For questions about contribution or licensing, contact: gamemansavestheday@gmail.com