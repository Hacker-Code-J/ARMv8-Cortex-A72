# ARMv8-Cortex-A72
ARM64 Architecture and Programming for Raspberry Pi 4B

## File Structure


```shell
project/
│
├── bin/                 # The final binary (executable) will be placed here
│
├── obj/                 # Compiled object files (.o) will be stored here
│
├── src/                 # Assembly source files
│   ├── main.s           # Main assembly file
│   └── utils.s          # Additional source files (optional)
│
├── practice/
│   ├── Makefile
│   ├── chap1.s
│   ├── chap2.s
│   └── ...
│
├── Makefile             # Makefile to automate build process
└── README.md            # Optional: Project documentation
```