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

## The AI Agent Workflow

OmniCompiler is not designed to be used directly by humans. It is a tool built for an AI. Your role is not to be the operator, but the **project manager.** The AI is your junior developer.

This is the intended workflow:

**1. Give the Tool to the AI:**
The first step is to make your AI "aware" of the OmniCompiler. You do this by providing the full source code of the `super_compiler.sh` script as part of your initial prompt or context. The AI will read the comments and functions to understand its own capabilities.

**2. State Your High-Level Goal:**
Give your AI a task, just as you would a human developer. Do not tell it *how* to compile the code; simply tell it what you want to create.

> **Your Prompt to the AI:**
> "Write a simple 'Hello World' program in C++. Then, tell me the exact command I need to run to compile it using the OmniCompiler script you have."

**3. The AI Generates the Code and the Command:**
The AI will use its knowledge to perform two actions:
*   It will write the `hello.cpp` source code.
*   It will formulate the precise OmniCompiler command needed to build that code.

> **The AI's Expected Response:**
> "Of course. Here is the C++ code for 'Hello World'. Save it in a file named `hello.cpp` inside your `~/supercompiler/project_folder/`:
>
> ```cpp
> #include <iostream>
>
> int main() {
>     std::cout << "Hello, World!" << std::endl;
>     return 0;
> }
> ```
>
> Once you have saved the file, run the following command in your terminal to compile and execute it:
>
> ```bash
> ./super_compiler.sh cpp hello.cpp
> ```"

**4. You Authorize and Execute:**
The human's final role is to authorize the action. You save the code the AI provided and run the command it generated.

This workflow maintains a crucial "human-in-the-loop" for safety, while offloading all the cognitive work of coding and command formulation to the AI.

**You provide the vision. The AI writes the code. OmniCompiler performs the action.**
