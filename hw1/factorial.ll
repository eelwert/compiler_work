; ModuleID = 'factorial.c'
source_filename = "factorial.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"
; 全局字符串常量
@.str.input = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.output = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
; 主函数定义
define dso_local i32 @main() #0 {
entry:
  ; 变量声明和初始化
  %retval = alloca i32, align 4
  %counter = alloca i32, align 4
  %n = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ; 读取输入
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.input, i64 0, i64 0), i32* noundef %n)
  ; 初始化计数器和结果
  store i32 2, i32* %counter, align 4
  %init_counter = load i32, i32* %counter, align 4
  %print_counter = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.output, i64 0, i64 0), i32 noundef %init_counter)
  store i32 1, i32* %result, align 4
  ; 跳转到循环检查
  br label %loop.header
loop.header:                                       ; preds = %loop.body, %entry
  %current_counter = load i32, i32* %counter, align 4
  %current_n = load i32, i32* %n, align 4
  %cmp = icmp sle i32 %current_counter, %current_n
  br i1 %cmp, label %loop.body, label %loop.exit
loop.body:                                         ; preds = %loop.header
  ; 计算阶乘
  %current_result = load i32, i32* %result, align 4
  %current_value = load i32, i32* %counter, align 4
  %mul = mul nsw i32 %current_result, %current_value
  store i32 %mul, i32* %result, align 4
  ; 更新计数器
  %next_counter = add nsw i32 %current_value, 1
  store i32 %next_counter, i32* %counter, align 4
  br label %loop.header, !llvm.loop !6
loop.exit:                                         ; preds = %loop.header
  ; 打印结果
  %final_result = load i32, i32* %result, align 4
  %print_result = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.output, i64 0, i64 0), i32 noundef %final_result)
  ret i32 0
}
; 外部函数声明
declare i32 @__isoc99_scanf(i8* noundef, ...) #1
declare i32 @printf(i8* noundef, ...) #1
; 函数属性
attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
; 元数据
!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}