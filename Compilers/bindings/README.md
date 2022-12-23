# GCC

## Show assembly

```
gcc -g -O3 main.c
gdb
> disass/m main
```
Or
```
gcc -g -O3 main.c && objdump -dS -M intel a.out > disass.s
```
