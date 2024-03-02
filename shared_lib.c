/*
** EPITECH PROJECT, 2024
** main.c
** File description:
** ASM_asmminilibc_2024
*/

#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

size_t (*strlen)(const char*);

int main() {
    void* handle;
    char* error;

    // Load the library
    handle = dlopen("./libasm.so", RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "%s\n", dlerror());
        exit(EXIT_FAILURE);
    }
    dlerror(); // Clear any existing error

    // Recover the symbol for strlen
    *(void**) (&strlen) = dlsym(handle, "strlen");
    if ((error = dlerror()) != NULL) {
        fprintf(stderr, "%s\n", error);
        exit(EXIT_FAILURE);
    }

    // Call the symbol and print the result
    size_t length = strlen("Hello, World!\n");
    printf("Length: %zu\n", length);

    // Unload the library
    dlclose(handle);
    return 0;
}
