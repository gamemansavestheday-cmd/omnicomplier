# omnicomplier
OmniCompiler: The missing link for AI. A universal build &amp; run script designed to turn any LLM into a capable software development agent, giving it the power to build, compile, and execute code.
Your AI's Hands for Software Development

Large Language Models (LLMs) are powerful brains, but they are brains in a jar. They can generate brilliant code, but they lack the "hands" to compile, run, test, and build it.

**OmniCompiler is the solution.** It is a highly-extensible Bash framework designed to be a universal API for action, bridging the gap between AI thought and real-world execution. By providing a single, stable interface for building projects across dozens of languages and game engines, OmniCompiler transforms any LLM from a simple code generator into a true, capable software development agent.

This project isn't just a compiler; it's the foundational "action space" for any AI agent that needs to interact with a developer's environment. It was built with AI-modification in mind, featuring a modular design that allows any AI to easily add support for new tools and technologies.

---

## What is OmniCompiler?

OmniCompiler is a single, powerful Bash script that provides a unified interface to build, run, and manage software projects. It is designed to be the primary tool for an AI agent operating in a development environment.

**Key Features:**

*   **Universal Support:** Provides a single command structure for a vast range of technologies, including C, C++, Java, Rust, Go, Python, C#, Node.js, Unity, Unreal Engine, Godot, and more.
*   **AI-Centric Design:** Built from the ground up for AI agents. Features extensive comments, clear modular functions, and straightforward dependency checks, making it easy for an AI to understand, use, and extend.
*   **Simple, Powerful Interface:** An AI can easily generate commands in the simple `omnicompiler <type> <target>` format, removing the need for it to memorize the specific CLI flags and quirks of every toolchain.
*   **Robust Logging:** Every action taken by the OmniCompiler is logged to a file, providing a crucial audit trail for debugging the behavior of an AI agent.
*   **Extensible Framework:** The core mission is extensibility. Adding support for a new language or tool is as simple as writing a new function and adding one line to the central dispatcher, a task easily performed by an advanced LLM.
(notes the old name was supercomplier and i forgot to remove someo of the things....)

---
---

## The OmniCompiler Workflow

The OmniCompiler is not meant to be used directly by humans. It is the execution layer for an AI agent. The workflow is a partnership between you and your AI.

**You are the Architect, the AI is the Builder.**

1.  **You Provide the Goal:** You give a high-level, natural language command to your AI agent.
    > **"Hey AI, code me a simple game in Unity."**

2.  **The AI Generates the Code:** The AI agent understands your request and generates the necessary source code files (`.cs`, `.cpp`, `.java`, etc.), placing them into the `~/supercompiler/project_folder/`.

3.  **The AI Executes the Build:** The AI's final step is to formulate the correct command for the OmniCompiler and execute it to bring the project to life.
    > **AI executes:** `./omnicompiler.sh unity MySimpleGame`

4.  **The Result:** The OmniCompiler handles the complex, tool-specific build process, logging the output. The AI can then analyze the logs to debug errors or confirm success, reporting the final result back to you.

This loop—from your high-level goal to the AI's code generation to the OmniCompiler's execution—is the core of the AI agent development process. OmniCompiler provides the critical, reliable "last mile" to turn the AI's code into a tangible result.
