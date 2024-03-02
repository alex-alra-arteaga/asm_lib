# asm_lib
Recreation of std lib functions in Assembly x86-64

## Description

The objective of this project is to create a dynamic ELF library to replace (to a certain extent) the standard
C library you use every day on your system

## Compilation & Usage

### Replace the standard C library

To replace the standard C library function implementations with the custom one, you can use the following command to:

#### Quick note
- Unix’s shared libraries or, shared objects, are collections of functions that your programs dynamically load
  during their execution.
- Unlike static libraries, the content of the called functions won’t be “copied” into the executable during the
  compilation’s linking process.
- Therefore, your malloc must be located in a shared library so that the system’s malloc can be replaced
  without needing to recompile the programs we want to test with malloc.

The following script does so by loading symbols manually and calling the original functions from the standard C library:

```bash
$ make
$ gcc -fPIC -shared -o libasm.so shared_lib.c && LD_PRELOAD=./libasm.so /bin/ls
```

To test remaining functions you can manually modify the `shared_lib.c` file and recompile the library.

A segmentation fault is possible in machines a part of Fedora 31, but at least means that the library is being replaced.