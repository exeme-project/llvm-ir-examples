# LLVM IR Examples

- [LLVM IR Examples](#llvm-ir-examples)
  - [Environment Setup](#environment-setup)
  - [Clone the Repository](#clone-the-repository)
  - [Building](#building)
    - [Building a Specific Example](#building-a-specific-example)
      - [Windows](#windows)
      - [Linux](#linux)
    - [Building All Examples](#building-all-examples)
      - [Windows](#windows-1)
      - [Linux](#linux-1)

## Environment Setup

  - Install the latest version of [LLVM](https://releases.llvm.org/).
  - Make sure that you select the option to **add LLVM to your PATH**.

## Clone the Repository

```bash
git clone https://github.com/exeme-project/llvm-ir-examples
```

## Building

> **Note** These examples assume your command prompt is open in the **`examples`** directory.

### Building a Specific Example

> **Note** These examples are for the **`hello-world`** example. Replace *`hello-world`* with the name of the example you want to build.

#### Windows

```bash
cd hello-world
clang main.ll -o main.exe
main.exe
```

#### Linux

```bash
cd hello-world
clang main.ll -o main
./main
```

### Building All Examples

#### Windows

```bash
build-all.bat
```

#### Linux

```bash
./build-all.sh
```