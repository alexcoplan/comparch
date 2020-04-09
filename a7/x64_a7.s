# GAS => dest on RHS
# base address in rax

.global exA7

exA7:
  movq $0, 7000(%rdi)
.L0:
  movq 7000(%rdi), %rax
  cmpq $100, %rax
  jg .L1
  movq 3000(%rdi,%rax,8), %r10 # load B[i] into r10
  addq 5000(%rdi), %r10 # r10 += C
  movq %r10, 1000(%rdi,%rax,8) # store r10 into A[i]
  incq 7000(%rdi)
  jmp .L0
.L1:
  ret
