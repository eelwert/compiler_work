/* 预处理阶段研究 */
#include <stdio.h>      // 标准头文件
#include "mylib.h"      // 自定义头文件

#define PI 3.1415926    // 对象宏
#define MAX(a,b) ((a)>(b)?(a):(b)) // 函数宏

#ifdef DEBUG
    #define LOG(fmt, ...) printf(fmt, __VA_ARGS__)
#else
    #define LOG(fmt, ...)
#endif
extern inline int square(int x) { return x*x; }
/* 编译阶段研究 */
// 全局变量
int global_var = 10;
static int static_var = 20; // 静态全局变量
const int const_var = 30;

// 枚举类型
enum Color { RED, GREEN, BLUE };

// 结构体和位域
struct Point {
    int x:8;
    int y:8;
    int z:8;
};

// 联合体
union Data {
    int i;
    float f;
    char str[4];
};

// 函数声明
int factorial(int n);


// 可变参数函数
void print_values(int count, ...) {
    va_list args;
    va_start(args, count);
    for (int i = 0; i < count; i++) {
        printf("%d ", va_arg(args, int));
    }
    va_end(args);
    printf("\n");
}

// 带属性的函数
__attribute__((noinline)) 
void special_function() {
    printf("This function has a special attribute\n");
}

int main() {
    // 局部变量
    int local_var = 40;
    volatile int volatile_var = 50; // 易失变量
    register int reg_var = 60;     // 寄存器变量
    
    // 使用宏
    LOG("Debug message: %d\n", global_var);
    printf("Max of 5 and 10: %d\n", MAX(5, 10));
    
    // 控制结构
    if (global_var > 5) {
        for (int i = 0; i < 5; i++) {
            switch (i % 3) {
                case RED:   printf("Red\n"); break;
                case GREEN: printf("Green\n"); break;
                case BLUE:  printf("Blue\n"); break;
            }
        }
    }
    
    // 函数调用
    printf("Factorial of 5: %d\n", factorial(5));
    printf("Square of 6: %d\n", square(6));
    
    // 结构体和指针操作
    struct Point p = { .x = 1, .y = 2, .z = 3 };
    struct Point *ptr = &p;
    printf("Point coordinates: (%d, %d, %d)\n", ptr->x, ptr->y, ptr->z);
    
    // 联合体使用
    union Data data;
    data.i = 0x12345678;
    printf("Union as int: %x, as float: %f\n", data.i, data.f);
    
    // 可变参数函数调用
    print_values(3, 10, 20, 30);
    
    return 0;
}

// 递归函数
int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n-1);
}