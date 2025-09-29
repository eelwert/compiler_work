#include "mylib.h"
#include <stdio.h>  // 提供 printf 的声明
// 静态函数（只在当前文件可见）
static void internal_helper() {
    printf("Internal helper function\n");
}

void helper_function() {
    internal_helper();
    printf("Helper function called\n");
}