.data
input_prompt:   .asciz "Enter a number: "
output_prompt:  .asciz "Factorial is: "
newline:        .asciz "\n"
buffer:         .space 16       # 输入缓冲区

.text
.globl main

main:
    # 保存寄存器
    addi sp, sp, -32
    sd ra, 24(sp)
    sd s0, 16(sp)    # 保存 n
    sd s1, 8(sp)     # 保存 i
    sd s2, 0(sp)     # 保存 f

    # 打印输入提示
    li a0, 1          # stdout
    la a1, input_prompt
    li a2, 16         # 字符串长度
    li a7, 64         # sys_write
    ecall

    # 读取整数 (系统调用 read)
    li a0, 0          # stdin
    la a1, buffer     # 使用专用缓冲区
    li a2, 16         # 读取最大长度
    li a7, 63         # sys_read
    ecall

    # 将ASCII转换为整数
    la a1, buffer     # 缓冲区地址
    li t1, 0          # 初始化结果为0
    li t2, 10         # 十进制基数
    li t4, 0          # 数字计数器

convert_loop:
    lb t0, 0(a1)      # 读取当前字符
    beqz t0, convert_done  # 遇到空字符结束
    
    # 检查是否为数字字符
    li t3, '0'
    blt t0, t3, convert_next
    li t3, '9'
    bgt t0, t3, convert_next
    
    # 转换当前数字
    addi t0, t0, -'0' # 字符转数字
    mul t1, t1, t2    # 结果 *= 10
    add t1, t1, t0    # 结果 += 当前数字
    addi t4, t4, 1    # 数字计数器+1

convert_next:
    addi a1, a1, 1    # 移动指针
    j convert_loop

convert_done:
    mv s0, t1         # s0 = n
    beqz t4, exit     # 如果没有有效数字则退出

    # 初始化变量
    li s1, 1          # i = 1 (从1开始乘)
    li s2, 1          # f = 1

    # 检查 n <= 1 的情况
    li t0, 1
    ble s0, t0, print_result

while_loop:
    # 检查 i > n
    bgt s1, s0, print_result
    
    # f = f * i
    mul s2, s2, s1
    
    # i = i + 1
    addi s1, s1, 1
    
    j while_loop

print_result:
    # 打印输出提示
    li a0, 1          # stdout
    la a1, output_prompt
    li a2, 13         # 字符串长度
    li a7, 64         # sys_write
    ecall

    # 将整数转换为ASCII字符串
    la a1, buffer     # 使用缓冲区
    addi a1, a1, 15   # 指向缓冲区末尾
    sb zero, 0(a1)    # 添加字符串终止符
    addi a1, a1, -1
    
    mv a2, s2         # 要转换的值
    li t0, 10         # 除数
    
    beqz a2, zero_case # 处理0的特殊情况

convert_int:
    rem t1, a2, t0    # t1 = a2 % 10
    div a2, a2, t0    # a2 = a2 / 10
    addi t1, t1, '0'  # 转换为ASCII
    sb t1, 0(a1)      # 存储字符
    addi a1, a1, -1   # 移动指针
    bnez a2, convert_int
    j print_done

zero_case:
    li t1, '0'
    sb t1, 0(a1)

print_done:
    # 打印结果
    li a0, 1          # stdout
    addi a1, a1, 1    # 调整到字符串开始
    la a2, buffer
    addi a2, a2, 16
    sub a2, a2, a1    # 计算长度
    li a7, 64         # sys_write
    ecall

    # 打印换行
    li a0, 1
    la a1, newline
    li a2, 1
    li a7, 64
    ecall

exit:
    # 恢复寄存器并退出
    ld s2, 0(sp)
    ld s1, 8(sp)
    ld s0, 16(sp)
    ld ra, 24(sp)
    addi sp, sp, 32
    
    # 退出程序
    li a0, 0          # 退出码 0
    li a7, 93         # sys_exit
    ecall