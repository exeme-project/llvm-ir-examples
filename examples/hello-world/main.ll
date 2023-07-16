@str = constant [15 x i8] c"Hello, World!\0A\00" ; '\0A' is a newline, '\00' is the null terminator

declare i32 @puts(i8*) ; external declaration for the puts function

; declaration of main function
define i32 @main() { ; return type is i32, no parameters
  %1 = getelementptr [15 x i8], [15 x i8]* @str, i64 0, i64 0 ; convert [15 x i8]* to i8*

  call i32 @puts(i8* %1) ; call puts to write out string to stdout
  ret i32 0 ; return a success code
}