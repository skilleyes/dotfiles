# Clang Tidy when using cmake

```
clang-tidy hpc/movements/outdoor_movement.cpp -checks='-*,cpp*,read*,clang*' -p build
```

`build` being the cmake build directory
we can add the `-header-filter='.*'` option
